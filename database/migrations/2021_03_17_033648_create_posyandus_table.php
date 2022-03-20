<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePosyandusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posyandu', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("desa_kelurahan_id")->unsigned()->nullable();
            $table->string("nama");
            $table->string("alamat");
            $table->string("hari_kegiatan");
            $table->enum('minggu_kegiatan', ['Minggu-1', 'Minggu-2','Minggu-3','Minggu-4']);
            $table->foreign('desa_kelurahan_id')->references('id')->on('desa_kelurahan')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('posyandu')->insert([
            'id' =>1,
            'desa_kelurahan_id'=>'1',
            'nama' =>'posyandu anggrek 1',         
            'alamat' =>'jl. blimbing 11',        
            'hari_kegiatan' =>'Senin',        
            'minggu_kegiatan' =>'Minggu-1',        
        ]);

        DB::table('posyandu')->insert([
            'id' =>2,
            'desa_kelurahan_id'=>'1',
            'nama' =>'posyandu mawar',         
            'alamat' =>'jl. blimbing 11',        
            'hari_kegiatan' =>'Senin',        
            'minggu_kegiatan' =>'Minggu-2',        
        ]);

        DB::table('posyandu')->insert([
            'id' =>3,
            'desa_kelurahan_id'=>'1',
            'nama' =>'posyandu rafleshia',         
            'alamat' =>'jl. blimbing 11',        
            'hari_kegiatan' =>'Senin',        
            'minggu_kegiatan' =>'Minggu-3',        
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posyandu');
    }
}
