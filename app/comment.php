<?php
namespace App;
use \App\Model;

class comment extends Model
{
    protected $table = "comment";

    public function posts(){
    	return $this->belongsTo(\App\Post::class,'post_id','id');
    }

    public function user(){
    	return $this->belongsTo(\App\User::class,'user_id','id');
    }
}