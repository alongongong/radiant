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
<div id="addrShipDiv">
	<form name="addShipAddrForm" id="addShipAddrForm">
		<legend>배송지 추가</legend>
		<table id="addShipAddrTable">
			<tr>
				<td>배송지명<span>*</span></td>
				<td>
					<input type="text" name="shipName" id="shipName" size="25">
					<div id="shipNameDiv"></div>
				</td>
			</tr>
			<tr>
				<td>배송지 주소<span>*</span></td>
				<td>
					<input type="text" name="shipZipcode" id="shipZipcode" size="20">
					<input type="button" id="findShipZipcode" value="우편번호 찾기"><br>
					<input type="text" name="shipAddr1" id="shipAddr1" size="60"><br>
					<input type="text" name="shipAddr2" id="shipAddr2" size="60">
					<div id="shipAddrDiv"></div>
				</td>
			</tr>
			<tr>
				<td>수령인<span>*</span></td>
				<td>
					<input type="text" name="shipReceiver" id="shipReceiver" size="25">
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
					<input type="text" name="shipTel2" id="shipTel2" size="10"> -
					<input type="text" name="shipTel3" id="shipTel3" size="10">
					<div id="shipTelDiv"></div>
				</td>
			</tr>
			<tr>
				<td>기본 배송지로 설정</td>
				<td>
					<input type="radio" name="baseShipYN" id="baseShipY" value="true" checked>
					<label for="baseShipY" >예</label>
					<input type="radio" name="baseShipYN" value="false" id="baseShipN">
					<label for="baseShipN">아니오</label>
				</td>
			</tr>
		</table>
		<div id="addShipBtnDiv">
			<input type="button" id="addShipCancelBtn" class="btn" value="취소">
			<input type="button" id="addShipBtn" class="btn" value="등록">
		</div>
	</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/radiant/js/mypage.js"></script>
</body>
</html>