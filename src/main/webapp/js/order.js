$(function() {
	$('li:eq(1)').prop('style','background: #3E3E3E');
	
	$('.paymentLi').click(function(){
		if($(this).attr('data-num')=='0') {
			$(this).attr('data-num','1');
			$('li').not(this).attr('data-num','0');
			$(this).css('background', '#3E3E3E');
			$('li').not(this).css('background', 'white');
			$(this).find('img:eq(0)').removeClass('paymentImg');
			$(this).find('img:eq(0)').addClass('paymentHidden');
			$(this).find('img:eq(1)').removeClass('paymentImgCheckHidden');
			$(this).find('img:eq(1)').addClass('paymentImgCheck');
			$('li').not(this).find('.paymentHidden').removeClass('paymentHidden').addClass('paymentImg');
			$('li').not(this).find('.paymentImgCheck').removeClass('paymentImgCheck').addClass('paymentImgCheckHidden');
			//$('li').not(this).find('.paymentImg').removeClass('paymentHidden');
			//$('li').not(this).find('.paymentCheck .paymentHidden').removeClass('paymentCheck');	
		}
	});

	// 결제하기 버튼
	$('.like-buy-mycart #buyBtn').click(function(){
		if($('#colorSelect > option:selected').val()=='null' || $('#sizeSelect > option:selected').val()=='none'){
			alert('상품을 선택해주세요.');
		} else {
			location.href='/radiant/order/orderPay.do?mainFileList='+$('#mainFileList').val()+'&color='+$('#colorSelect > option:selected').val();
		}
		
		
		
	});

	
	// 결제페이지 온로드
	$.ajax({
		url: '/radiant/order/getOrderpay.do',
		type: 'post',
		data: 'product_id='+$('#payForm #product_id').val()+'&color='+$('#product_id #color').val(),
		dataType: 'json',
		success: function(data){
			
		},
		error: function(err){
			console.log(err)
		}
	});
	
});
