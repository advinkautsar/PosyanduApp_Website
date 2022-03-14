<?php

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Web\Autentikasi;
use App\Http\Controllers\Web\BidanController;

Route::get('/', function () {
    return view('autentikasi.login');
});


Auth::routes();


Route::post('/auth/simpan', [Autentikasi::class, 'simpan'])->name('autentikasi.simpan');
Route::post('/auth/logincek', [Autentikasi::class, 'logincek'])->name('autentikasi.logincek');
Route::get('/auth/logout', [Autentikasi::class, 'logout'])->name('autentikasi.logout');

Route::group(['middleware' => ['AuthCheck']], function(){
    Route::get('/admin/dashboard', [Autentikasi::class, 'dashboard']);
    Route::get('/auth/login', [Autentikasi::class, 'login'])->name('autentikasi.login');
    Route::get('/auth/register', [Autentikasi::class, 'register'])->name('autentikasi.register');
}); 

Route::resource('bidan', BidanController::class);