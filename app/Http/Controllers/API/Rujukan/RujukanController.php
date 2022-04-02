<?php

namespace App\Http\Controllers\API\Rujukan;

use App\Models\Rujukan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

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

    public function readperanak($id)
    {
        $rujukan_anak = DB::table('rujukan')
            ->leftJoin('anak','rujukan.nik_anak','anak.nik_anak')
            ->leftJoin('puskesmas','rujukan.puskesmas_id','puskesmas.id')
            ->leftJoin('posyandu','rujukan.tempat_pelayanan','posyandu.id')
            ->leftJoin('bidan','rujukan.bidan_id','bidan.id')
            ->select('puskesmas.*','bidan.nama_bidan as nama_bidan','posyandu.*','anak.nama_anak','rujukan.*')
            ->where('rujukan.nik_anak',$id)
            ->get();

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

    public function read()
    {
        $rujukan_anak = DB::table('rujukan')        
            ->leftJoin('anak','rujukan.nik_anak','anak.nik_anak')
            ->leftJoin('puskesmas','rujukan.puskesmas_id','puskesmas.id')
            ->leftJoin('posyandu','rujukan.tempat_pelayanan','posyandu.id')
            ->leftJoin('bidan','rujukan.bidan_id','bidan.id')
            ->select('puskesmas.*','bidan.nama_bidan as nama_bidan','posyandu.*','anak.nama_anak','rujukan.*')
            ->get();

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

    public function show($id)
    {
        $rujukan_anak = DB::table('rujukan')        
            ->leftJoin('anak','rujukan.nik_anak','anak.nik_anak')
            ->leftJoin('puskesmas','rujukan.puskesmas_id','puskesmas.id')
            ->leftJoin('posyandu','rujukan.tempat_pelayanan','posyandu.id')
            ->leftJoin('bidan','rujukan.bidan_id','bidan.id')
            ->select('puskesmas.*','bidan.nama_bidan as nama_bidan','anak.*','posyandu.*','posyandu.id as id_posyandu','rujukan.*')
            ->where('rujukan.id',$id)
            ->first();

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
