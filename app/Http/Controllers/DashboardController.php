<?php

namespace App\Http\Controllers;

use App\Models\AnnouncementModel;
use App\Models\StudentInfo;
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
            }else if (Auth::check() && Auth::user()->type === 'instructor') { 
                return Inertia::render('instructor/InstructorDashboard', [
                'announcement' => $announcement,
            ]); 
            }else if (Auth::check() && Auth::user()->type === 'student') {
               

                return Inertia::render('student/Student', [
                'announcement' => $announcement,
            ]); 
            }
            return Inertia::render('Dashboard', [
                'announcement' => $announcement,
            ]);
    }
}
