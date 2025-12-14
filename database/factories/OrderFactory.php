<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'payment_method_id' => 1, // Assuming gateway exists or will be added
            'amount' => fake()->randomFloat(2, 10, 1000),
            'payment_status' => fake()->boolean(),
            'status' => fake()->numberBetween(0, 2),
            'order_for' => fake()->randomElement(['topup', 'card']),
            'utr' => fake()->uuid(),
        ];
    }
}
