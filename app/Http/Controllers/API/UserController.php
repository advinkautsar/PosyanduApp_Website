<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function login(Request $request)
    {
        $user = User::where('nama_pengguna', $request->nama_pengguna)->first();
        
        if ($user) {
            if (password_verify($request->kata_sandi, $user->kata_sandi)) {
                return response()->json([
                    'succes' => 1,
                    'message' => 'Selamat Datang ' . $user->nama_pengguna,
                    'user' => $user
                ]);

            }
            return $this->error("Kata sandi salah");
        }
        return $this->error("Nama Pengguna tidak terdaftar");
    }

    public function register(Request $request)
    {
        // Hal yang wajib terisi : nama_pengguna, kata_sandi, role
        $validasi = Validator::make($request->all(),[
            'nama_pengguna' => 'required|unique:user',
            'kata_sandi'    => 'required|min:6',
        ]);

        if ($validasi->fails()) {
            $val = $validasi->errors()->all();
            return $this->error($val[0]);
        }

        $user = User::create(array_merge($request->all(),[
            'kata_sandi' => bcrypt($request->kata_sandi)
        ]));

        if ($user) {
            return response()->json([
                'succes'    => 1,
                'message'   => 'Pendaftaran pengguna berhasil',
                'user'      => $user,
            ]);
        }
        return $this->error('Pendaftaran gagal');
    }


    public function error($pesan)
    {
        return response()->json([
            'succes' => 0,
            'message' => $pesan,
        ]);
    }
    
}
