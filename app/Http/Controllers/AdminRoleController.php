<?php

namespace App\Http\Controllers;

use App\AdminPermission;
use Illuminate\Http\Request;
use App\AdminRole;

class AdminRoleController extends Controller
{
    //
    public function rolesList(){
        $roles = AdminRole::paginate(10);
        return view('admin.role.index',compact('roles'));
    }

    public function rolesAdd(){
        return view('admin.role.add');
    }

    public function rolesDoAdd(){
        $this->validate(request(),[
            'name' => 'required|min:1',
            'desc' => 'required|min:2'
        ]);
        AdminRole::create(request(['name','desc']));
        return redirect('/admin/rolesList');
    }

    public function rolesDelete(){

    }

    public function permission(AdminRole $role){
        //获取所有权限
        $permissions = AdminPermission::all();
        $myPermission = $role->permissions;
        //获取当前角色权限
        return view('admin.role.permission',compact('permissions','myPermission','role'));
    }

    public function storePermission(AdminRole $role){

        $this->validate(request(),[
           'permissions' => 'required|array'
        ]);
        $permissions = AdminPermission::findMany(request('permissions'));
        $myPermissions = $role->permissions;

        //对已有的权限 增加
        $addPermissions = $permissions->diff($myPermissions);

        foreach($addPermissions as $permission){
            $role->grantPermission($permission);
        }

        $delPermissions = $myPermissions->diff($permissions);

        foreach($delPermissions as $permission){
            $role->deletePermission($permission);
        }
        return back();


    }
}
