<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Transaction>
 */
class TransactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'transactional_id' => 1,
            'transactional_type' => 'App\Models\TopUp',
            'user_id' => User::factory(),
            'amount_in_base' => fake()->randomFloat(2, 10, 100000),
            'trx_type' => fake()->randomElement(['credit', 'debit']),
            'remarks' => fake()->sentence(),
            'trx_id' => fake()->uuid(),
        ];
    }
}
