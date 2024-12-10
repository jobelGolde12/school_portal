<?php

namespace App\Http\Controllers;

use App\Models\InstructorModel;
use App\Models\SubjectsModel;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class InstructorController extends Controller
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
             'student_year' => 'nullable|string|max::255'
         ]);
        $user = User::create([
             'name' => $validate['first_name'] . ' ' . $validate['last_name'] . ' ' . $validate['middle_name'],
             'email' => $validate['email'],
             'password' => Hash::make($validate['password']),
             'type' => "instructor",
         ]);
 
         InstructorModel::create([
             'id' => $user->id,
             'date_of_birth' => $validate['date_of_birth'],
             'phone_number' => $validate['phone_number'],
             'gender' => $validate['gender'],
 
         ]);
         // return redirect()->route()->with('Message', 'Created successfully');
     }

     public function addSubject(Request $request){
        $request->validate([
        'name' => 'required|string|max:255',
        'code' => 'required|string|max:255',
        ]);

        SubjectsModel::create([
            'name' => $request->name,
            'code' => $request->code,
            'description' => 'none',
            ]);

     }

     public function deleteSubject($id){
        
        $sub = SubjectsModel::findOrFail($id);
        $sub->delete();
        return redirect()->back()->with('success','subject deleted');
     }
}
