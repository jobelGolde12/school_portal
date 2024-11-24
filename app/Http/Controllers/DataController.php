<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class DataController extends Controller
{
    public function index(){
        $data = User::all();
        return Inertia::render('AdminViewUsersData', ['users' => $data]);
    }
    public function edit(){
        
    }
    public function destroy($id){
        $user = User::findOrFail($id);
        $user->delete();
        return redirect()->back()->with('success','user deleted');
    }
    public function RouteTocreate(){
    return Inertia::render('Create');
    }

    public function createInstructor(Request $request){
       $validate = $request->validate([
            'first_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'last_name' => 'required|string|max:255',
            'gender' => 'required|string|max:255',
            'phone_number' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'date_of_birth' => 'required|date',
            'password' => 'required|string|max:255|min:8',
            'student_year' => 'nullable|string|max::255'

        ]);

        User::create([
            'name' => $validate['first_name'] . ' ' . $validate['last_name'] . ' ' . $validate['middle_name'],
            'email' => $validate['email'],
            'type' => "instructor",
            'password' => Hash::make($validate['password']),

        ]);

        UserInfo::create([
            'date_of_birth' => $validate['date_of_birth'],
            'phone_number' => $validate['phone_number'],
            'gender' => $validate['gender'],
            'student_year' => $validate['student_year'] ?? null,

        ]);
        // return redirect()->route()->with('Message', 'Created successfully');
    }
}
