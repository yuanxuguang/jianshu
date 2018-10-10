<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AdminPermission extends Model
{
    //
    protected $table = "Permissions";
    protected $fillable = ['name', 'desc'];
    //权限属于哪个角色
    public function roles(){
        return $this->belongsToMany(\App\AdminRole::class,'permissions_role','permissions_id','role_id')->withPivot(['permissions_id','role_id']);
    }





}
