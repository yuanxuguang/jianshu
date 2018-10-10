<?php
namespace App\Http\Middleware;
use Closure;

class LoginMiddleware{
    public function handle($request,Closure $next){
         $url = $_SERVER['REQUEST_URI'];
        if($url == "/login"){
           return $next($request);
        }else{
          if(session('name')){
              return $next($request);
          }else{
              return redirect('login')->with('error','请先登录');
          }
        }
    }
}