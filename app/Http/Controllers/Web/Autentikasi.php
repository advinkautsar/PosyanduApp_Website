<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;


class Autentikasi extends Controller
{
    public function login()
    {          
        return view('autentikasi.login');
    }
    public function register()
    {
        return view('autentikasi.daftar');
    }
    public function simpan(Request $request)
    {
        //validasi
        $request->validate([
            'nama_pengguna'=>'required|unique:user',
            'kata_sandi'=>'required|min:6|max:12',
            'no_hp'=>'required',
            'role'=>'required'
        ]);

        //memasukkan data kedalam database
        $user = new User;
        $user->nama_pengguna = $request->nama_pengguna;
        $user->kata_sandi = Hash::make($request->kata_sandi);
        $user->no_hp = $request->no_hp;
        $user->role = $request->role;
        $save = $user->save();

        if($save){
            return back()->with('succes','Akun berhasil terdaftar');
        }else{
            return back()->with('fail','Ups!! ada sesuatu yang bermasalah, coba sesaat lagi !');
        }

    }

    public function logincek(Request $request)
    {
        //validasi
        $request->validate([
            'nama_pengguna'=> 'required',
            'kata_sandi'=> 'required|min:6|max:12'
        ]);

        //proses login
        $userinfo = User::where('nama_pengguna','=', $request->nama_pengguna)->first();

        if(!$userinfo){
            return back()->with('fail','Nama pengguna anda tidak ditemukan');
        }else{
            //password cek
            if(Hash::check($request->kata_sandi, $userinfo->kata_sandi)){
                $request->session()->put('LoggedUser', $userinfo->id);
                return redirect('admin/dashboard');
            }else{
                return back()->with('fail','Kata sandi anda salah');
            }
        } 
    }

    public function logout()
    {
        if(session()->has('LoggedUser')){
            session()->pull('LoggedUser');
            return redirect('auth/login');
        }
    }

    public function dashboard()
    {
        $data = ['LoggedUserInfo'=>User::where('id','=', session('LoggedUser'))->first()];
        return view('admin.dashboard', $data);
    }


}
