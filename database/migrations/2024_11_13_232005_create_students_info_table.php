<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('students_info', function (Blueprint $table) {
            $table->id();
            $table->foreignId('students_into_id')->references('users')->onDelete('cascade');
            $table->string('first_name');
            $table->string('middle_name')->nullable();
            $table->string('last_name');
            $table->date('date_of_birth');
            $table->enum('gender', ['male', 'female', 'other']);
            $table->string('phone_number')->nullable();
            $table->string('email')->unique();
            $table->enum('enrollment_status', ['enrolled', 'graduate', 'withdrawn']);
            $table->decimal('gpa', 3, 2)->nullable(); // Example sadi: 3.50
            $table->json('subjects_enrolled')->nullable(); // Store as JSON for flexibility
            $table->json('grades_by_subject')->nullable(); // Store as JSON for each subject's grade
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students_info');
    }
};
