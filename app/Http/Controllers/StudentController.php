<?php

namespace App\Http\Controllers;

use App\Models\StudentInfo;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class StudentController extends Controller
{
    public function create(Request $request){
        $validate = $request->validate([
             'first_name' => 'required|string|max:255',
             'middle_name' => 'nullable|string|max:255',
             'last_name' => 'required|string|max:255',
             'gender' => 'required|string|max:255',
             'phone_number' => 'required|string|max:255',
             'email' => 'required|email|unique:users,email',
             'date_of_birth' => 'required|date',
             'password' => 'required|string|max:255|min:8',
             'student_year' => 'required|string|max:255',
             'enrollment_status' => 'required|string|max:255',    
             'gpa' => 'required|string|max:255',
         ]);
        $user = User::create([
             'name' => $validate['first_name'] . ' ' . $validate['last_name'] . ' ' . $validate['middle_name'],
             'email' => $validate['email'], 
             'type' => "student",
             'password' => Hash::make($validate['password']),
 
         ]);
 
         StudentInfo::create([
             'id' => $user->id,
             'date_of_birth' => $validate['date_of_birth'],
             'phone_number' => $validate['phone_number'],
             'gender' => $validate['gender'],
             'student_year' => $validate['student_year'],
             'gpa' => $validate['gpa'],
             'enrollment_status' => $validate['enrollment_status'],
 
         ]);
         // return redirect()->route()->with('Message', 'Created successfully');
     }
     public function info(){
        $studentInfo = StudentInfo::where('id', Auth::id())->first();
        $userInfo = User::where('id', Auth::id())->first();
        return Inertia::render('student/Info', [
            'studentInfo' => $studentInfo,
            'userInfo' => $userInfo
        ]); 
     }

     public function update(Request $request, $id)
{
    $validated = $request->validate([
        'date_of_birth' => 'required|date',
        'gender' => 'required|string',
        'phone_number' => 'nullable|string',
        'email' => 'required|email|unique:users,email,' . $id,
    ]);

    $student = StudentInfo::findOrFail($id);  
    $student->update($validated);

    return back()->with('success', 'Student data updated successfully.');
}

}

// 'first_name' => $validate['first_name'],
// 'middle_name' => $validate['middle_name'],
// 'last_name' => $validate['last_name'],
// 'email' => $validate['email'],