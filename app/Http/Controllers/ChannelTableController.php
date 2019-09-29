<?php

namespace App\Http\Controllers;

use App\Models\Channel;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Repository\ChannelRepository;
use App\Repository\BuyChannelRepository;

class ChannelTableController extends Controller
{
    private $channelRepository;
    private $buyChannelRepository;

    public function __construct()
    {
        $this->channelRepository = app(ChannelRepository::class);
        $this->buyChannelRepository = app(BuyChannelRepository::class);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {


        $channels = $this->channelRepository->getAllWithPaginate();

        return view('tables.channels.channel_index',compact('channels'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        return view('tables.channels.channel_create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $result = $this->channelRepository->addChannel($request);
        if($result){
            return redirect('/table/channels');
        }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        dd($__METHOD__);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        dd($__METHOD__);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        dd($__METHOD__);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $channel = $this->channelRepository->getChannelOnId($id);

        $result = $this->channelRepository->DeleteChannel($channel);

        if($result){
            return redirect('/table/channels');
        }
    }

    public function requestPurchase(Request $request)
    {
        $this->buyChannelRepository->addChannel($request);
        return redirect('/table/channels');
    }
}
