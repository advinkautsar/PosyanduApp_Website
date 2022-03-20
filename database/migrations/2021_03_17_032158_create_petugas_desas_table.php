<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePetugasDesasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('petugas_desa', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("desa_kelurahan_id")->unsigned()->nullable();
            $table->bigInteger("user_id")->unsigned()->nullable();
            $table->string("nama");
            $table->string("alamat");
            $table->foreign('desa_kelurahan_id')->references('id')->on('desa_kelurahan')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('user_id')->references('id')->on('user')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('petugas_desa')->insert([
            'id' =>1,
            'desa_kelurahan_id'=>'1',
            'user_id' =>'6',
            'nama' =>'petugas_desa1',            
            'alamat' =>'jl. blimbing 11',        
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('petugas_desa');
    }
}
