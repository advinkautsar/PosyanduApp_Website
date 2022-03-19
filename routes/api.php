<?php

use App\Http\Controllers\API\Kader\JadwalPosyanducontroller;
use App\Http\Controllers\API\ListController;
use App\Http\Controllers\API\Ortu\NotifikasiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\testcontroller;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('/login', [UserController::class, 'login']);
Route::post('/register', [UserController::class, 'register']);
Route::get('list-anak',[ListController::class,'listanak']);
Route::get('list-posyandu',[JadwalPosyanducontroller::class,'listposyandu']);
Route::post('list-anak-cari',[testcontroller::class,'listanak']);
Route::post('create-imunisasi',[ListController::class,'create_imunisasi']);
Route::post('testnotif',[ListController::class,'test']);
Route::post('cek-nik-ortu',[UserController::class,'ceknikortu']);
Route::post('update-akun-ortu',[UserController::class,'updateakunortu']);
Route::get('list-notifikasi',[NotifikasiController::class,'index']);
Route::post('create-jadwal-posyandu',[JadwalPosyanducontroller::class,'create_jadwal_posyandu']);
Route::post('update-kartu-anak',[NotifikasiController::class,'up_no_kartu_anak']);


