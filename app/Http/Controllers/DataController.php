<?php

namespace App\Http\Controllers;

use App\Models\StudentInfo;
use App\Models\User;
use App\Models\InstructorModel;
use App\Models\UserInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
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
            'info1' => $information1
        ];
        if($information2){
            $data['info2'] = $information2;
        }
        return Inertia::render('EditUser', [
            'data' => $data
        ]);
    }
    public function editUser(Request $request){
        //
    }


}
