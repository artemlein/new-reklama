<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BuyChannel extends Model
{
    protected $table = "buyChannels";

    protected $fillable = [
        'name_channel',
        'url_channel',
        'url_vk',
        'name_vk',
        'status',
        'note',
    ];
}
