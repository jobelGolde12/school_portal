<?php

namespace App\Http\Controllers;

use App\Models\UserDataModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DataController extends Controller
{
    public function index(){
        $data = UserDataModel::all();
        return Inertia::render('ViewUserData', ['data' => $data]);
    }
}
