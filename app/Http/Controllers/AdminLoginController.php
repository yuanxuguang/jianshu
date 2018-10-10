<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/5
 * Time: 16:35
 */
namespace App\Http\Controllers;

class AdminLoginController extends Controller{

    public function login(){
//        $a = \Hash::make('Aadmin888');
//        dd($a);
        return view('admin.login');
    }

    public function doLogin(){
        $this->validate(request(),[
           'name' => 'required|min:2',
           'password' => 'required|min:3',
        ]);
        $user = request(['name','password']);
        if(\Auth::guard('admin')->attempt($user)){
            return redirect('/admin/index');
        }else{
            return back()->with('error','账号密码不匹配');
        }
    }

    public function index(){
        return view('admin.index');
    }

    public function loginOut(){
        \Auth::guard('admin')->logout();
        return redirect('/admin/login');
    }
}