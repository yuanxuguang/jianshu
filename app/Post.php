<?php

namespace App;
use \App\Model;
// use \App\User;
 use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Builder;
// use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = "posts";
    // protected $guarded=[];//不可注入的字段
    // protected $fillables = ['title','content']; //可以批量复制的字段  不设置默认为全部吧？；
     public function user()
    {
        return $this->belongsTo(\App\User::class, 'user_id', 'id');
    }

    //所有评论
    public function comments(){
    	return $this->hasMany('\App\comment')->orderby('created_at','desc');
    }

    //zan
    public function zan(){
    	return $this->hasMany('App\Zan')->orderby('created_at','desc');
    }
    
    public function zans($user_id){ 
        return $this->hasOne(\App\Zan::class)->where('user_id',$user_id);
    }
	
	//一篇文章有哪些主题
	public function topics(){
		return $this->belongsToMany(\App\PostTopics::class,'post_id');
	}
	
	public function postTopics(){
		return $this->hasMany(\App\PostTopic::class,'post_id');
	}
	
	//不属于某个专题的文章
    public function scopeTopicNotBy(Builder $query,$topic_id){
		 return $query->doesntHave('postTopics','and',function($q) use($topic_id){
			 $q->where('topic_id',$topic_id);
		 });
	}
	
	//属于我的文章
	public function scopeAuthorBy($query,$user_id){
		return $query->where('user_id',$user_id);
	}

	//全局scope的方式 post status 在0到1之间的
	public static function boot(){
		parent::boot();
		static::addGlobalScope("avaiable",function(Builder $builder){
			$builder->whereIn('status',[0,1]);
		});
	}
		
		

	
	
	

}