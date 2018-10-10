@extends('public/index')
@section('content')
    @include('public.error')
    <script type="text/javascript" charset="utf-8" src="/js/ueditor/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="{{URL::asset('/js/ueditor/ueditor/ueditor.all.min.js')}}"> </script>
    <script type="text/javascript" charset="utf-8" src="{{URL::asset('/js/ueditor/ueditor/lang/zh-cn/zh-cn.js')}}"></script>

        <div class="col-sm-8 blog-main">
            <form action="/posts" method="POST" enctype="multipart/form-data">
                {{--<input type="hidden" name="_token" value="{{ csrf_token() }}">--}}
                {{csrf_field()}}
                <div class="form-group">
                    <label>标题</label>
                    <input name="title" type="text" class="form-control" placeholder="这里是标题">
                </div>
                <div class="form-group">
                    <label>内容</label>
                    <script id="editor" type="text/plain"  name="content" style="width:580px;height:420px;">{{old('content')}}</script>
         <!--            <input type="file" name="file" id="file" > -->
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
            <br>
        </div><!-- /.blog-main -->
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
 @endsection

