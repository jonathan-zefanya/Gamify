<?php

namespace Database\Factories;

use App\Models\BlogCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Blog>
 */
class BlogFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'category_id' => BlogCategory::factory(),
            'slug' => fake()->unique()->slug(),
            'page_title' => fake()->title(),
            'meta_title' => fake()->title(),
            'meta_keywords' => fake()->words(5, true),
            'meta_description' => fake()->text(100),
            'status' => 1,
        ];
    }
}
