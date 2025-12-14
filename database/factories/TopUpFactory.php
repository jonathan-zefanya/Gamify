<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TopUp>
 */
class TopUpFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->words(2, true),
            'slug' => fake()->unique()->slug(),
            'region' => fake()->country(),
            'status' => 1,
            'is_trending' => fake()->boolean(),
            'instant_delivery' => 1,
            'sort_by' => fake()->numberBetween(1, 50),
        ];
    }
}
