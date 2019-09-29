<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HistoryBuyChannel extends Model
{
    protected $table = "historyBuyChannels";

    protected $fillable = [
        '_token',
        'name_channel',
        'price',
        'date_publication',
        'url_video',
        'wallet',
    ];
}
