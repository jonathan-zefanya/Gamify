<?php

namespace App\Console\Commands;

use App\Traits\Notify;
use Illuminate\Console\Command;
use Facades\App\Services\BasicService;
use App\Models\SellPost;
use App\Models\SellPostPayment;
use Carbon\Carbon;

class SellPostPaymentRelease extends Command
{
    use Notify;
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:sell-post-payment-release';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Sell Post Payment Release';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $now = Carbon::now();
        $basic = basicControl();

        SellPost::where('status', 1)->where('payment_lock', 1)->whereNotNull('lock_at')
            ->where('payment_status', 0)->get()->map(function ($item) use ($now, $basic) {
                if (Carbon::parse($item->lock_at)->addMinutes($basic->payment_expired) < $now) {
                    $item->lock_at = null;
                    $item->lock_for = null;
                    $item->payment_lock = 0;
                    $item->save();
                    return $item;
                };
            });


        SellPostPayment::where('payment_status', 1)->where('payment_release', 0)->with(['sellPost', 'sellPost.user'])->get()->map(function ($item) use ($now, $basic) {
            if (Carbon::parse($item->created_at)->addDays($basic->payment_released) < $now) {
                $item->released_at = $now;
                $item->payment_release = 1;
                $item->save();

                $user = $item->sellPost->user;
                $user->balance += $item->seller_amount;
                $user->save();

                $remark = 'Payment Release on ' . @$item->sellPost->title;
                BasicService::makeTransaction($user->id, $item->seller_amount, '+',
                    $item->transaction, $remark, $item->id, SellPostPayment::class);

                $this->sendMailSms($user, 'SELL_POST_PAYMENT_RELEASED', [
                    'link' => route('sellPost.details', [slug($item->sellPost->title), $item->sell_post_id]),
                    'amount' => getAmount($item->seller_amount),
                    'charge' => getAmount($item->admin_amount),
                    'currency' => $basic->currency,
                    'post' => $item->sellPost->title
                ]);

            }
        });
    }
}
