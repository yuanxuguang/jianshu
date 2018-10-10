

$(".ceshi").click(function(){
    alert(111);
});


$(".like-button").click(function (event) {

    target = $(event.target);
    var current_like = target.attr("like-value");
    var user_id = target.attr("like-user");
    //var _token = target.attr("_token");
    // 已经关注了

    if (current_like == 1) {
        // 取消关注
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "/user/" + user_id + "/unfan",
            method: "POST",
            //data: {"_token": _token},
            dataType: "json",
            success: function success(data) {
                if (data.error != 0) {
                    alert(data.msg);

                }
                target.attr("like-value", 0);
                target.text("关注");
            }
        });
    } else {
        // 关注

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "/user/" + user_id + "/fan",
            method: "POST",
            //data: {"_token": _token},
            dataType: "json",
            success: function success(data) {
                if (data.error != 0) {
                    alert(data.msg);
                }

                target.attr("like-value", 1);
                target.text("取消关注");
            }
        });
    }
});

$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
})

$("button").click(function () {
    target = $(event.target);
    post_id =  target.attr("post-id");
    status = target.attr("post-action-status");
    $.ajax({
        url:"/admin/posts/"+post_id+"/status",
        method:"POST",
        data:{"status":status},
        dataType:"json",
        success:function(data){
            if(data.error!=0){
                alert(data.msg);
                return;
            }
            target.parent().parent().remove();
        }
    })
});





//var editor = new wangEditor('content');
//
//editor.config.uploadImgUrl = '/posts/image/upload';
//
//// 设置 headers（举例）
//editor.config.uploadHeaders = {
//    'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
//};
//
//editor.create();


// $(".like-button").click(function(event){
// 	var like_true = $('like-value').attr();
// 	alert(1);
// 	alert(like_true);
// 	// if()
//    $.ajax({

//    })

// })

