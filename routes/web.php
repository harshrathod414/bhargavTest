<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProfileController;
use \App\Http\Controllers\BrandController;
use \App\Http\Controllers\PostController;
use App\Http\Controllers\CommentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Auth::routes();

Route::middleware('auth')->group(function () {
    
    Route::resource('comments', CommentController::class);

    Route::post('posts/bulk_action', [PostController::class, 'bulkAction'])->name('posts.bulk_action');
    Route::resource('posts', PostController::class);
    
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/', [HomeController::class, 'index'])->name('home');
    Route::post('users/bulk_action', [UserController::class, 'bulkAction'])->name('users.bulk_action');
    Route::resource('users', UserController::class);
});
