<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnaksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('anak', function (Blueprint $table) {
            $table->id("nik_anak");
            $table->bigInteger("orangtua_id")->unsigned()->nullable();
            $table->string("no_kartu");
            $table->string("nama_anak");
            $table->enum('jenis_kelamin', ['L', 'P']);
            $table->date("tanggal_lahir");
            $table->float("berat_lahir");
            $table->float("panjang_lahir");
            $table->foreign('orangtua_id')->references('id')->on('orangtua')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('anak');
    }
}
