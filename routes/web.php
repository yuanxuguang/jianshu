<?php
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!

*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/', "\App\Http\Controllers\LoginController@index");
Route::get('/register','UserController@register');
Route::post('/doregister','UserController@do_register');
Route::get('/login/','UserController@login');
Route::post('/dologin','UserController@do_login');
Route::get('/','posteController@index');
Route::get('/logout','UserController@logout');
Route::group(['middleware' => 'login'],function(){
// Route::get('profile',function(){
Route::get('/user/setting','UserController@setting');
Route::get('/user/{user}','UserController@homepage');   //{user} 是模型 跟模型名称就是模型.
Route::post('/user/set','UserController@user_set');
//详情
Route::get('/posts/{post}','posteController@show')->where(['post'=>'[0-9]+']);
//创建   get 和 PUT路由一样  方式不一样
Route::get('/posts/create','posteController@create');
Route::post('/posts/','posteController@store');
Route::post('/posts/comment/{id}','posteController@comment');
//posteController
//zan
Route::get('/posts/{id}/zan','posteController@zan');
//unzan
Route::get('/posts/{id}/unzan','posteController@unzan');
//关注
Route::post('/user/{user}/fan','userController@fan');
Route::post('/user/{user}/unfan','userController@unfan');
Route::get('/posts/{post}/edit','posteController@edit');
Route::put('/posts/{post}','posteController@update');
Route::get('/posts/search','posteController@search');
Route::any('/posts/delete/{id}','posteController@delete');
    Route::any('/search','posteController@search');
//图片上传
Route::any('/posts/image/upload','posteController@imgupload');
//专题
Route::get('/topic/{topic}','posteController@topic');
Route::get('/topic/submit/{topic}','posteController@submit');
//通知
Route::get('/notices','NoticeController@index');
});

//Route::group(['prefix' => 'posts'],'posteController@index');
// })->middleware('auth');
Route::group(['prefix' => 'admin'],function(){
    Route::get('/login','AdminLoginController@login');
    Route::post('/doLogin','AdminLoginController@doLogin');
    Route::get('/logOut','AdminLoginController@loginOut');

    Route::group(['middleware'=>'auth:admin'],function(){

        Route::get('/index','AdminLoginController@index');
        Route::group(['middleware'=>'can:system'],function(){
            Route::get('/users','AdminController@adminUsers');
            Route::get('/users/add','AdminController@adminUsersAdd');
            Route::post('/users/doAdd','AdminController@doAdminUsersAdd');
            //用户有哪些角色 用户角色关联页面
            Route::get('/users/{user}/role','AdminController@Role');
            Route::post('/users/{user}/role','AdminController@StoreRole');

            //角色列表页
            Route::get('/rolesList','AdminRoleController@rolesList');
            Route::get('/rolesAdd','AdminRoleController@rolesAdd');
            Route::post('/rolesDoAdd','AdminRoleController@rolesDoAdd');
            Route::get('/rolesDelete','AdminRoleController@rolesDelete');
            Route::get('/roles/{role}/permission','AdminRoleController@permission');
            Route::post('/roles/{role}/permission','AdminRoleController@storePermission');
            //权限列表
            Route::get('/permissionList','AdminPermissionController@permissionList');
            Route::get('/permissionAdd','AdminPermissionController@permissionAdd');
            Route::post('/permissions/store','AdminPermissionController@permissionDoAdd');
            Route::get('/permissionDelete','AdminPermissionController@permissionDelete');
        });
        //路由使用gate 门卫做权限  @can : post post 为gate名称 权限名称 如果有这个权限就可以访问该路由
        Route::group(['middleware'=>'can:post'],function() {
            Route::get('/posts', 'AdminPostController@postList');
            Route::post('/posts/{post}/status', 'AdminPostController@postStatus');
        });

        Route::resource('/topics', 'AdminTopicController',['only'=>['index','create','store','destroy']]);

        Route::resource('/notices','AdminNoticeController',['only'=>['index','create','store']]);

});


});