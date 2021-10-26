$(function(){
	/*배송지 추가창*/
	$('#addShipBtn').click(function(){
		window.open("/radiant/mypage/addShipAddrForm.do",
					"addShipAddr",
					"width=600 height=550 top=200 left=700");
	});
	
	/* 배송지 추가 우편번호 버튼*/
	$('#shipZipcode').click(function(){
		window.open("/radiant/mypage/chechPost.do",
				"checkPost",
				"width=500 height=500 top 200 left=700");
	});
	
	/* 우편번호 추가*/
	$('.addressA').click(function(){
		$('#shipZipcode', opener.document).val($(this).parent().next().text());
		$('#shipAddr1', opener.document).val($(this).text());
		window.close();
		$('#shipAddr2', opener.document).focus();
	});
	
	/*배송지 추가 취소 버튼*/
	$('#addShipCancelBtn').click(function(){
		if(confirm("정말 취소하시겠습니까?"))
			window.close();
	});
	
	/*배송지 추가 등록 버튼*/
	$('#addShipBtn').click(function(){
		if($('#shipName').val == ''){
			$('#shipNameDiv').text('배송지명을 입력해주세요.');
			$('#shipName').focus();
		} else if($('#shipZipcode').val() == '' || $('#shipAddr1').val() == '' || $('#shipAddr2').val() == '') {
			$('#shipAddrDiv').text('배송지 주소를 입력해주세요.');
			$('#shipAddr2').focus();
		} else if($('#shipReceiver').val()=='') {
			$('#shipReceiverDiv').text('수령인을 입력해주세요.');
			$('#shipReceiver').focus();
		} else if($('#shipTel2').val() == '') {
			$('#shipTelDiv').text('휴대폰 번호를 입력해주세요.');
			$('#shipTel2').focus();
		} else if($('#shipTel3').val() == '') {
			$('#shipTelDiv').text('휴대폰 번호를 입력해주세요.');
			$('#shipTel3').focus();
		} else {
			$.ajax({
				url: '/radiant/mypage/addShipAddr.do',
				type: 'post',
				data: $('#addShipAddrForm').serialize(),
				success: function(data) {
					alert('배송지가 추가되었습니다.');
					window.close();
					opener.document.location.href="/radiant/mypage/manageShip.do";
				},
				error: function(err) {
					console.log(err);
				}
			});
		}
	});
});