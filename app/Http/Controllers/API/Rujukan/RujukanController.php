<?php

namespace App\Http\Controllers\API\Rujukan;

use App\Http\Controllers\Controller;
use App\Models\Rujukan;
use Illuminate\Http\Request;

class RujukanController extends Controller
{
    public function create(Request $request)
    {
         $rujukan = Rujukan::create([

            'nik_anak'=>$request->nik_anak,
            'bidan_id'=>$request->bidan_id,
            'puskesmas_id'=>$request->puskesmas_id,
            'tanggal_rujukan'=>$request->tanggal_rujukan,
            'keluhan_anak'=>$request->keluhan_anak,
            'tempat_pelayanan'=>$request->tempat_pelayanan,
        ]);

        if ($rujukan) {
            $data = [
                'status' => true,
                'pesan' => "Data Rujukan berhasil ditambahkan"
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Menambahkan Data Rujukan"
            ];
            return response()->json($data, 404);
        }

    }

    public function read()
    {
        //  $data = Rujukan::all();
        $rujukan_anak = Rujukan::with('anak','posyandu','bidan','puskesmas')->get();
        if($rujukan_anak){
            return response()->json([
                'status'    => 'success',
                'message'   => 'Data tersedia',
                'data'      => $rujukan_anak
            ], 200);
        } else {
            return response()->json([
                'status'    => 'failed',
                'message'   => 'Data tidak tersedia',
                'data'      => []
            ], 404);
        }     
        
    }

    public function update(Request $request,$id)
    {
        $rujukan = Rujukan::find($id);
        $rujukan->update($request->all());

        if ($rujukan) {
            $data = [
                'status' => true,
                'pesan' => "Data Rujukan berhasil diubah"
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                'status' => true,
                'pesan' => "Gagal Merubah Data Rujukan"
            ];
            return response()->json($data, 404);
        }

    }

    public function delete(Request $request,$id)
    {
        $rujukan = Rujukan::find($id);

        if(!empty($rujukan)){
            $rujukan->delete();
            $data = [
                'status' => true,
                'pesan' => "Data Rujukan berhasil dihapus"
            ];
            return response()->json($data, 200);
        }else{
            return response()->json([
                'error' => 'Data Tidak Ditemukan'
            ], 404);
            
        }

        
    }
}
