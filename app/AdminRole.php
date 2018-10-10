<?php

namespace App;



class AdminRole extends Model
{
    protected $table = "role";
    protected $fillable = (['name','desc']);
    //当前角色的所有权限 @withPivot 获取关系表中的user_id role_id 获取的字段排序规则与前面一样，否则会出错
    public function permissions(){
        return $this->belongsToMany(\App\AdminPermission::class,'permissions_role','role_id','permissions_id')->withPivot(['role_id','permissions_id']);
    }


    //给角色赋予权限
    public function grantPermission($permission){
        return $this->permissions()->save($permission);
    }

    //取消角色赋予的权限
    public function deletePermission($permission){
        return $this->permissions()->detach($permission);
    }

    //判断角色是否有权限 contains 判断一个集合里面是否有当前对象
    public function hasPermission($permission){
        return $this->permissions->contains($permission);
    }

}
