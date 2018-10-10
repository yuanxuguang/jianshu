@extends('admin.layout.main')
@section('content')
<!-- Main content -->
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-10 col-xs-6">
            <div class="box">

                <div class="box-header with-border">
                    <h3 class="box-title">角色列表</h3>
                </div>
                <a type="button" class="btn " href="/admin/rolesAdd" >增加角色</a>
                <!-- /.box-header -->
                <div class="box-body">
                    <table class="table table-bordered">
                        <tbody><tr>
                            <th style="width: 10px">#</th>
                            <th>角色名称</th>
                            <th>角色描述</th>
                            <th>操作</th>
                        </tr>
                        @foreach($roles as $row)
                        <tr>
                            <td>{{$row->id}}</td>
                            <td>{{$row->name}}</td>
                            <td>{{$row->desc}}</td>
                            <td>
                                <a type="button" class="btn" href="/admin/roles/{{$row->id}}/permission" >权限管理</a>
                            </td>
                        </tr>
                        @endforeach
                        </tbody></table>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- /.content -->
@endsection
