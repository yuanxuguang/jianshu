<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AdminUser;
use \App\AdminRole;
class AdminController extends Controller
{
    public function adminUsers(){
        $users = \App\AdminUser::paginate(10);
        return view('admin.user.index',compact('users'));
    }

    public function adminUsersAdd(){
        return view('admin.user.add');
    }

    public function doAdminUsersAdd(){
        $this->validate(request(), [
            'name' => 'required|min:3|max:10',
            'password' => 'required|min:3',
        ]);
        $name = request('name');
        $password = bcrypt(request('password'));
        $data = compact('name','password');
//        AdminUser::create(compact('name','password'));
        $bool= \DB::table('admin_users')->insert($data);
        if($bool){
            return redirect('admin/users')->with('success','添加成功');
        }else{
            return back()->with('error','添加失败');
        }
    }

    //用户角色页面
    public function role(AdminUser $user){
        $roles = AdminRole::all();
        $myRole = $user->roles;
        return view('admin.user.role',compact('roles','myRole','user'));
    }

    public function storeRole(AdminUser $user){
        $this->validate(request(),[
            //roles 是一个数组
            'roles' => 'required|array',
        ]);
        //把提交上来的角色数组转换成对象
        $roles = AdminRole::findMany(request('roles'));
        //我的角色
        $myRoles = $user->roles;

        //会有两种情况 传递上来的角色比我的多 传递上来的角色与当前角色要多  会增加否则减少
        //要增加的  @diff 传递上来的角色与我当前角色的差集
        $addRoles = $roles->diff($myRoles);
        foreach($addRoles as $role){
            //增加用户与角色关系
            $user->assignRole($role);
        }

        //要删除的
        $delRoles = $myRoles->diff($roles);

        foreach($delRoles as $role){
            $user->deleteRole($role);
        }
        return back();

    }

}
