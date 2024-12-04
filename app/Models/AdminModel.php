<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminModel extends Model
{
    protected $table = "admins";
   protected $fillable = [
      'id',
    'date_of_birth',
    'phone_number',
    'gender'
   ];
}
