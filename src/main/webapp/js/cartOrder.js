// 결제하기 버튼(장바구니에서 결제하기 버튼)
$(function(){
	$('#cart_all_order').click(function(){
		$('.productCheck').prop('checked', true);
		
		if(document.querySelector('.productCheck') == false){ // 선택한 상품 div가 없을 때
			alert('상품을 선택해주세요.');
		} else { 
			var i = parseInt($('.productCheck:checked').length);
			var cart_id='';
			for(j=0; j<i; j++) {
				cart_id += '&cart_id'+j+'=';
				cart_id += $('.cart_id:eq(' + j +')').val();
				
			} // for
			
			location.href='/radiant/order/cartOrderPay.do?i='+i+cart_id;
		}

	});
	
	
	$('#cart_order').click(function(){
		
		if(document.querySelector('.productCheck') == false){ // 선택한 상품 div가 없을 때
			alert('상품을 선택해주세요.');
		} else { 
			var i = parseInt($('.productCheck:checked').length);
			var length = parseInt($('.productCheck').length); 
			var cart_id='';
			var k=0;
			for(j=0; j<length; j++) {
				if($('.productCheck:eq('+j+')').prop('checked')) {
					cart_id += '&cart_id'+k+'=';
					cart_id += $('.productCheck:eq(' + j +')').val();
					k++;
				}
			} // for
			
			location.href='/radiant/order/cartOrderPay.do?i='+i+cart_id;
		}

	});

	$('.paymentLi:eq(1)').prop('style','background: #3E3E3E');
	
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
			$('#paymentCheck').val($(this).find('img:eq(1)').attr('alt'));
		}
		
	});

	
	// 적립금 전체사용 버튼 눌렀을 때
	$('#saleTable #allUseBtn').click(function(){
		var price = parseInt($.uncomma($('#priceAll').text()));
		var saved = parseInt($.uncomma($('#haveSaved').text()));
		var saleMoney = parseInt($.uncomma($('#saleMoney').text()));
		$('#saved').val($('#haveSaved').text()); // 적립금
		$('#useSaved').text($('#haveSaved').text()); // 사용적립금
		$('#totSaleMoney').text($.comma(saved+saleMoney)); // 총할인금액
		
		var totPrice = price + parseInt($.uncomma($('#shipMoney').text()))-(saved+saleMoney);
		$('#totPrice').text($.comma(totPrice));
	})

	// 적립금 입력할 때
	$('#saleTable #saved').change(function(){
		var price = parseInt($.uncomma($('#priceAll').text()));
		var saved = parseInt($.uncomma($('#saved').val()));
		var saleMoney = parseInt($.uncomma($('#saleMoney').text()));
		var haveSaved = parseInt($.uncomma($('#haveSaved').text()));
		alert(saved)
		if(saved > haveSaved) {
			$('#saved').val(($('#haveSaved').text())); // 적립금
			$('#useSaved').text($('#haveSaved').text()); // 사용적립금
			saved = parseInt($.uncomma($('#saved').val()));
			
			$('#totSaleMoney').text($.comma(saved+saleMoney)); // 총할인금액
			
			var totPrice = price + parseInt($.uncomma($('#shipMoney').text()))-(saved+saleMoney);
			$('#totPrice').text($.comma(totPrice));
		} else {
			$('#saved').val($.comma($('#saved').val())); // 적립금
			$('#useSaved').text($('#saved').val()); // 사용적립금
			$('#totSaleMoney').text($.comma(saved+saleMoney)); // 총할인금액
			
			var totPrice = price + parseInt($.uncomma($('#shipMoney').text()))-(saved+saleMoney);
			$('#totPrice').text($.comma(totPrice));
		}
	});

	// 배송지 주문인 정보와 동일 버튼
	$('#shipInfoTable #userSame').change(function(){
		if($('#shipInfoTable #userSame').is(':checked')) {
			$('#shipInfoTable #shipName').val($('#userInfoTable #userInfoName').val());
			$('#shipInfoTable #shipTel1').val($('#userInfoTable #userInfoTel1').val());
			$('#shipInfoTable #shipTel2').val($('#userInfoTable #userInfoTel2').val());
			$('#shipInfoTable #shipTel3').val($('#userInfoTable #userInfoTel3').val());
		}
	});
	
	// 우편번호 검색 버튼
	$('#shipInfoTable #zipcodeBtn').click(function(){
		window.open("/radiant/mypage/checkPostForm.do",
				"checkPost",
				"width=500 height=500 top 200 left=700");
	});


	// 세자리마다 콤마찍기 함수
	$.comma = function (x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	// 콜마 없애기 함수
	$.uncomma =  function (x) {
		return x.replace(/[^\d]+/g, '');
	}


	// 결제페이지에서 결제버튼
	$('#payForm #orderPayBtn').click(function(){
		// 유효성 검사
		$('#noticeDiv').text('');
		
		if($('#userInfoName').val()==''){
			$('#noticeDiv').text('주문자 정보를 입력해주세요.');
			$('#userInfoName').focus();
		} else if($('#userInfoTel1').val()==''){
			$('#noticeDiv').text('주문자 정보를 입력해주세요.');
			$('#userInfoTel1').focus();
		} else if($('#userInfoTel2').val()==''){
			$('#noticeDiv').text('주문자 정보를 입력해주세요.');
			$('#userInfoTel2').focus();
		} else if($('#userInfoTel3').val()==''){
			$('#noticeDiv').text('주문자 정보를 입력해주세요.');
			$('#userInfoTel3').focus();
		} else if($('#userInfoEmail').val()==''){
			$('#noticeDiv').text('주문자 정보를 입력해주세요.');
			$('#userInfoEmail').focus();
		} else if($('#shipName').val()==''){
			$('#noticeDiv').text('배송지 정보를 입력해주세요.');
			$('#shipName').focus();
		} else if($('#shipTel2').val()==''){
			$('#noticeDiv').text('배송지 정보를 입력해주세요.');
			$('#shipTel2').focus();
		} else if($('#shipTel3').val()==''){
			$('#noticeDiv').text('배송지 정보를 입력해주세요.');
			$('#shipTel3').focus();
		} else if($('#shipZipcode').val()==''){
			$('#noticeDiv').text('배송지 정보를 입력해주세요.');
			$('#shipZipcode').focus();
		} else if($('#shipAddr2').val()==''){
			$('#noticeDiv').text('배송지 정보를 입력해주세요.');
			$('#shipAddr2').focus();
		} else {

			$.ajax({
				url: '/radiant/order/orderPaying.do',
				type: 'post',
				data: $('#payForm').serialize(),
				success: function(data){
					location.href='/radiant/order/orderComplete.do';
					
				},
				error: function(err){
					console.log(err);
				}
			});
		} // if
	});	
	
});
