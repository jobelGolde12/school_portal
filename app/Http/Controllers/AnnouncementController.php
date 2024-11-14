<?php

namespace App\Http\Controllers;

use App\Models\AnnouncementModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class AnnouncementController extends Controller
{
    public function create(Request $request){
        $announcement = $request->validate([
            'title' => 'string|required|max:255', 
            'content' => 'string|required|max:255',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'is_active' => 'required|boolean',
            'created_by' => 'required|integer|min:0|max:18446744073709551615'
        ]);
      
       $create = AnnouncementModel::create($announcement);
       $data = [
        'name' => $create->user->name,
        'type' => $create->user->type
    ];
    return response()->json(['announcement created' => $data]);
    }

    public function index(){
        return Inertia::render('Announcement');
    }
}
