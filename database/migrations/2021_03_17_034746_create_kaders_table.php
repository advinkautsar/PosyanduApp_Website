<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateKadersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kader', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("posyandu_id")->unsigned()->nullable();
            $table->bigInteger("user_id")->unsigned()->nullable();
            $table->string("nama_kader");
            $table->string("alamat");
            $table->foreign('posyandu_id')->references('id')->on('posyandu')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('user_id')->references('id')->on('user')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });

        DB::table('kader')->insert([
            'id' =>1,
            'posyandu_id'=>'1',
            'user_id' =>'2',
            'nama_kader' =>'kader1',            
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
        Schema::dropIfExists('kader');
    }
}
