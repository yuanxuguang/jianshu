<?php

namespace App;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\AdminRole;
class AdminUser extends Authenticatable
{
    protected $rememberTokenName = '';
    protected $table = 'admin_users';

    //用户有哪些角色 多个模型 withPivot 获取关系表中的user_id role_id
    public function roles(){
        return $this->belongsToMany(AdminRole::class,'role_user','user_id','role_id')->withPivot(['user_id','role_id']);
    }

    //是否有某些角色 intersect 判断传递过来的模型与roles 是否有交集 !!返回bool类型
    public function isInRoles($roles){
        return !!$roles->intersect($this->roles)->count();
    }

    //给用户分配角色
    public function assignRole($role){
        return $this->roles()->save($role);
    }

    //取消用户分配的角色
    public function deleteRole($role){
        return $this->roles()->detach($role);
    }

    //用户是否有权限  判断用户的角色是否跟有这个权限的角色有交集
    public function hasPermission($permission){
        return $this->isInRoles($permission->roles);
    }

}
