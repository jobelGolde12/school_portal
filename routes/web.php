<?php

use App\Http\Controllers\AnnouncementController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DataController;
use App\Http\Controllers\SubjectsController;
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
Route::get('/adminViewUsersData', [DataController::class , 'index'])->name('AdminViewUsersData');
Route::delete('/adminDeleteUser/{id}',[DataController::class, 'destroy'])->name('adminDeleteUser.destroy');
Route::get('/viewUsersData', function (){
        return Inertia::render('ViewUserData');
})->name('viewUsersData');

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

require __DIR__.'/auth.php';
