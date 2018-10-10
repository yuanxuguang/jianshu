
@extends('public/index')
@section('content')
    <script type="text/javascript" charset="utf-8" src="/js/ueditor/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="{{URL::asset('/js/ueditor/ueditor/ueditor.all.min.js')}}"> </script>
    <script type="text/javascript" charset="utf-8" src="{{URL::asset('/js/ueditor/ueditor/lang/zh-cn/zh-cn.js')}}"></script>
        <div class="col-sm-8 blog-main">
            <form action="/posts/update" method="POST">
                {{method_field("PUT")}}
                {{csrf_field()}}
                {{--<input type="hidden" name="_method" value="PUT">--}}
                <input type="hidden" name="id" value="{{$post->id}}">

                <div class="form-group">
                    <label>标题3</label>
                    <input name="title" type="text" class="form-control" placeholder="这里是标题" value="{{$post->title}}">
                </div>
                <div class="form-group">
                    <label>内容</label>
           <!--          <textarea id="content" name="content" class="form-control" style="height:400px;max-height:500px;"  placeholder="这里是内容">&lt;p&gt;{!! $post->content !!}
                    &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;</textarea> -->

                    <script id="editor" type="text/plain"  name="content" style="width:580px;height:420px;">{!! $post->content !!}</script>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
            <br>
        </div><!-- /.blog-main -->
        <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    @endsection

