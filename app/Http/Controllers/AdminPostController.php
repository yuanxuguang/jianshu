<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
class AdminPostController extends Controller
{
    //
    public function postList(){

        //不使用全局scope ‘avaiable’
        $posts = Post::withoutGlobalScope('avaiable')->where('status',0)->orderBy('created_at','desc')->paginate(10);
        return view('admin.posts.list',compact('posts'));

    }

    public function postStatus(Post $post){

        $this->validate(request(),[
            "status" => "required|in:-1,1",
        ]);
        $post->status = request('status');
        $post->save();
        return[
            'error' => 0,
            'msg' => ''
        ];
    }

}
