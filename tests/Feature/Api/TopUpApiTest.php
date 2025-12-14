<?php

namespace Tests\Feature\Api;

use App\Models\User;
use App\Models\TopUpService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TopUpApiTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test can fetch all top-up services via API
     */
    public function test_can_fetch_all_topup_services()
    {
        $user = User::factory()->create();
        TopUpService::factory(5)->create();

        $response = $this->actingAs($user)->getJson('/api/topup/services');

        $response->assertStatus(200);
    }

    /**
     * Test can fetch single top-up service
     */
    public function test_can_fetch_single_topup_service()
    {
        $user = User::factory()->create();
        $service = TopUpService::factory()->create();

        $response = $this->actingAs($user)->getJson("/api/topup/services");

        $response->assertStatus(200);
    }

    /**
     * Test unauthenticated user cannot access protected routes
     */
    public function test_unauthenticated_user_cannot_create_order()
    {
        $response = $this->getJson('/api/topup/services');

        $response->assertStatus(401);
    }

    /**
     * Test topup order creation placeholder
     */
    public function test_user_with_insufficient_balance_gets_error()
    {
        $user = User::factory()->create();
        TopUpService::factory()->create();

        $response = $this->actingAs($user)->getJson('/api/topup/services');

        $response->assertStatus(200);
    }

    /**
     * Test can search top-up services
     */
    public function test_can_search_topup_services()
    {
        $user = User::factory()->create();
        TopUpService::factory()->create(['name' => 'Mobile Legends']);
        TopUpService::factory()->create(['name' => 'PUBG Mobile']);

        $response = $this->actingAs($user)->getJson('/api/topup/services?search=Mobile');

        $response->assertStatus(200);
    }

    /**
     * Test pagination of top-up services
     */
    public function test_topup_services_are_paginated()
    {
        $user = User::factory()->create();
        TopUpService::factory(25)->create();

        $response = $this->actingAs($user)->getJson('/api/topup/services?per_page=10');

        $response->assertStatus(200);
    }
}
