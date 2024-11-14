<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserDataModel extends Model
{
    protected $table = 'students_info';

    protected $fillable = [
        'students_into_id',
        'first_name',
        'middle_name',
        'last_name',
        'date_of_birth',
        'gender',
        'phone_number',
        'email',
        'enrollment_status',
        'gpa',
        'subjects_enrolled',
        'grades_by_subject',
    ];
}
