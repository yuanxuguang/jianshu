<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use \App\AdminPermission;
class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */

    protected $policies = [
//      'App\Model' => 'App\Policies\ModelPolicy',
        'App\Post' => 'App\Policies\PostPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        //定义门卫 取出所有权限 定义权限名称为门卫名 查询这个用户是否有这个权限返回
        $permissions = AdminPermission::all();
        foreach($permissions as $permission){
            Gate::define($permission->name,function($user) use($permission){
                return $user->hasPermission($permission);
            });
        }
    }
}
