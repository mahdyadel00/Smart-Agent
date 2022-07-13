<?php

namespace App\Modules\Portal\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\Admin\Models\Login\Login;
use Illuminate\Http\Request;
use  App\Models\User;
use Illuminate\Validation\Rule;

class LoginController extends Controller
{
    protected function login(){

        $login = Login::with('Data')->first();

        return view('site.login' , compact('login'));
    }

    protected function store(Request $request){

        // dd($request->all());

        // $request->validate([
        //     'email' => 'required|unique:users',
        //     'password' => 'required|confirmed',
        // ]);

        $request_data = $request->except(['password', 'password_confirmation']);
        $request_data['password'] = bcrypt($request->password);

        // dd($request_data);
        $user = User::where(['email' => $request->email , 'password' => $request->password]);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->route('home');

    }

}
