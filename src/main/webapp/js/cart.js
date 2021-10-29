$(document).ready(function(){
	$('#bottomline #delete_img').click(function(){
		var result = confirm('삭제하시겠습니까?');
		
		if(result){
			//yes
			$.get(url, {'cart_id':cart_id}, function(data){
				alert("삭제하였습니다.");
				location.href="/radiant//cart/cartDelete.do";
			}).fail(function(){
				alert("오류가 발생했습니다. 잠시 후에 다시 시도해주세요.");
			});
	
		}else{
			//no
		}
	});	
});

$('#cart_clean').click(function(){
	
});