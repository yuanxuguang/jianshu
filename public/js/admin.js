
$(".resource-delete").click(function(event){
    if(confirm("确定要删除")==false){
        return;
    }

    target = $(event.target);
    event.preventDefault();
    url = $(target).attr("delete-url");

    $.ajax({
        url:url,
        method:"POST",
        data:{"_method":'DELETE'},
        dataType:"json",
        success:function(data){
            if(data.error!=0){
                alert(data.msg);
                return;
            }
            window.location.reload();
        }
    })
});

//$(".post_audit").click(function(event){
//    alert(11);
//    target = $(event.target);
//    post_id =  target.attr("post_id");
//    status = target.attr("post-action-status");
//
//    $.ajax({
//        headers: {
//            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
//        },
//        url:"/admin/posts"+post_id+"/status",
//        method:"post",
//        data:{"status":status},
//        dataType:"json",
//        success:function(data){
//            if(data.error!=0){
//                alert(data.msg);
//                return;
//            }
//            target.parent().parent().remove();
//        }
//
//    })
//});
