$(document).ready(function(){
	$('#bottomline #delete_img').click(function(){
		var result = confirm('삭제하시겠습니까?');
		
		if(result){
			//yes
			var cart_id =$(this).find('input').val();
			
			alert(cart_id);
			var url = "/radiant/cart/cartDelete.do";
			$.get(url, {'cart_id':cart_id}, function(){
				alert("삭제하였습니다.");
				location.href="/radiant/cart/cartPrint.do?userid="+$('#userid').val();
			}).fail(function(){
				alert("실패");
			});
	
		}else{
			//no
		}
	});	
});

$('#cart_clean').click(function(){
	
});