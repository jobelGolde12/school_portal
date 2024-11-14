<?php

use App\Http\Controllers\AnnouncementController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DataController;
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

Route::get('/dashboard', function () {
    if (Auth::check() && Auth::user()->type === 'admin') { 
        return Inertia::render('AdminDashboard'); 
    }
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');
Route::get('/viewUserData', [DataController::class , 'index'])->middleware(['auth', 'verified'])->name('viewUserData');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});
Route::post('/announcement', [AnnouncementController::class, 'create'])->name('announcement.store');
Route::get('/announcement', [AnnouncementController::class, 'index'])->name('announcement.index');



require __DIR__.'/auth.php';
