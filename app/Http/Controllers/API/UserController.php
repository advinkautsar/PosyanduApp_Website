<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Orangtua;
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
                $user->token = $request->token;
                $user->save();
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

    public function ceknikortu(Request $request){
        // $cek_nik = User::where('nik',$request->nik)->fisrt();
        $cek_nik = Orangtua::where('nik_ibu',$request->nik)->first();
        // $user = User::where('id',$cek_nik->user_id)->first();
            // 'nama'=>$user->nama_pengguna,
                // 'nohp'=>$user->no_hp,
              
        if($cek_nik){
               $data = [
                'status' => true,
            
                'pesan' => "Silahkan update akun anda"
            ];
            return response()->json($data);

        }else{

            $data = [
                'status' => true,
                
                'pesan' => "NIK anda belum terdaftar di aplikasi"
            ];
            return response()->json($data);

        }
    }

    public function updateakunortu(Request $request){
        $nik = Orangtua::where('nik_ibu',$request->nik)->first();
        $user = User::where('id',$nik->user_id)->first();

        
        if($nik){

            $user->update([
                'nama_pengguna'=>$request->nama_pengguna,
                'kata_sandi'=>bcrypt($request->kata_sandi),
                'no_hp'=>$request->no_hp,
                'token'=>$request->token,
            ]);
            
               $data = [
                // 'status' => true,
                'succes'    => 1,
                'message'   => 'Pendaftaran pengguna berhasil',
                'user'      => $user,
                // 'pesan' => "Akun sudah terupdate"
            ];
            return response()->json($data);

        }else{

            $data = [
                'status' => true,
                'pesan' => "Gagal update akun"
            ];
            return response()->json($data);

        }
    }

    public function getUserRelasiOrtu($id)
    {
        $user = User::with('orangtua')->find($id);
        
        if($user){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $user
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function getUserRelasiBidan($id)
    {
        $user = User::with('bidan')->find($id);

        if($user){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $user
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function getUserRelasiKader($id)
    {
        $user = User::with('kader')->find($id);
        if($user){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $user
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }
}
