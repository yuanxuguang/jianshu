<?php

namespace App\Http\Controllers;
use App\Topic;
use Illuminate\Http\Request;

class AdminTopicController extends Controller
{
    //
    public function index(){
        $topics = Topic::all();
        return view('admin.topic.index',compact('topics'));
    }

    public function create(){
        return view('admin.topic.add');
    }

    public function store(){
        $this->validate(request(),[
            'name' => 'required|min:2'
        ]);
        Topic::create(request(['name']));
        return redirect('/admin/topics');
    }

    public function destroy(Topic $topic){
        $topic->delete();
        return[
            'error' => 0,
            'msg' => ''
        ];
    }


}
