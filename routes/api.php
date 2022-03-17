<?php

use App\Http\Controllers\API\ListController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;




// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('/login', [UserController::class, 'login']);
Route::post('/register', [UserController::class, 'register']);
Route::get('list-anak',[ListController::class,'listanak']);
Route::post('create-imunisasi',[ListController::class,'create_imunisasi']);
Route::post('testnotif',[ListController::class,'test']);
