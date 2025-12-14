<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\SupportTicket;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SupportTicketFeatureTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test support ticket can be created
     */
    public function test_support_ticket_can_be_created()
    {
        $user = User::factory()->create();

        $ticket = SupportTicket::create([
            'user_id' => $user->id,
            'ticket' => 'TKT-' . time(),
            'subject' => 'Issue with my order',
            'status' => 0,
        ]);

        $this->assertDatabaseHas('support_tickets', [
            'user_id' => $user->id,
            'subject' => 'Issue with my order',
        ]);
    }

    /**
     * Test support ticket belongs to user
     */
    public function test_support_ticket_belongs_to_user()
    {
        $user = User::factory()->create();
        $ticket = SupportTicket::factory()->create(['user_id' => $user->id]);

        $this->assertTrue($ticket->user()->exists());
        $this->assertEquals($user->id, $ticket->user->id);
    }

    /**
     * Test ticket can be closed
     */
    public function test_ticket_can_be_closed()
    {
        $ticket = SupportTicket::factory()->create(['status' => 0]);

        $ticket->update(['status' => 3]);

        $this->assertEquals(3, $ticket->fresh()->status);
    }



    /**
     * Test multiple tickets for user
     */
    public function test_user_can_have_multiple_tickets()
    {
        $user = User::factory()->create();
        SupportTicket::factory(5)->create(['user_id' => $user->id]);

        $this->assertEquals(5, $user->supportTickets()->count());
    }
}
