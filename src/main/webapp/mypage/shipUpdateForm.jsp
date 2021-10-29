<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Radiant 레디언트</title>
<link rel="stylesheet" href="/radiant/css/order.css">
<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
</head>
<body>
<input type="hidden" id="shipName" value="${shipName }">
<div id="addrShipDiv">
	<form name="addShipAddrForm" id="addShipAddrForm">
		<legend>배송지 수정</legend>
		<table id="addShipAddrTable">
			<tr>
				<td>배송지명<span>*</span></td>
				<td>
					<input type="text" name="shipName" id="shipName1" size="25" value="" readonly>
					<div id="shipNameDiv"></div>
				</td>
			</tr>
			<tr>
				<td>배송지 주소<span>*</span></td>
				<td>
					<input type="text" name="shipZipcode" id="shipZipcode" size="20" value="">
					<input type="button" id="findShipZipcode" value="우편번호 찾기" value=""><br>
					<input type="text" name="shipAddr1" id="shipAddr1" size="60" value=""><br>
					<input type="text" name="shipAddr2" id="shipAddr2" size="60" value="">
					<div id="shipAddrDiv"></div>
				</td>
			</tr>
			<tr>
				<td>수령인<span>*</span></td>
				<td>
					<input type="text" name="shipReceiver" id="shipReceiver" size="25" value="">
					<div id="shipReceiverDiv"></div>
				</td>
			</tr>
			<tr>
				<td>휴대폰번호<span>*</span></td>
				<td>
					<select name="shipTel1" id="shipTel1" style="width: 80px; height: 25px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</select> -
					<input type="text" name="shipTel2" id="shipTel2" size="10" value=""> -
					<input type="text" name="shipTel3" id="shipTel3" size="10" value="">
					<div id="shipTelDiv"></div>
				</td>
			</tr>
			<tr>
				<td>기본 배송지로 설정</td>
				<td>
					<input type="radio" name="baseShipYN" id="baseShipY" value="true">
					<label for="baseShipY" >예</label>
					<input type="radio" name="baseShipYN" value="false" id="baseShipN">
					<label for="baseShipN">아니오</label>
				</td>
			</tr>
		</table>
		<div id="addShipBtnDiv">
			<input type="button" id="addShipCancelBtn" class="btn" value="취소">
			<input type="button" id="addShipUpdateBtn" class="btn" value="수정" disabled>
		</div>
	</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$.ajax({
			url: '/radiant/mypage/getShip.do',
			type: 'post',
			data: 'shipName=' + $('#shipName').val(),
			dataType: 'json',
			success: function(data) {
				$('#shipName1').val(data.shipName);
				$('#shipZipcode').val(data.shipZipcode);
				$('#shipAddr1').val(data.shipAddr1);
				$('#shipAddr2').val(data.shipAddr2);
				$('#shipReceiver').val(data.receiver);
				$('#shipTel1').val(data.shipTel1);
				$('#shipTel2').val(data.shipTel2);
				$('#shipTel3').val(data.shipTel3);
				if(eval(data.baseShipCheck)) {
					$('input[value=true]').attr('checked', 'true');
				}else {
					$('input[value=false]').attr('checked', 'true');
				}
				
			},
			error: function() { alert("실패"); }
		});
	});
	
	$('#addShipAddrForm').change(function() {
		$('#addShipUpdateBtn').prop('disabled', '');
	})
	$('#addShipUpdateBtn').click(function() {
		$.ajax({
			url: '/radiant/mypage/shipUpdate.do',
			type: 'post',
			data: $('#addShipAddrForm').serialize(),
			dataType: 'text',
			success: function() { 
				window.close(); 
				opener.document.location.href="/radiant/mypage/manageShip.do";
				},
			error: function() { alert('실패'); }
		});
		
		//location.href="/radiant/mypage/manageShip.do";
	});
</script>
</body>
</html>