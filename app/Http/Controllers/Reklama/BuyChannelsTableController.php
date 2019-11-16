<?php

namespace App\Http\Controllers\Reklama;

use App\Repository\CounterRepository;
use App\Repository\BuyChannelRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BuyChannelsTableController extends BaseController
{
    private $counterRepository;
    private $buyChannelRepository;

    public function __construct()
    {
        if(!BaseController:: CheckPermissions(Auth::user())){
            return route('index');
        }

        $this->counterRepository = app(CounterRepository::class);
        $this->buyChannelRepository = app(buyChannelRepository::class);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $counts = $this->counterRepository->getCount();

        $channels = $this->buyChannelRepository->getAllWithPaginate();

        return view('tables.buyChannels.buyChannel_index',compact('counts','channels'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->buyChannelRepository->destroyChannel($id);

    }

    public function note_save(Request $request){
        return $this->buyChannelRepository->saveNote($request);

    }
    public function change_status(Request $request){
        return $this->buyChannelRepository->changeStatus($request);
    }

}
