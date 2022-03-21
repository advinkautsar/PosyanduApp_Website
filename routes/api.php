<?php

use App\Http\Controllers\API\bIDAN\JadwalImunisasicontroller;
use App\Http\Controllers\API\Kader\JadwalPosyanducontroller;
use App\Http\Controllers\API\ListController;
use App\Http\Controllers\API\Ortu\NotifikasiController;
use App\Http\Controllers\API\Pemeriksaan\PemeriksaanController;
use App\Http\Controllers\API\Rujukan\RujukanController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\testcontroller;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Autentikasi Login & Registrasi
Route::post('/login', [UserController::class, 'login']);
Route::post('/register', [UserController::class, 'register']);
Route::post('update-akun-ortu',[UserController::class,'updateakunortu']);
Route::post('cek-nik-ortu',[UserController::class,'ceknikortu']);

// List dropdown
Route::get('list-anak',[ListController::class,'listanak']);
Route::get('list-ortu',[ListController::class,'listOrtu']);
Route::get('list-imunisasi',[ListController::class,'listImunisasi']);
Route::get('list-puskesmas',[ListController::class,'listPuskesmas']);
Route::get('list-bidan',[ListController::class,'listBidan']);

//CRUD Notifikasi Jadwal Posyandu
Route::get('list-posyandu',[JadwalPosyanducontroller::class,'listposyandu']);
Route::get('list-notifikasi',[NotifikasiController::class,'index']);
Route::post('create-jadwal-posyandu',[JadwalPosyanducontroller::class,'create_jadwal_posyandu']);

// Fitur Pencarian
Route::post('list-anak-cari',[testcontroller::class,'listanak']);

// Testing
Route::post('create-imunisasi',[ListController::class,'create_imunisasi']);
Route::post('testnotif',[ListController::class,'test']);

Route::post('cek-nik-ortu',[UserController::class,'ceknikortu']);
Route::post('update-akun-ortu',[UserController::class,'updateakunortu']);
Route::get('list-notifikasi',[NotifikasiController::class,'index']);
Route::post('create-jadwal-posyandu',[JadwalPosyanducontroller::class,'create_jadwal_posyandu']);
Route::post('create-jadwal-imunisasi',[JadwalImunisasicontroller::class,'create_jadwal_imunisasi']);
Route::post('update-kartu-anak',[NotifikasiController::class,'up_no_kartu_anak']);

// CRUD Rujukan
Route::post('tambah_datarujukan',[RujukanController::class, 'create']);
Route::get('ambil_datarujukan',[RujukanController::class, 'read']);
Route::put('ubah_datarujukan/{id}',[RujukanController::class, 'update']);
Route::delete('hapus_datarujukan/{id}',[RujukanController::class, 'delete']);

// CRUD Pemeriksaan Anak
Route::post('tambah_dataPemeriksaan',[PemeriksaanController::class, 'create']);
Route::get('ambil_dataPemeriksaan',[PemeriksaanController::class, 'read']);
Route::put('ubah_dataPemeriksaan/{id}',[PemeriksaanController::class, 'update']);
Route::delete('hapus_dataPemeriksaan/{id}',[PemeriksaanController::class, 'delete']);

//MendapatkanRelasiUser
Route::get('get_user_ortu/{id}', [UserController::class,'getUserRelasiOrtu']);
Route::get('get_user_bidan/{id}', [UserController::class,'getUserRelasiBidan']);
Route::get('get_user_kader/{id}', [UserController::class,'getUserRelasiKader']);
