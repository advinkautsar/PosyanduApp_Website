<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePuskesmasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('puskesmas', function (Blueprint $table) {
            $table->id();
            $table->string("nama_puskesmas");
            $table->string("alamat_puskesmas");
            $table->bigInteger('kecamatan_id')->unsigned()->nullable();
            $table->foreign('kecamatan_id')->references('id')->on('kecamatan')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('puskesmas')->insert([
            'id' =>1,
            'nama_puskesmas'=>'Puskesmas Paspan',
            'alamat_puskesmas' =>'Jl. Paspan 12',
            'kecamatan_id' =>'1',            
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('puskesmas');
    }
}
