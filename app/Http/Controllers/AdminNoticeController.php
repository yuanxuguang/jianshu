<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Notice;
class AdminNoticeController extends Controller
{
    //
    public function index(){

        $notices = Notice::all();
        return view('admin.notice.index',compact('notices'));
    }

    public function create(){
        return view('admin.notice.create');
    }

    public function store(){
        $this->validate(request(),[
            'title' => 'required',
            'content' => 'required'
        ]);

        $notice = Notice::create(request(['title','content']));
        //把通知调用队列方法
        dispatch(new \App\Jobs\SendMessage($notice));
        return redirect('/admin/notices');
    }


}
