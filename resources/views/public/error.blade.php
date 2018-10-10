<div>
<div class=" xuan" role="alert">
    @if(count($errors)>0)
        <ul>
            @foreach($errors->all() as $error)
                <li>{{$error}}</li>
            @endforeach
        </ul>
    @endif
</div>

<div>
    @if(session('success'))
<div class="alert alert-danger">
        {{session('success')}}  
    </div> 
    @endif
</div>
<div>
    @if(session('error'))
       <div class="alert alert-danger">
        {{session('error')}}
    </div>
    @endif
</div>