<?php

namespace App\Http\Controllers\Reklama;

use Illuminate\Foundation\Bus\DispatchesJobs;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class BaseController extends Controller
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function CheckPermissions($user){
        if($user) {
            if($user->admin === 1){

                return true;
            }
        }
    }
}
