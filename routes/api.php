<?php

use App\Http\Controllers\API\Anak\AnakController;
use App\Http\Controllers\API\bIDAN\JadwalImunisasicontroller;
use App\Http\Controllers\API\Kader\JadwalPosyanducontroller;
use App\Http\Controllers\API\ListController;
use App\Http\Controllers\API\Ortu\NotifikasiController;
use App\Http\Controllers\API\Ortu\OrangtuaController;
use App\Http\Controllers\API\Pemeriksaan\PemeriksaanController;
use App\Http\Controllers\API\Rujukan\RujukanController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\testcontroller;
use App\Models\Pemeriksaan;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Autentikasi Login & Registrasi
Route::post('/login', [UserController::class, 'login']);
Route::post('/register', [UserController::class, 'register']);
Route::post('update-akun-ortu',[UserController::class,'updateakunortu']);
Route::post('cek-nik-ortu',[UserController::class,'ceknikortu']);
Route::get('logout/{id}',[UserController::class,'logout']);


// List dropdown
Route::get('list-anak',[ListController::class,'listanak']);
Route::get('list-ortu',[ListController::class,'listOrtu']);
Route::get('list-imunisasi',[ListController::class,'listImunisasi']);
Route::get('list-puskesmas',[ListController::class,'listPuskesmas']);
Route::get('list-bidan',[ListController::class,'listBidan']);
Route::get('list-kecamatan',[ListController::class,'listKecamatan']);
Route::get('list-desa',[ListController::class,'listDesa']);

//CRUD Notifikasi Jadwal Posyandu
Route::get('list-posyandu',[JadwalPosyanducontroller::class,'listposyandu']);
Route::get('list-notifikasi/{id}',[NotifikasiController::class,'index']);
Route::post('create-jadwal-posyandu',[JadwalPosyanducontroller::class,'create_jadwal_posyandu']);

// Fitur Pencarian
Route::post('list-anak-cari',[testcontroller::class,'listanak']);
Route::post('list-ortu-cari',[testcontroller::class,'searchListOrtu']);

// Fitur Orangtua ( Kader )
Route::get('ambil_semuadata-ortu',[OrangtuaController::class, 'ReadAll']);
Route::get('show_dataOrtu/{id}',[OrangtuaController::class, 'show']);
Route::put('ubah_dataOrtu/{id}',[OrangtuaController::class, 'updateProfilOrtu']);
Route::put('ubah_dataOrtu_user/{id}',[OrangtuaController::class, 'updateProfilUserOrtu']);

//Fitur Anak ( Orangtua )
Route::get('ambil_data_anakortu/{id}',[AnakController::class, 'ReadAnakDariOrtu']);
Route::get('ambil_data_anak/{id}',[AnakController::class, 'show']);
Route::get('ambil_dataimunisasi_anak/{id}',[AnakController::class, 'showimunisasi']);
Route::get('ambil_datastatusgizi_anak/{id}',[AnakController::class, 'showstatusgizi']);
Route::get('list-status',[ListController::class,'status']);

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
Route::get('ambil_datarujukan/{id}',[RujukanController::class, 'readperanak']);
Route::get('show_datarujukan/{id}',[RujukanController::class, 'show']);
Route::put('ubah_datarujukan/{id}',[RujukanController::class, 'update']);
Route::delete('hapus_datarujukan/{id}',[RujukanController::class, 'delete']);

// CRUD Pemeriksaan Anak
Route::post('tambah_dataPemeriksaan',[PemeriksaanController::class, 'create']);
Route::get('ambil_dataPemeriksaan/{id}',[PemeriksaanController::class, 'read']);
Route::get('show_dataPemeriksaan/{id}',[PemeriksaanController::class, 'show']);
Route::put('ubah_dataPemeriksaan/{id}',[PemeriksaanController::class, 'update']);
Route::delete('hapus_dataPemeriksaan/{id}',[PemeriksaanController::class, 'delete']);

//MendapatkanRelasiUser
Route::get('get_user_ortu/{id}', [UserController::class,'getUserRelasiOrtu']);
Route::get('get_user_bidan/{id}', [UserController::class,'getUserRelasiBidan']);
Route::get('get_user_kader/{id}', [UserController::class,'getUserRelasiKader']);

//Fitur Profil Ortu ( Orangtua )
Route::get('get_profil_ortu/{id}',[OrangtuaController::class,'showprofilortu']);
Route::post('updateProfilOrtu/{id}',[OrangtuaController::class,'updateProfilOrtu']);
