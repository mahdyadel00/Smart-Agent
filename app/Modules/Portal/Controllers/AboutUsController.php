<?php

namespace App\Modules\Portal\Controllers;

use App\Bll\Lang;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Modules\Admin\Models\Main\MainGoals;


class AboutUsController extends Controller
{

    protected function index(){

        dd('test');
        $main_goals = MainGoals::with('Data')->first();

        return view('site.about_us' , compact('main_goals'));
    }


}
