<?php

namespace Tests\Unit\Models;

use Tests\TestCase;

/**
 * Simplified Unit Test untuk Models
 * 
 * Test ini fokus pada basic validation tanpa menggunakan database seeder
 * yang mungkin memiliki constraint issues
 */
class ModelValidationTest extends TestCase
{
    /**
     * Test class structure exists
     */
    public function test_order_model_exists()
    {
        $this->assertTrue(class_exists('App\Models\Order'));
    }

    /**
     * Test user model exists
     */
    public function test_user_model_exists()
    {
        $this->assertTrue(class_exists('App\Models\User'));
    }

    /**
     * Test topup service model exists
     */
    public function test_topup_service_model_exists()
    {
        $this->assertTrue(class_exists('App\Models\TopUpService'));
    }

    /**
     * Test transaction model exists
     */
    public function test_transaction_model_exists()
    {
        $this->assertTrue(class_exists('App\Models\Transaction'));
    }

    /**
     * Test blog model exists
     */
    public function test_blog_model_exists()
    {
        $this->assertTrue(class_exists('App\Models\Blog'));
    }

    /**
     * Test support ticket model exists
     */
    public function test_support_ticket_model_exists()
    {
        $this->assertTrue(class_exists('App\Models\SupportTicket'));
    }
}
