<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SupportTicket>
 */
class SupportTicketFactory extends Factory
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
            'ticket' => 'TICKET-' . Str::random(8),
            'subject' => fake()->title(),
            'status' => fake()->randomElement(['open', 'in_progress', 'closed']),
            'last_reply' => now(),
        ];
    }
}
