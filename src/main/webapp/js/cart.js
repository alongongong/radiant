$(document).ready(function(){
	//x눌러서 하나씩 지우기
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
	//장바구니 비우기 눌러서 다 지우기
	$('#cart_clean').click(function(){
		var result = confirm('삭제하시겠습니까?');
		
		if(result){
			//yes
			var userid=$('#userid').val();
			
			var url = "/radiant/cart/cartDeleteAll.do";
			$.get(url, {'userid':userid},function(){
				alert("삭제하였습니다.");
				location.href="/radiant/cart/cartPrint.do?userid="+$('#userid').val();
			}).fail(function(){
				alert("실패");
			})
			
		}else{
			//no
		}
	});
	

	
	//수량 감소 
	$('#countline #count_minus').click(function(){
		
		var start = $(this).next().val();
		var num = Number(start);
		
		if(num<=1){
			num = 1;
		}else{
			num -= 1;
			
			var price = Number($(this).parent().next().html());
			var total = Number($('#total_price').text())-price;
			var del_account = total > 80000 || total == 0 ? 0 : 3000;
			
			$('#del_account').html(del_account);
				$('#total_price').html(total);
				$('#use_account').html(total+del_account);
		}
		
			
		
		$(this).next().val(num);
		
		var amount =num;
		
		var url="/radiant/cart/cartAmount.do"
		var cart_id = $(this).parent().next().next().find('input').val();
		
		$.get(url,{'amount':amount , 'cart_id':cart_id}, function(){
	
		}).fail(function(){
			alert("실패");
		});		
			
	});
	
	//수량 증가
	$('#countline #count_plus').click(function(){
		var start = $(this).prev().val();
		var num = Number(start);
		
		num += 1;
	
		$(this).prev().val(num);
		
		var price = Number($(this).parent().next().html());
		var total = Number($('#total_price').text())+price;
		var del_account = total > 80000 || total == 0 ? 0 : 3000;
		//alert(total);
		

		
		var amount =num;
		
		var url="/radiant/cart/cartAmount.do"
		var cart_id = $(this).parent().next().next().find('input').val();
		$.get(url,{'amount':amount , 'cart_id':cart_id}, function(){
			//alert("확인");
			$('#del_account').html(del_account);
			$('#total_price').html(total);
			$('#use_account').html(total+del_account);
		}).fail(function(){
			alert("실패");
		});		
			
	});
	
	//전체 체크박스 클릭시 개별박스 선택
	$('input:checkbox[name="chkAll"]').click(function(){
		if($(this).is(":checked")){
			$('input:checkbox[name="checkbox"]').prop("checked", true);
		}else{
			$('input:checkbox[name="checkbox"]').prop("checked", false);
		}
	});

});


