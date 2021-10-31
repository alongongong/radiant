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

	// 결제하기 버튼(상세페이지에서 결제하기 버튼)
	$('.like-buy-mycart #buyBtn').click(function(){
		if(document.querySelector('.exec > div') == null){ // 선택한 상품 div가 없을 때
			alert('상품을 선택해주세요.');
		} else { 
			var i = parseInt($('.exec #i').val());
			var color='';
			for(j=0; j<i; j++) {
				color += '&color'+j+'=';
				color += $('.exec #color'+j).val();
			}
			
			location.href='/radiant/order/orderPay.do?mainFileList='+$('#mainFileList').val()+color+'&i='+i;
		}

	});

	
	// 결제페이지 온로드(상세페이지에서 결제하기 버튼)
	$.ajax({
		url: '/radiant/order/getOrderpay.do',
		type: 'post',
		data: 'clNum='+$('#payForm #clNum').val()+'&color='+$('#payForm #color').val() + '&i=' + $('#id').val(),
		dataType: 'json',
		success: function(data){
			for(j=0; j<data.i; j++) {
				
			}
			$('#payForm #productImg').append($('<img>',{
				src: '../img/clothes/'+data.img,
				alt: '상품이미지',
				width: '120px'
			}));
			$('#payForm #productName').append($('<span>',{
				text: data.clName,
				style: 'font-size: 15px; font-weight: bold; margin-bottom: 20px;'
			}));
			$('#payForm #productInfo').append($('<span>',{
				text: data.color + ' / FREE | 수량 : '+data.outCount+'개',
				style: 'font-size: 11px; color: #999; margin-bottom: 5px;'
			}));
			$('#payForm #productPrice').append($('<span>',{
				text: $.comma(parseInt(data.price)*parseInt(data.outCount)) + ' 원',
				style: 'font-size: 13px; color: #999; text-decoration: line-through;'
			})).append($('<span>',{
				text: $.comma(parseInt(data.price)*parseInt(data.outCount)*(100-parseInt(data.salerate))/100)+' 원',
				style: 'font-size: 15px;'
			}))
		
			var price = parseInt(data.price)*parseInt(data.outCount);
			var salerate = parseInt(data.salerate);
			$('#priceAll').text($.comma(price)+'원'); // 총 상품금액
			
			if(price >= 80000) $('#shipMoney').text('0');
			else $('#shipMoney').text('3,000'); // 배송료
			
			var saleMoney = price * salerate / 100;
			$('#saleMoney').text($.comma(saleMoney)); // 기본할인
			$('#totSaleMoney').text($.comma(saleMoney)); // 총할인금액
			var totPrice = price + parseInt($.uncomma($('#shipMoney').text()))-saleMoney
			$('#totPrice').text($.comma(totPrice)); // 촣 결제금액
			
			// 주문자 정보 입력
			$('#userInfoTable #userInfoName').val(data.userName);
			$('#userInfoTable #userInfoTel1').val(data.userTel1);
			$('#userInfoTable #userInfoTel2').val(data.userTel2);
			$('#userInfoTable #userInfoTel3').val(data.userTel3);
			$('#userInfoTable #userInfoEmail').val(data.userEmail);
			
			$.each(data.list, function(index, items){
				$('select').append($('<option>',{
					value: items.shipName,
					text: items.shipName
				}))
				
				$('#shipInfoSelect').change(function(){
					if($('#shipInfoSelect').val()==items.shipName){
						$('#shipInfoTable #shipName').val(items.receiver);
						$('#shipInfoTable #shipTel1').val(items.shipTel1);
						$('#shipInfoTable #shipTel2').val(items.shipTel2);
						$('#shipInfoTable #shipTel3').val(items.shipTel3);
						$('#shipInfoTable #shipZipcode').val(items.shipZipcode);
						$('#shipInfoTable #shipAddr1').val(items.shipAddr1);
						$('#shipInfoTable #shipAddr2').val(items.shipAddr2);
						
					}
				});
			
			});
		}, // success
		error: function(err){
			console.log(err)
		}
	}); // 온로드
	
	
	// 적립금 전체사용 버튼 눌렀을 때
	$('#saleTable #allUseBtn').click(function(){
		var price = parseInt($.uncomma($('#priceAll').text()));
		var saved = parseInt($.uncomma($('#havaSaved').text()));
		var saleMoney = parseInt($.uncomma($('#saleMoney').text()));
		$('#saved').val($('#havaSaved').text()); // 적립금
		$('#useSaved').text($('#havaSaved').text()); // 사용적립금
		$('#totSaleMoney').text($.comma(saved+saleMoney)); // 총할인금액
		
		var totPrice = price + parseInt($.uncomma($('#shipMoney').text()))-(saved+saleMoney);
		$('#totPrice').text($.comma(totPrice));
	})

	// 적립금 입력할 때
	$('#saleTable #saved').change(function(){
		var price = parseInt($.uncomma($('#priceAll').text()));
		var saved = parseInt($.uncomma($('#saved').val()));
		var saleMoney = parseInt($.uncomma($('#saleMoney').text()));
		var haveSaved = parseInt($.uncomma($('#havaSaved').text()));
		alert(saved)
		if(saved > haveSaved) {
			$('#saved').val(($('#havaSaved').text())); // 적립금
			$('#useSaved').text($('#havaSaved').text()); // 사용적립금
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
});
