<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDesaKelurahansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('desa_kelurahan', function (Blueprint $table) {
            $table->id();
            $table->string("nama");
            $table->bigInteger('kecamatan_id')->unsigned()->nullable();
            $table->foreign('kecamatan_id')->references('id')->on('kecamatan')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('desa_kelurahan')->insert([
            'id' =>1,
            'nama'=>'Kelurahan Banjarsari',
            'kecamatan_id' =>'1',
        ]);

        DB::table('desa_kelurahan')->insert([
            'id' =>2,
            'nama'=>'Kelurahan Wonosobo',
            'kecamatan_id' =>'2',
        ]);

        DB::table('desa_kelurahan')->insert([
            'id' =>3,
            'nama'=>'Desa Bulusari',
            'kecamatan_id' =>'3',
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('desa_kelurahan');
    }
}
