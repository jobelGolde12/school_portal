<?php

namespace App\Http\Controllers;

use App\Models\AnnouncementModel;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index(){
        $announcement = AnnouncementModel::all();
        $users = User::all();
            if (Auth::check() && Auth::user()->type === 'admin') { 
                return Inertia::render('AdminDashboard', [
                'announcement' => $announcement,
                'allUsers' => $users
            ]); 
            }
            return Inertia::render('Dashboard', [
                'announcement' => $announcement,
            ]);
    }
}
