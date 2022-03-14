<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePetugasPuskesmasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('petugas_puskesmas', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("puskesmas_id")->unsigned()->nullable();
            $table->bigInteger("user_id")->unsigned()->nullable();
            $table->string("nama");
            $table->string("alamat");
            $table->foreign('puskesmas_id')->references('id')->on('puskesmas')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('user_id')->references('id')->on('user')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('petugas_puskesmas');
    }
}
