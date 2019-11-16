<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Channel extends Model
{
    protected $fillable = [
        'name_channel',
        'subscribe',
        'url_vk',
        'name_vk',
        'url_channel',
        'price_video',
        'price_int',
        'description',
        'price',
    ];

}
