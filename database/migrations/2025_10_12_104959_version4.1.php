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
        Schema::table('cards', function (Blueprint $table) {
            $table->string('meta_title')->nullable();
            $table->text('meta_keywords')->nullable();
            $table->text('meta_description')->nullable();
            $table->text('og_description')->nullable();
            $table->text('meta_robots')->nullable();
            $table->string('meta_image')->nullable();
            $table->string('meta_image_driver')->nullable();
        });

        Schema::table('top_ups', function (Blueprint $table) {
            $table->string('meta_title')->nullable();
            $table->text('meta_keywords')->nullable();
            $table->text('meta_description')->nullable();
            $table->text('og_description')->nullable();
            $table->text('meta_robots')->nullable();
            $table->string('meta_image')->nullable();
            $table->string('meta_image_driver')->nullable();
        });

        Schema::table('sell_posts', function (Blueprint $table) {
            $table->string('meta_title')->nullable();
            $table->text('meta_keywords')->nullable();
            $table->text('meta_description')->nullable();
            $table->text('og_description')->nullable();
            $table->text('meta_robots')->nullable();
            $table->string('meta_image')->nullable();
            $table->string('meta_image_driver')->nullable();
        });

        DB::statement("
            INSERT INTO `gateways`
            (`id`, `code`, `name`, `sort_by`, `image`, `driver`, `status`, `parameters`, `currencies`, `extra_parameters`, `supported_currency`, `receivable_currencies`, `description`, `currency_type`, `is_sandbox`, `environment`, `is_manual`, `note`, `created_at`, `updated_at`)
            VALUES
            (
                45,
                'uddoktapay',
                'Uddoktapay',
                '13',
                'gateway/yzcQw8wKrLvu3dKxhg7t3f4J6pzE.webp',
                'local',
                0,
                '{\"api_key\":\"982d381360a69d419689740d9f2e26ce36fb7\",\"base_url\":\"https://sandbox.uddoktapay.com/\"}',
                '{\"0\":{\"BDT\":\"BDT\"}}',
                NULL,
                '[\"BDT\"]',
                '[{\"name\":\"BDT\",\"currency_symbol\":\"BDT\",\"conversion_rate\":\"120\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]',
                'Send form your payment gateway. your bank may charge you a cash advance fee.',
                '1',
                '1',
                'test',
                0,
                NULL,
                '2020-09-10 09:05:02',
                '2025-01-08 13:26:49'
            )
        ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('cards', function (Blueprint $table) {
            $table->dropColumn(['meta_title', 'meta_keywords', 'meta_description',
                'og_description', 'meta_robots', 'meta_image', 'meta_image_driver']);
        });

        Schema::table('top_ups', function (Blueprint $table) {
            $table->dropColumn(['meta_title', 'meta_keywords', 'meta_description',
                'og_description', 'meta_robots', 'meta_image', 'meta_image_driver']);
        });

        Schema::table('sell_posts', function (Blueprint $table) {
            $table->dropColumn(['meta_title', 'meta_keywords', 'meta_description',
                'og_description', 'meta_robots', 'meta_image', 'meta_image_driver']);
        });
    }
};
