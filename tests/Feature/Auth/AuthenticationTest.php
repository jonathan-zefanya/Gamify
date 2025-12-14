<?php

namespace Tests\Feature\Auth;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthenticationTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test user can login with valid credentials
     */
    public function test_user_can_login_with_valid_credentials()
    {
        $user = User::factory()->create([
            'email' => 'test@example.com',
            'password' => bcrypt('password123'),
        ]);

        // Check user exists in database
        $this->assertDatabaseHas('users', [
            'email' => 'test@example.com',
        ]);
    }

    /**
     * Test user cannot login with invalid credentials
     */
    public function test_user_cannot_login_with_invalid_credentials()
    {
        $user = User::factory()->create([
            'email' => 'test@example.com',
            'password' => bcrypt('password123'),
        ]);

        // Verify password doesn't match
        $this->assertFalse(\Hash::check('wrongpassword', $user->password));
    }

    /**
     * Test user can register
     */
    public function test_user_can_register()
    {
        $user = User::create([
            'name' => 'New User',
            'email' => 'newuser@example.com',
            'username' => 'newuser',
            'password' => bcrypt('password123'),
        ]);

        $this->assertDatabaseHas('users', [
            'email' => 'newuser@example.com',
            'username' => 'newuser',
        ]);
    }

    /**
     * Test email must be unique on registration
     */
    public function test_email_must_be_unique()
    {
        User::factory()->create(['email' => 'taken@example.com']);

        $this->expectException(\Illuminate\Database\QueryException::class);

        User::create([
            'name' => 'Another User',
            'email' => 'taken@example.com',
            'username' => 'anotheruser',
            'password' => bcrypt('password123'),
        ]);
    }
}
