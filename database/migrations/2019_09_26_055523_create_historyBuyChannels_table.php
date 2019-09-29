<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHistoryBuyChannelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historyBuyChannels', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name_channel');
            $table->string('price');
            $table->string('date_publication');
            $table->string('url_video');
            $table->string('wallet')->nullable();
            $table->string('status')->default(1);
            $table->string('_token');
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
        Schema::dropIfExists('buy_channels');
    }
}
