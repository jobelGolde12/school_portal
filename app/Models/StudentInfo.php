<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentInfo extends Model
{
    protected $table = 'students_info';
    protected $fillable = [
        'date_of_birth',
        'phone_number',
        'gender',
        'student_year',
        'enrollment_status',
        'gpa'
    ];
}
