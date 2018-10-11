@extends('public/index')
@section('content')
    <div class="alert alert-success" role="alert">
        下面是搜索"{{$query}}"出现的文章，共{{$list->count()}}条
    </div>

    <div class="col-sm-8 blog-main">
        @foreach($list as $ls)
            <div class="blog-post">
                <h2 class="blog-post-title"><a href="/posts/{{$ls->id}}" >{{$ls->title}}</a></h2>
                <p class="blog-post-meta">{{$ls->created_at->toFormattedDateString()}} <a href="#">{{$ls->user->name}}</a></p>
                <p class="blog-post-meta">赞  {{$ls->zan_count}} | 评论 {{$ls->comments_count}}</p>
            </div>
        @endforeach



    </div><!-- /.blog-main -->


@endsection
