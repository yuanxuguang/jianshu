@extends('public/index')
@section('content')
        <div class="col-sm-8 blog-main">
    <div>
    <div id="carousel-example" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example" data-slide-to="1"></li>
    <li data-target="#carousel-example" data-slide-to="2"></li>
    </ol><!-- Wrapper for slides -->
    <div class="carousel-inner">
    <div class="item active">
    <img  src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1509350030282&di=594d0d7cc7dc19ddfbdbd3cb2e54fdb1&imgtype=0&src=http%3A%2F%2Fwww.uweishi.com%2Fzhuti%2FUploadPic%2F2013-8%2F201381711948158.jpg" style="width:616.66px;height:346.86px" alt="..." />
    <div class="carousel-caption">...</div>
    </div>
    <div class="item">
    <img src="http://ww1.sinaimg.cn/large/44287191gw1excbq6tb3rj21400migrz.jpg" alt="..." />
    <div class="carousel-caption">...</div>
    </div>
    <div class="item">
    <img src="http://ww2.sinaimg.cn/large/44287191gw1excbq4kx57j21400migs4.jpg" alt="..." />
    <div class="carousel-caption">...</div>
    </div>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#carousel-example" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
    </div>        <div style="height: 20px;">
    </div>
    <div>
    @if($posts)
        @foreach($posts as $post)
    <div class="blog-post">
    <h2 class="blog-post-title"><a href="/posts/{{$post->id}}" >{{$post->title}}</a></h2>
    <p class="blog-post-meta">{{$post->created_at->toFormattedDateString()}}<a href="/user/{{$post->user_id}}"> {{$post->user->name}}</a></p>
    <p>{!! str_limit($post->content,100,'....')  !!}
    <p class="blog-post-meta">赞  {{$post->zan_count}}| 评论 {{$post->comments_count}}</p>
    </div>
    @endforeach
    @endif
       {{$posts->links()}}
    </div><!-- /.blog-main -->
    </div>
@endsection