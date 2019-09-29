<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','mainController@index')->name('index');


Route::resource('/table/channels','ChannelTableController')
    ->except('show')
    ->names('table.channels');
Route::get('/table/channels/buy','ChannelTableController@requestPurchase')
    ->name('table.channels.buy');

Route::get('/refresh/money','mainController@refreshCountMoney')->name('table.buy-channels');
Route::resource('/table/history-buy-channels','HistoryBuyChannelsTableController')
    ->except('show')
    ->names('table.buy-channels');

Route::resource('/table/buy-channels','BuyChannelsTableController')
    ->except('show')
    ->names('table.buy-channels');


Auth::routes();
