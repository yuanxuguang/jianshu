<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/18
 * Time: 20:40
 */

namespace App\Http\Controllers;
use \App\Post;
use Illuminate\Http\Request;
use Auth;
use DB;
use \App\comment;
use Log;
USE \App\Topic;
class posteController extends Controller
{
  //列表
  public function index(){
    // $user = \Auth::user();
    // $posts = DB::table('posts')->orderby('created_at','desc')->paginate(4);
    //$posts = Post::orderby('id')->paginate(4);
    $posts = Post::orderBy('id','desc')->withCount(["zan","comments"])->paginate(4);
    return view("post/index",['posts' => $posts]);
  }

  //详情
  public function show(Post $post){
 
//    dd($post->comments());
    return view("post/show",compact('post'));
  }
  //图片上传
  public function imgupload(Request $request){
    //从请求里面拿到file数据，存储到public 空间 并重命名
    $path = $request->file('wangEditorH5File')->storePublicly(md5(time()));
    //现在是在 public/stroge 找文件；
    return asset('stroage/'.$path);
  }

  public function edit(Post $post){
    return view("post/edit",compact('post'));
  }

  public function update(Request $request){
    $this->validate($request,[
      'title' => 'max:225|min:4',
      'content' => 'required|min:2'
    ]);
    $data['title'] = $request->title;
    $data['content'] = $request->content; 

    $bool = DB::table('posts')->where('id','=',$request->id)->update($data);
    if($bool){
      return redirect("/")->with('success','修改成功');
    }else{
      return back()->with('error','修改失败');
    }
    // $post->update(request(['title','content']));
//    dd(22);
  }

  //创建页面
  public function create(){

  //第一种orm 添加数据
  //$post = new Post();
  //$post->title = request('title');
  //$post->content= request('content');
//    $post->save();
     //第二种orm 添加数据
//    $params = ['title' => request('title'),'content' => request('content')];
//    $params = request('title','content');
    return view("post/create");
  }
  
 //插入数据
  public function store(Request $request){
  // if($request->hasFile('file')){
          
  //           $date = date('Ymd');
  //                       $new_file = 'uploads/'.$date.'/';
  //           $name = date('YmdHis');
  //           //获取文件后缀
  //           $extension = $request->file('file')->getClientOriginalExtension();
  //           // 移动图片
  //           $request->file('file')->move($new_file,$name.'.'.$extension);
  //           $data = $new_file.$name.'.'.$extension;
  //           dd($data);
  //     }else{
  //         dd('224');
  //     }
  
   $user_id = \Auth::id();
    $this->validate($request,[
         'title' => 'required|max:125|min:1',
         'content' => 'required|min:1',
    ]);

    $data = array_merge(request(['title','content']),compact('user_id'));
    $post = Post::create($data);
    return redirect('/');
  }

  //删除
  public function delete($id){
    $bool=DB::table('posts')->where('id',$id)->delete();
    if($bool){
      return redirect('/')->with('success','success');
    }else{
      return \redirect::back()->with('error','error');
    } 
  }

  //评论
  public function comment($id){
    $this->validate(request(),[
        'post_id' => 'required',
        'content' => 'required|min:3',
      ]);
    $data['user_id'] = \Auth::id();
    $data['post_id'] = $id;
    $data['content'] = request(['content'])['content'];
    $data['created_at'] = time();
    //  $data['user_id'] = "9";
    // $data['post_id'] = "14";
    // $data['content'] = "9897979";
    // $data['created_at'] = time();
    $bool = DB::table('comment')->insert($data);
    if($bool){
      return redirect('/')->with('success','评论成功');
    }else{
      return back()->with('error','评论失败');
    }
  }

  //搜索
  public function search(){
      $query = request('query');
      $list = Post::where('title','like','%'.$query.'%')->get();
      return view('post/search',compact('list','query'));
  }
  
  //zan
  public function zan($id){
     $zan['user_id'] = Auth::id();
     $zan['post_id'] = $id;
     DB::table('zans')->insert($zan);
     return back();
  }

   //unzan
  public function unzan($id){
     $zan['user_id'] = Auth::id();
     $zan['post_id'] = $id;
     DB::table('zans')->where('post_id','=',$id)->where('user_id',$zan['user_id'])->delete();
     return back();
  }
  
  //专题
  public function topic(Topic $topic){
      $topic = Topic::withCount('postTopics')->find($topic->id);
	  $posts = $topic->posts()->orderBy('created_at','desc')->take(10)->get();
	  $myposts = \App\Post::authorBy(\Auth::id())->topicNotBy($topic->id)->get();
    
	  return view('post.topic',compact('posts','myposts','topic'));
  }
  
  //投稿
  public function submit(Topic $topic){
	  $this->validate(request(),[
	     'postids' => 'array'
	  ]);
	  //确认这些id属于当前用户
	  $posts = \App\Post::find(request(['post_ids']));

	  foreach($posts as $post){
		  if($post->user_id != Auth::id()){
			  return back()->with('error','没有相关权限');
		  }
	  }

      $topic_id = $topic->id;
      $post_ids = request('post_ids');
      foreach ($post_ids as $post_id){
        \App\PostTopic::firstOrCreate(compact('topic_id', 'post_id'));
      }
      return back();
  }
  
  
  
  
  
  
  
  
  
  
}