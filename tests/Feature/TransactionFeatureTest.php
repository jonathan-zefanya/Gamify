<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Transaction;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TransactionFeatureTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test transaction can be created
     */
    public function test_transaction_can_be_created()
    {
        $user = User::factory()->create();
        
        $transaction = Transaction::create([
            'user_id' => $user->id,
            'trx_type' => 'credit',
            'amount_in_base' => 50000,
            'remarks' => 'deposit',
            'transactional_type' => 'App\Models\TopUp',
        ]);

        $this->assertDatabaseHas('transactions', [
            'user_id' => $user->id,
            'trx_type' => 'credit',
        ]);
    }

    /**
     * Test transaction amount is numeric
     */
    public function test_transaction_amount_is_numeric()
    {
        $user = User::factory()->create();
        $transaction = Transaction::create([
            'user_id' => $user->id,
            'trx_type' => 'credit',
            'amount_in_base' => 50000,
        ]);

        $this->assertIsNumeric($transaction->amount_in_base);
        $this->assertEquals(50000, $transaction->amount_in_base);
    }

    /**
     * Test transaction shows correct balance change
     */
    public function test_transaction_shows_balance_change()
    {
        $user = User::factory()->create();
        $transaction = Transaction::create([
            'user_id' => $user->id,
            'trx_type' => 'credit',
            'amount_in_base' => 50000,
        ]);

        $this->assertEquals(50000, $transaction->amount_in_base);
    }

    /**
     * Test transaction belongs to user
     */
    public function test_transaction_belongs_to_user()
    {
        $user = User::factory()->create();
        $transaction = Transaction::factory()->create(['user_id' => $user->id]);

        $this->assertTrue($transaction->user()->exists());
        $this->assertEquals($user->id, $transaction->user->id);
    }

    /**
     * Test multiple transactions for user
     */
    public function test_user_can_have_multiple_transactions()
    {
        $user = User::factory()->create();
        Transaction::factory(5)->create(['user_id' => $user->id]);

        $this->assertEquals(5, $user->transactions()->count());
    }
}
