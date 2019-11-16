<?php

namespace App\Http\Controllers\Reklama;

use App\Repository\CounterRepository;
use App\Http\Requests\BuyChannelStoreRequest;
use App\Repository\HistoryBuyChannelRepository;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class HistoryBuyChannelsTableController extends BaseController
{
    private $buyChannelsTable;
    private $counterRepository;

    public function __construct()
    {


        $this->buyChannelsTable = app(HistoryBuyChannelRepository::class);
        $this->counterRepository = app(CounterRepository::class);

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
        $counts = $this->counterRepository->getCount();

        $channels = $this->buyChannelsTable->getAllWithPaginate();
        for ($i = 0; $i <= count($channels)-1; $i++) {
            $channels[$i]['date_publication'] = Str::replaceFirst(' ', '.', $channels[$i]['date_publication']);
            $channels[$i]['date_publication'] = Str::replaceFirst(' ', '.', $channels[$i]['date_publication']);
            $channels[$i]['date_publication'] = Str::replaceFirst(' ', '.', $channels[$i]['date_publication']);

        }

        return view('tables.historyBuyChannels.buyChannel_index',compact('channels','counts'));
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
        $counts = $this->counterRepository->getCount();

        $channels = $this->buyChannelsTable->getAllWithPaginate();
        return view('tables.historyBuyChannels.buyChannel_create',compact('channels','counts'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BuyChannelStoreRequest $request)
    {
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
        $this->buyChannelsTable->store($request);
        $this->counterRepository->plusMoneyCount($request);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
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
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
    }
}
