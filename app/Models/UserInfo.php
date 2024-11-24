<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class UserInfo extends Model
{
    protected $table = 'user_info';
    protected $fillable = [
        'date_of_birth',
        'phone_number',
        'gender',
        'student_year'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
}
