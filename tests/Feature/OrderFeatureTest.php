<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Order;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class OrderFeatureTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test user can create order
     */
    public function test_user_can_create_order()
    {
        $user = User::factory()->create();

        $order = Order::create([
            'user_id' => $user->id,
            'amount' => 50000,
            'status' => 0,
            'order_for' => 'topup',
        ]);

        $this->assertDatabaseHas('orders', [
            'user_id' => $user->id,
            'amount' => 50000,
        ]);
    }

    /**
     * Test order belongs to user
     */
    public function test_order_belongs_to_user()
    {
        $user = User::factory()->create();
        $order = Order::factory()->create(['user_id' => $user->id]);

        $this->assertTrue($order->user()->exists());
        $this->assertEquals($user->id, $order->user->id);
    }

    /**
     * Test order status can be updated
     */
    public function test_order_status_can_be_updated()
    {
        $order = Order::factory()->create(['status' => 'pending']);

        $order->update(['status' => 'completed']);

        $this->assertEquals('completed', $order->fresh()->status);
    }

    /**
     * Test order amount is numeric
     */
    public function test_order_amount_is_numeric()
    {
        $order = Order::factory()->create(['amount' => 100000]);

        $this->assertIsNumeric($order->amount);
        $this->assertEquals(100000, $order->amount);
    }

    /**
     * Test order can be deleted
     */
    public function test_order_can_be_deleted()
    {
        $order = Order::factory()->create();
        $orderId = $order->id;

        $order->delete();

        $this->assertDatabaseMissing('orders', ['id' => $orderId]);
    }
}
