<?php

namespace Database\Factories;

use App\Models\TopUp;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TopUpService>
 */
class TopUpServiceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'top_up_id' => TopUp::factory(),
            'name' => fake()->words(3, true),
            'price' => fake()->randomFloat(2, 10, 1000),
            'discount' => 0,
            'discount_type' => 'flat',
            'status' => 1,
            'is_offered' => fake()->boolean(),
            'sort_by' => fake()->numberBetween(1, 100),
        ];
    }
}
