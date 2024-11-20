<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SubjectsModel extends Model
{
    protected $table = 'subjects';
    protected $fillable = [
        'name',
        'code',
        'description',
        'user_id'
    ];
}
