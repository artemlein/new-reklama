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
        if(!BaseController:: CheckPermissions(Auth::user())){
            return route('index');
        }

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
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }
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

        $this->buyChannelRepository->destroyChannel($id);

    }

    public function note_save(Request $request){
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }

        return $this->buyChannelRepository->saveNote($request);

    }
    public function change_status(Request $request){
        if(!BaseController:: CheckPermissions(Auth::user())){
            return redirect('/');
        }

        return $this->buyChannelRepository->changeStatus($request);
    }

}
