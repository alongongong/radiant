$(function(){
	/*배송지 추가창*/
	$('#addShipBtn').click(function(){
		window.open("/radiant/mypage/addShipAddrForm.do",
					"addShipAddr",
					"width=600 height=550 top=200 left=700");
	});
	
	/* 배송지 온로드 */
	$.ajax({
		url: '/radiant/mypage/manageShipPrint.do',
		type: 'get',
		data: 'pg=1',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					align: 'center'
				}).append($('<input>',{
					type: 'checkbox',
					class: 'shipCheck'
				})).append($('<input>',{
					type: 'hidden',
					value: items.baseShipCheck,
					class: 'baseShip'
				}))).append($('<td>',{
					align: 'center',
					text: items.shipName,
					class: 'shipName'
				})).append($('<td>',{
					text: items.shipAddr1 + ' '
						+items.shipAddr2,
				})).append($('<td>',{
					align: 'center'
				}).append($('<input>',{
					type: 'button',
					class: 'updateShipBtn',
					value: '수정'
				})).append($('<input>',{
					type: 'button',
					class: 'deleteShipBtn',
					value: '삭제'
				}))).appendTo($('#manageShipTable > tbody'));
			
				/* 기본배송지에 체크하기*/
				if(eval(items.baseShipCheck)) {
					$('.shipCheck:eq('+index+')').prop('checked',true);
				
					/* 기본배송지 체크 */
					$('#baseShipBtn').click(function(){
						if($('.shipCheck:eq('+index+')').prop('checked')) {
							alert('기본 배송지입니다.');
						} else {
							var newBaseShip = $('#manageShipTable').find('.shipCheck:checked').parent().next().text();
							$.ajax({
								url: '/radiant/mypage/changeBaseShip.do',
								type: 'post',
								data: 'shipName='+$('.shipName:eq('+index+')').text()+'&newBaseShip='+newBaseShip,
								success: function(data){
									alert('기본 배송지가 수정되었습니다.');
								},
								error: function(err){
									console.log(err);
								}
							});
						}	
					});
				}
				
			});
				
			/* 체크박스에 1개만 체크되게 하기 */
			$('.shipCheck').click(function(){
				$('.shipCheck').prop('checked',false);
				$(this).prop('checked',true);
			});
		},
		error: function(err){
			console.log(err);
		}
	});
	
	$(document).on("click", 'input.deleteShipBtn', function() {
		var shipName = $(this).parent().prev().prev().html();
		$.ajax({
			url: '/radiant/mypage/shipAddrDelete.do',
			type: 'post',
			data: 'shipName=' + shipName,
			success: function() { location.href="/radiant/mypage/manageShip.do"},
			error: function() { alert('실패'); }
		});
		
	});
	
	/* 배송지 추가 우편번호 버튼*/
	$('#findShipZipcode').click(function(){
		window.open("/radiant/mypage/checkPostForm.do",
				"checkPost",
				"width=500 height=500 top 200 left=700");
	});
	/* 우편번호 검색 버튼*/
	$('#checkPostForm #checkPostSearchBtn').click(function(){
		$.ajax({
			url: '/radiant/mypage/checkPost.do',
			type: 'post',
			data: $('#checkPostForm').serialize(),
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				
				
				$('#checkPostForm > table tr:gt(2)').remove();
				
				if(data.list != '') {
					$.each(data.list, function(index, items){
						var address = items.sido + ' '
							+ items.sigungu + ' '
							+ items.yubmyundong + ' '
							+ items.ri + ' '
							+ items.roadname + ' '
							+ items.buildingname;
						
						address = address.replace(/undefined/g, '');
						
						$('<tr>').append($('<td>', {
							align: 'center',
							text: items.zipcode
						})).append($('<td>',{
							colspan: 3
						}).append($('<a>',{
							href: '#',
							text: address,
							class: 'addressA'
						}))).appendTo($('#checkPostForm > table'));
					});
					
					// 우편번호의 주소 클릭
					$('.addressA').click(function(){
						$('#shipZipcode', opener.document).val($(this).parent().prev().text());
						$('#shipAddr1', opener.document).val($(this).text());
						window.close();
						$('#shipAddr2', opener.document).focus();
					});
					
				} else {
					$('<tr>').append($('<td>',{
						colspan: '4',
						id: 'addrEmptyTd',
						align: 'center',
						text: '주소를 확인 후 다시 검색해 주세요.'
					})).appendTo('#checkPostForm > table');
				}
			},
			error: function(err){
				console.log(err);
			}
			
		});
	});

	/* 기본 배송지 설정 버튼 */
	$(document).on('click', '#baseShipBtn', function(){
		
	});

	/*배송지 추가 취소 버튼*/
	$('#addShipCancelBtn').click(function(){
		if(confirm("정말 취소하시겠습니까?"))
			window.close();
	});
	
	/*배송지 추가 등록 버튼*/
	$('#addShipOkBtn').click(function(){
		if($('#shipName').val() == ''){
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