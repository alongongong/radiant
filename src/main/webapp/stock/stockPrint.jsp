<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 테이블</title>
<style type="text/css">
body{
	margin: 20px;
}
table{
	border: 1px solid #999;
	border-top: 0;
	border-collapse: collapse;
	padding: 5px 10px;
}
#stockTable {
	border-bottom: 0;
	border-right: 0;
}
td, th {
	border: 1px solid #999;
	border-collapse: collapse;
} 
#stockTable td:last-child {
	border: 0;
}
input[type="text"] {
	border: 0;
	text-align: center;
	height: 25px;
}
#stockTable tr:last-child td {
	border-bottom: 0;
}
#main {
	border : 1px solid;
	text-decoration: none;
	color: white;
	background: #39210D;
	position: fixed;
	width: 90px;
	height: 30px;
	text-align: center;
	padding-top: 5px;
	left: 1400px;
	top: 50px;
	border-radius: 5px;
}

.hidden {
	display: none;
}

</style>
</head>
<body>
<form id="stockPrintForm" name="stockPrintForm" method="post" action="/radiant/stock/UpdateDelete.do">
	<table id="stockTable">
		<tr>
			<th>옷번호</th>
			<th>옷이름</th>
			<th>옷색깔</th>
			<th>카테고리</th>
			<th>정가</th>
			<th>할인율</th>
			<th>판매가</th>
			<th>할인금액</th>
			<th>입고</th>
			<th>구매수</th>
			<th>재고</th>
			<th>상세설명</th>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<c:forEach var="stockDTO" items="${list }" varStatus="i">
			<tr onchange="update(${i.count })">
				<td>
					<input type="text" name="clNum${i.count }" id="clNum${i.count }" value="${stockDTO.clNum }" size="7" readonly>
				</td>
				<td>
					<input type="text" name="clName${i.count }" id="clName${i.count }" value="${stockDTO.clName }" size="30">
				</td>
				<td>
					<input type="text" name="color${i.count }" id="color${i.count }" value="${stockDTO.color }" size="7">
				</td>
				<td>
					<input type="text"  name="category${i.count }" id="category${i.count }" value="${stockDTO.category }" size="8">
				</td>
				<td>
					<input type="text" name="price${i.count }" id="price${i.count }" value="${stockDTO.price }" size="10">
				</td>
				<td style="width: 85px;">
					<input type="text" name="salerate${i.count }" id="salerate${i.count }" value="${stockDTO.salerate}" size="5">%
				</td>
				<td>
					<input type="text" id="sellPrice${i.count }" size="10" value="${stockDTO.price*(1-stockDTO.salerate/100) }" readonly>
				</td>
				<td>
					<input type="text" id="salePrice${i.count }" size="10" value="${stockDTO.price*(stockDTO.salerate/100) }" readonly>
				</td>
				<td>
					<input type="text" name="enterCount${i.count }" id="enterCount${i.count }" value="${stockDTO.enterCount }" size="5">
				</td>
				<td>
					<input type="text" name="outCount${i.count }" id="outCount${i.count }" value="${stockDTO.outCount }" size="5">
				</td>
				<td>
					<input type="text" id="stockCount${i.count }" value="${stockDTO.enterCount-stockDTO.outCount }" size="5" readonly>
				</td>
				<td>
					<input type="text" name="clDetail${i.count }" id="clDetail${i.count }" value="${stockDTO.clDetail }">
				</td>
				<td>
					<input type="button" id="optionBtn${i.count }" value="+" onclick="optionView(${i.count})">
				</td>
				<td id="buttonTd${i.count }">
					<input type="button" id="delete${i.count }" value="삭제" onclick="clickBtn('삭제', ${i.count})">
				</td>
				<td>
					<input type="button" id="change${i.count }" value="수정" onclick="clickBtn('수정', ${i.count})" style="visibility: hidden;">
				</td>
			</tr>
			
			<tr onchange="update(${i.count })" id="option${i.count }" class="hidden">
				<td>
					<input type="text" name="clNum${i.count }" id="clNum${i.count }" value="${stockDTO.clNum }" size="7" readonly>
				</td>
				<td>
					<input type="text" name="clName${i.count }" id="clName${i.count }" value="${stockDTO.clName }" size="30">
				</td>
				<td>
					<input type="text" name="color${i.count }" id="colorAdd${i.count }" value="" size="7">
				</td>
				<td>
					<input type="text"  name="category${i.count }" id="category${i.count }" value="${stockDTO.category }" size="8">
				</td>
				<td>
					<input type="text" name="price${i.count }" id="price${i.count }" value="${stockDTO.price }" size="10">
				</td>
				<td style="width: 85px;">
					<input type="text" name="salerate${i.count }" id="salerate${i.count }" value="${stockDTO.salerate}" size="5">%
				</td>
				<td>
					<input type="text" id="sellPrice${i.count }" size="10" value="${stockDTO.price*(1-stockDTO.salerate/100) }" readonly>
				</td>
				<td>
					<input type="text" id="salePrice${i.count }" size="10" value="${stockDTO.price*(stockDTO.salerate/100) }" readonly>
				</td>
				<td>
					<input type="text" name="enterCount${i.count }" id="enterCountAdd${i.count }" value="${stockDTO.enterCount }" size="5">
				</td>
				<td>
					<input type="text" name="outCount${i.count }" id="outCountAdd${i.count }" value="${stockDTO.outCount }" size="5">
				</td>
				<td>
					<input type="text" id="stockCount${i.count }" value="${stockDTO.enterCount-stockDTO.outCount }" size="5" readonly>
				</td>
				<td>
					<input type="text" name="clDetail${i.count }" id="clDetail${i.count }" value="${stockDTO.clDetail }">
				</td>
				<td></td>
				<td id="buttonTd" >
				<input type="button" id="inputBtn" value="추가" onclick="optionAdd(${i.count })"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" name="i" id="i" value="">
	<input type="hidden" name="btn" id="btn" value="">
