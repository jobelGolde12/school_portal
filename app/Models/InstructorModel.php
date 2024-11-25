<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InstructorModel extends Model
{
   protected $table = "instructor";
   protected $fillable = [
      'id',
    'date_of_birth',
    'phone_number',
    'gender'
   ];
}
