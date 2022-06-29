<?php

namespace App\Modules\Portal\Controllers;

use App\Bll\Lang;
use App\Bll\Utility;
use App\Models\Language;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use App\Http\Controllers\Controller;
use Xinax\LaravelGettext\Facades\LaravelGettext;

class HomeController extends Controller
{

    public function index(){

        // $blogs = Blog::leftJoin('blogs_data','blogs_data.blog_id','blogs.id')
        //     ->select('blogs_data.*','blogs.id','blogs.image')
        //     ->where('blogs_data.lang_id', Lang::getSelectedLangId())->where('blogs.status', 1)
        //     ->orderBy('blogs.id', 'desc')->take(6)->get();

        

        // $reviews = Comment::with('user')->where('published',1)->get();


        return view('site.home');
    }



    public function changeHomeLang($locale = null)
    {

        App::setLocale($locale);
        LaravelGettext::setLocale($locale);
        session()->put('locale', $locale);
        $language = Language::where('code', $locale)->first();
        if ($language != null) {
            session()->put('lang_id', $language['id']);
            session()->put('lang', $language['code']);
        }
        return  redirect()->back();
    }




}
