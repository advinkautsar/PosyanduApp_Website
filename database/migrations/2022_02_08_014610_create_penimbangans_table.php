<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenimbangansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penimbangan', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("nik_anak")->unsigned()->nullable();
            $table->float("berat_badan");
            $table->float("tinggi_badan");
            $table->float("lingkar_kepala");
            $table->string("status_bb/u");
            $table->string("status_tb/u");
            $table->string("status_lk/u");
            $table->string("status_bb/tb");
            $table->string("status_imt/u");
            $table->foreign('nik_anak')->references('nik_anak')->on('anak')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('penimbangan');
    }
}
