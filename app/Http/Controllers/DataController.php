<?php

namespace App\Http\Controllers;

use App\Models\StudentInfo;
use App\Models\User;
use App\Models\InstructorModel;
use App\Models\UserInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class DataController extends Controller
{
    public function index(){
        $data = User::all();
        return Inertia::render('ViewAllUsers', ['users' => $data]);
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
    public function routeToEditUser($id){
        $information1 = User::findOrFail($id);
        $information2 = UserInfo::find($id);

        $data = [
            'info1' => $information1,
        ];
        if($information2){
            $data['info2'] = $information2;
        }
        return Inertia::render('EditUser', [
            'data' => $data
        ]);
    }
        public function editUser(Request $request, $id){
            $user = User::findOrFail($id);
            $instructor = InstructorModel::findOrFail($id);

            $request->validate([
                'name' => 'required|string|max:255',
                'date_of_birth' => 'required|date',
                'gender' => 'required|string|max:255',
                'phone_number' => 'required|string|max:255',
                'email' => 'required|email',
                'enrollment_status' => 'nullable',
                'gpa' => 'nullable',
                'subjects_enrolled' => 'nullable',
                'grade_by_subject' => 'nullable',
                'type' => 'nullable',
            ]);

        if($request->type === 'instructor'){
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'type' => $request->type,
            ]);

            $instructor->updateOrCreate([
                 'date_of_birth' => $request->date_of_birth,
                 'phone_number' => $request->phone_number,
                 'gender' => $request->gender
            ]);
        }else if($request->type === 'student'){
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'type' => $request->type,
            ]);

            $instructor->updateOrCreate([
                 'date_of_birth' => $request->date_of_birth,
                 'phone_number' => $request->phone_number,
                 'gender' => $request->gender,
                 'enrollment_status' => $request->enrollment_status,
                 'gpa' => $request->gpa,
                 'subjects_enrolled' => $request->subjects_enrolled,
                 'grade_by_subject' => $request->grade_by_subject
            ]);
        }

        return Inertia::render('/dashboard');
    }
  

}
