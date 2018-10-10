<?php

namespace App;
// use \App\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
    protected $table="user";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
   
    //文章列表
      public function posts()
    {
        return $this->hasMany(\App\Post::class, 'user_id', 'id');
    }
   
    //我的粉丝
    public function fans()
    {
        return $this->hasMany(\App\Fan::class,'star_id','id');
    }

    //当前这个人是否被粉
    public function hasFen($uid){
        return $this->fans()->where('fan_id',$uid)->count();
    }

    //当前这个人是否h关注了uid
    public function hasStars($uid){
        return $this->stars()->where('star_id',$uid)->count();
    }

    //这个人的关注
    public function stars(){
        return $this->hasMany(\App\Fan::class,'fan_id','id');
    }

    //关注某人
    public function doFan($uid){
        $fan = new \App\Fan();
        $fan->star_id = $uid;
        return $this->stars()->save($fan);
    }

    //取消关注某人
    public function doUnFan($uid){
        $fan = new \App\Fan();
        $fan->star_id = $uid;
        return $this->stars()->delete($fan);
    }

    //用户收到的通知  多对多的关系
    public function notices(){
        return $this->belongsToMany(Notice::class,'notice_user','user_id','notice_id')->withPivot(['user_id','notice_id']);
    }

    //给用户增加通知
    public function addNotice($notice){
        return $this->notices()->save($notice);
    }


}
