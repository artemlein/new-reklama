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
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
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
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
        $result = $this->channelRepository->addChannel($request);
        if($result){
            return redirect('reklama/table/channels');
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
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }

        $channel = $this->channelRepository->getChannelOnId($id);
        return view('tables.channels.channel_edit',compact('channel'));
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
        $this->channelRepository->Update($request,$id);

        return redirect('reklama/table/channels');
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
