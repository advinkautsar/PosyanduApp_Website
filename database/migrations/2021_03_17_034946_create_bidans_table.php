<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBidansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bidan', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("puskesmas_id")->unsigned()->nullable();
            $table->bigInteger("posyandu_id")->unsigned()->nullable();
            $table->bigInteger("user_id")->unsigned()->nullable();
            $table->string("nama_bidan");
            $table->string("alamat");
            $table->foreign('puskesmas_id')->references('id')->on('puskesmas')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('posyandu_id')->references('id')->on('posyandu')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('user_id')->references('id')->on('user')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('bidan')->insert([
            'id' =>1,
            'puskesmas_id'=>'1',
            'posyandu_id'=>'1',
            'user_id' =>'1',
            'nama_bidan' =>'bidan',            
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
        Schema::dropIfExists('bidan');
    }
}
