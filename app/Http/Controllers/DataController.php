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
    public function destroy($id){
        $user = User::findOrFail($id);
        $user->delete();
        return redirect()->back()->with('success','user deleted');
    }
    public function RouteTocreate(){
    return Inertia::render('Create');
    }

    public function create(Request $request){
        $request->validate([
            //
        ]);
    }
}
