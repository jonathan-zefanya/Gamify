<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Update all NULL values in is_manual to 0 (disabled by default)
        DB::table('gateways')->whereNull('is_manual')->update(['is_manual' => 0]);
        
        // Modify column to not nullable
        Schema::table('gateways', function (Blueprint $table) {
            $table->integer('is_manual')->default(0)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            $table->integer('is_manual')->nullable()->change();
        });
    }
};
