<?php

namespace App\Services\Gateway\uddoktapay;

use Facades\App\Services\BasicService;

class Payment
{
    public static function prepareData($deposit, $gateway)
    {
        $baseURL = $gateway->parameters->base_url;
        $apiKEY = $gateway->parameters->api_key;

        $fields = [
            'full_name' => $deposit->user?->fullname,
            'email' => $deposit->user?->email,
            'amount' => $deposit->payable_amount,
            'metadata' => [
                'order_id' => $deposit->trx_id
            ],
            'redirect_url' => route('ipn', [$gateway->code, $deposit->trx_id]),
            'cancel_url' => route('failed'),
        ];


        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $baseURL . "api/checkout-v2",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($fields),
            CURLOPT_HTTPHEADER => [
                "RT-UDDOKTAPAY-API-KEY: " . $apiKEY,
                "accept: application/json",
                "content-type: application/json"
            ],
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);
        $res = json_decode($response);

        if (isset($res) && $res->status) {
            $send['redirect'] = true;
            $send['redirect_url'] = $res->payment_url;
        } else {
            $send['error'] = true;
            $send['message'] = 'Unexpected Error! Please Try Again';
        }
        return json_encode($send);
    }

    public static function ipn($request, $gateway, $deposit = null, $trx = null, $type = null)
    {
        $baseURL = $gateway->parameters->base_url;
        $apiKEY = $gateway->parameters->api_key;

        $fields = [
            'invoice_id' => $request['invoice_id'] ?? $request->invoice_id
        ];

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $baseURL . "api/verify-payment",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($fields),
            CURLOPT_HTTPHEADER => [
                "RT-UDDOKTAPAY-API-KEY: " . $apiKEY,
                "accept: application/json",
                "content-type: application/json"
            ],
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        $res = json_decode($response);

        if (isset($res) && $res->status == 'COMPLETED') {
            BasicService::preparePaymentUpgradation($deposit);

            $data['status'] = 'success';
            $data['msg'] = 'Transaction was successful.';
            $data['redirect'] = route('success');
        } else {
            $data['status'] = 'error';
            $data['msg'] = 'Unsuccessful transaction.';
            $data['redirect'] = route('failed');
        }

        return $data;
    }
}