</form> 

<form id="stockInputForm" name="stockInputForm" method="post" action="/radiant/stock/stockInput.do">
	<table>
		<tr onchange="calculate()">
			<td>
				<input type="text" name="clNum" size="7" readonly>
			</td>
			<td>
				<input type="text" name="clName" size="30">
			</td>
			<td>
				<input type="text" name="color" size="7">
			</td>
			<td>
				<input type="text" name="category" size="8">
			</td>
			<td>
				<input type="text" name="price" size="10">
			</td>
			<td style="width: 85px;">
				<input type="text" name="salerate" value="0" size="5">%
			</td>
			<td>
				<input type="text" name="sellPrice" size="10" readonly>
			</td>
			<td>
				<input type="text" name="salePrice" size="10" readonly>
			</td>
			<td>
				<input type="text" name="enterCount" size="5">
			</td>
			<td>
				<input type="text" name="outCount" size="5" readonly>
			</td>
			<td>
				<input type="text" id="stockCount" size="5" readonly>
			</td>
			<td>
				<input type="text" name="clDetail" >
			</td>
			<td>&ensp;&ensp;&ensp;</td>
			<td id="buttonTd" >
				<button id="inputBtn">추가</button>
			</td>
		</tr>
	</table>
	<br><br>
	<a href="/radiant/main/index.do" id="main">메인화면</a>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function update(i) {
	document.getElementById("i").value=i;
	document.getElementById("change"+i).setAttribute('style','visibility:visible');
	
	var price = document.getElementById("price"+i).value;
	var salerate = document.getElementById("salerate"+i).value;
	document.getElementById("sellPrice"+i).value = price * (100 - salerate)/100;
	document.getElementById("salePrice"+i).value = price * salerate/100;
	
	var enterCount = document.getElementById("enterCount"+i).value;
	var outCount = document.getElementById("outCount"+i).value;
	document.getElementById("stockCount"+i).value = enterCount - outCount;
}
function calculate(){
	var price = document.stockInputForm.price.value;
	var salerate = document.stockInputForm.salerate.value;
	document.stockInputForm.sellPrice.value = price * (100 - salerate)/100;
	document.stockInputForm.salePrice.value = price * salerate/100;
	
	var enterCount = document.stockInputForm.enterCount.value;
	var outCount = document.stockInputForm.outCount.value;
	document.stockInputForm.stockCount.value = enterCount - outCount;
}
function clickBtn(btn, i){
	document.getElementById("i").value=i;
	document.getElementById("btn").value = btn;
	document.stockPrintForm.submit();
}

function optionView(i) {
	if($('#option' + i).attr('class') == 'hidden') {
		$('#option' + i).removeClass();
	}else {
		$('#option' + i).addClass('hidden');
	}
}

function optionAdd(i) {
	$.ajax({
		url: '/radiant/stock/Option.do',
		type: 'post',
		data: {
				'clNum' : $('#clNum' + i).val(),
				'color' : $('#colorAdd' + i).val(),
				'enterCount' : $('#enterCountAdd' + i).val(),
				'outCount' : $('#outCountAdd' + i).val()
				},
		success: function() {
			alert('성공');
		},
		error: function(error) {
			alert('에러');
			console.log(error);		}
		
	});
}


</script>
</body>
</html>