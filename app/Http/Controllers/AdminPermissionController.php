<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AdminPermission;
class AdminPermissionController extends Controller
{
    //
    public function permissionList(){
        $permissions = AdminPermission::all();
        return view('admin.permission.index',compact('permissions'));
    }

    public function permissionAdd(){
        return view('admin.permission.add');
    }

    public function permissionDoAdd(){
        $this->validate(request(),[
           'name' => 'required|min:1',
           'desc' => 'required',
        ]);

        \App\AdminPermission::create(request(['name','desc']));
        return redirect('/admin/permissionList');
    }

    public function permissionDelete(){

    }
}
