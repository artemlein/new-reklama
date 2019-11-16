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

Auth::routes();

Route::get('/','MainController@index')->name('index');

Route::group(['namespace' => 'Auth', 'prefix' => '/login/'], function(){
    Route::get('vk','LoginController@redirectToProvider');
    Route::get('vk/callback', 'LoginController@handleProviderCallback');
});

Route::group(['namespace' => 'Reklama', 'prefix' => '/reklama/'], function(){

    Route::get('/','mainController@index')->name('reklama.index');

    Route::resource('/table/channels','ChannelTableController')
        ->except('show')
        ->names('reklama.table.channels');
    Route::get('/table/channels/buy','ChannelTableController@requestPurchase')
        ->name('reklama.table.channels.buy');

    Route::get('/refresh/money','mainController@refreshCountMoney')->name('table.buy-channels');
    Route::resource('/table/history-buy-channels','HistoryBuyChannelsTableController')
        ->except('show')
        ->names('reklama.table.buy-channels');

    Route::get('/table/buy-channels/note-save','BuyChannelsTableController@note_save')
        ->name('reklama.table.buy-channels.save-note');

    Route::get('/table/buy-channels/change-status','BuyChannelsTableController@change_status')
        ->name('reklama.table.buy-channels.save-note');

    Route::resource('/table/buy-channels','BuyChannelsTableController')
        ->except('show')
        ->names('reklama.table.buy-channels');

});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
