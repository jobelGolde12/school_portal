<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AnnouncementController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\InstructorController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DataController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\SubjectsController;
use App\Http\Controllers\SuperAdmin;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Auth\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', [DashboardController::class, 'index'])->middleware(['auth', 'verified'])->name('dashboard');

// Admin 
Route::delete('/adminDeleteUser/{id}',[DataController::class, 'destroy'])->name('adminDeleteUser.destroy');
Route::get('/adminCreate', [DataController::class, 'RouteTocreate'])->name('adminCreate');


// super admin 
Route::get('/superadmin/view', [SuperAdmin::class , 'index'])->name('viewUsersDataAsSuperAdmin');
// Route::delete('/adminDeleteUser/{id}',[DataController::class, 'destroy'])->name('adminDeleteUser.destroy');
Route::get('/superadmin/create', [SuperAdmin::class, 'RouteTocreate'])->name('suAdmin.Create');

// admin and superadmin route   
Route::post('/add/instructor', [InstructorController::class, 'create'])->name('add.addInstructor');
Route::post('/add/student', [StudentController::class, 'create'])->name('add.addStudent');
Route::post('/add/admin', [AdminController::class, 'create'])->name('add.addAdmin');
Route::get('/edit-user-route/{id}', [DataController::class, 'routeToEditUser'])->name('editUserRoute');
Route::put('/edit-user/{id}', [DataController::class, 'editUser'])->name('editUser');
Route::get('/view-all-users', [DataController::class , 'index'])->name('viewAllUsers');



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Route::get('/profile', [ProfileController::class, 'editAsAdmin'])->name('profile.editAsAdmin');
Route::get('/aboutView', function (){
    return Inertia::render('AboutView');
})->name('aboutView');

Route::post('/announcement', [AnnouncementController::class, 'create'])->name('announcement.store');
Route::get('/announcement', [AnnouncementController::class, 'index'])->name('announcement.index');
Route::delete('/announcement/{id}', [AnnouncementController::class, 'destroy'])->name('announcement.destroy');

// Instructor 
Route::get('/viewSubjects', [SubjectsController::class, 'index'])->name('viewSubjects');
Route::get('/addSubjectRoute', [SubjectsController::class, 'goToAddSub'])->name('addSubjectRoute');
Route::post('/add-subject', [InstructorController::class, 'addSubject'])->name('add.subject');
Route::delete('/delete-subject/{id}', [InstructorController::class, 'deleteSubject'])->name('delete.subject');

// student 
Route::get('/viewStudentInfo', [StudentController::class, 'info'])->name('info');
Route::get('/profile', [ProfileController::class, 'editAsStudent'])->name('profile.editAsStudent');
Route::put('/students/{id}', [StudentController::class, 'update'])->name('student.updateInfo');

// user
Route::get('/viewUsersData', function (){
    return Inertia::render('ViewUserData');
})->name('viewUsersData');
require __DIR__.'/auth.php';
