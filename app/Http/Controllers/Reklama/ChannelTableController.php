<?php

namespace App\Http\Controllers\Reklama;

use App\Models\Channel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Repository\ChannelRepository;
use App\Repository\CounterRepository;
use App\Repository\BuyChannelRepository;

class ChannelTableController extends BaseController
{
    private $channelRepository;
    private $buyChannelRepository;
    private $counterRepository;

    public function __construct()
    {


        $this->channelRepository = app(ChannelRepository::class);
        $this->counterRepository = app(CounterRepository::class);
        $this->buyChannelRepository = app(BuyChannelRepository::class);

        if(!BaseController:: CheckPermissions(Auth::user())){
            return route('index');
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $counter = $this->counterRepository->getCount();
        $channels = $this->channelRepository->getAllWithPaginate();

        return view('tables.channels.channel_index',compact('channels','counter'));
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
        return $request->input();
    }
}
