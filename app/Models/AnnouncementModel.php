<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AnnouncementModel extends Model
{
    protected $table = 'announcement';
    protected $fillable = [
        'title',
        'content',
        'start_date',
        'end_date',
        'is_active',    
        'created_by',
    ];
    public function user(){
        return $this->belongsTo(User::class, 'created_by');
    }
}
