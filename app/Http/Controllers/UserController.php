<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2017/10/25
 * Time: 13:07
 */
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use Hash;
use Auth;
use App\User;

class UserController extends Controller
{
    public function login(){
//        dd($request->all());
        return view('user.login');
    }
    
    public function do_login(Request $request){
          $all = $request->all();
          // dd($all);
          $user = DB::table('user')->where('email',$all['email'])->first();
          // if($user){
          //   if(Hash::check($all['password'],$user->password)){
          //       session(['uid' => $user->id,'name'=>$user->name,'email'=>$user->email]);
          //       return redirect('/posts');
          //   }else{
          //       return back()->with('error','信息输入错误');
          //   }
          // }else{
          //   // dd(22);
          //   return back()->with('error','无该账号');
          // }
          session(['uid' => \Auth::id(),'name'=>$user->name,'email'=>$user->email]);
          $user = request(['email','password']);
          $remmber = boolval(request('is_remember'));
          // dd($remmber);
          if(true == \Auth::attempt($user,$remmber)){
             // session(['id' => $user->id,'name'=>$user->name,'email'=>$user->email]);
                    return redirect('/');
          }else{
            return back()->with('error','无该账号');
          }
    }
   //注册页面
    public function register(){
        return view('user.register');
    }
    
    //注册行为
    public function do_register(Request $request){
        $this->validate($request,[
            'name' => 'min:4|max:20|required',
            'email' => 'required|unique:user',
            'password' => 'required|confirmed'
        ]);
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['password'] = Hash::make($request->password);
        $bool = DB::table('user')->insert($data);
        if($bool){
            return redirect('/login')->with('success','注册成功');
        }else{
            return back()->with('error','注册失败');
        }
        return view('user.register');
    }

    public function logout(){
      \Auth::logout();
      return redirect('/login');
    }

    //个人主页
    public function homepage(User $user){         //这个地方传递了一个user_id  因为没传user的id 
      //   $posts = User::orderBy('i')->posts()->get();


      // 获取当前用户的文章列表
      $posts = $user->posts()->orderBy('id','desc')->take(10)->get();
      // 这个用户的 关注/粉丝/文章 数
      $user = User::withCount(['stars','fans','posts'])->find($user->id);
      //粉丝
      $fans = $user->fans()->get();
      $stars = $user->stars()->get();
//        dd($user);
      return view('user.homepage',compact('posts','user','fans','stars'));
    }

    public function setting(User $user){
      $me = Auth::user();
        return view('user.setting',compact('me'));
    }
    
    //个人设置
    public function user_set(Request $request){
      $id = Auth::id();
      $this->validate($request,[
             'name' => 'required|min:4'
      ]);

      $date = date('Y-m-d',time());
      if($request->hasFile('avatar')){
        $name = time().rand(1,100000);
         // 获取后缀
        $extension = $request->file('avatar')->getClientOriginalExtension();
        // 移动图片
        $request->file('avatar')->move('uploads/',$name.'.'.$extension);
        $data['avatar'] = '/uploads/'.$name.'.'.$extension;
        $data['name'] = request('name');
        $bool = DB::table('user')->where('id','=',$id)->update($data);
        if($bool){
          return redirect('/user/setting')->with('success','修改成功');
        }else{
          return back()->with('error','修改失败');
        }
      }else{

      }
    }

    public function fan(User $user){
       $me = Auth::user();
       $a = \App\Fan::firstOrCreate(['fan_id' => $me->id,'star_id' => $user->id]);

       $data['info'] =1;
       $data['msg'] = '关注成功';
       return json_encode($data);
    }

    public function unfan(User $user){
       $me = Auth::user();
       \App\Fan::where('fan_id',$me->id)->where('star_id',$user->id)->delete();
          $data['info'] =1;
       $data['msg'] = '取消关注';
       return json_encode($data);
    }

}