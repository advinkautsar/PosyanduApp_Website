<?php

namespace App\Http\Controllers\API\Ortu;

use App\Models\Orangtua;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\User;

class OrangtuaController extends Controller
{
    public function ReadAll()
    {
        $orangtua = DB::table('orangtua')        
            ->leftJoin('user','orangtua.user_id','user.id')
            ->leftJoin('posyandu','orangtua.posyandu_id','posyandu.id')
            ->get();
        
        if($orangtua){
                return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $orangtua
            ], 200);
        } else {
                return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function show($id)
    {
        $orangtua = DB::table('orangtua')        
            ->leftJoin('user','orangtua.user_id','user.id')
            ->leftJoin('posyandu','orangtua.posyandu_id','posyandu.id')
            ->leftJoin('desa_kelurahan','orangtua.desa_kelurahan_id','desa_kelurahan.id')
            ->leftJoin('kecamatan','orangtua.kecamatan_id','kecamatan.id')
            ->select('posyandu.nama_posyandu','desa_kelurahan.nama','kecamatan.nama_kecamatan','orangtua.*')
            ->where('orangtua.id',$id)
            ->first();
        
            if($orangtua){
                return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $orangtua
                ], 200);
            } else {
                return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
                ], 404);
            }

    }

    public function showprofilortu($id)
    {
        $ortu = DB::table('orangtua')        
                ->leftJoin('user','orangtua.user_id','user.id')
                ->leftJoin('kecamatan','orangtua.kecamatan_id','kecamatan.id')
                ->leftJoin('desa_kelurahan','orangtua.desa_kelurahan_id','desa_kelurahan.id')
                ->select('user.nama_pengguna','user.kata_sandi','user.no_hp','kecamatan.nama_kecamatan',
                'desa_kelurahan.nama','orangtua.*')
                ->where('user_id',$id)
                ->first();

        if($ortu){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $ortu
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }
    }

    public function updateProfilOrtu(Request $request,$id)
    {        
        $orangtua = Orangtua::where('user_id',$id)->first();
            $updateortu= $orangtua->update($request->all());

        $user = User::where('id',$orangtua->user_id)->first();
            $updateuser = $user->update($request->all());

        if($updateortu || $updateuser){
                        
            $data = [
                'status' => true,
                'pesan' => "Data Diri berhasil diubah"
            ];
            return response()->json($data, 200);

        }else{
            
            $data = [
                'status' => true,
                'pesan' => "Perubahan Data Diri Gagal"
            ];
            return response()->json($data);
        }     
        
    }

    
}
