<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DataController extends Controller
{
    public function index(){
        $data = User::all();
        return Inertia::render('AdminViewUsersData', ['users' => $data]);
    }
    public function edit(){
        
    }
}
