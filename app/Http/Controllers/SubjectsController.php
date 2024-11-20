<?php

namespace App\Http\Controllers;

use App\Models\SubjectsModel;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SubjectsController extends Controller
{
    public function index(){
        $subjects = SubjectsModel::all();
        return Inertia::render('instructor/ViewSubjects', [
            'subjects' => $subjects
        ]);
    }
    public function goToAddSub(){
    return Inertia::render('instructor/NewSubject');
    }
}
