<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{RoleController, OrangtuaController};



Route::get('/', function () {
    return view('welcome');
});

Route::get('/home',[OrangtuaController::class, 'Orangtua']);
Route::get('/home',[RoleController::class, 'admin']);
