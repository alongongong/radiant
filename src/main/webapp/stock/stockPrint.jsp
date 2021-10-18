<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 테이블</title>
<style type="text/css">
#stockPrintForm{
	margin: 20px;
}
#stockTable, #stockTable th{
	border: 1px solid #999;
	border-collapse: collapse;
	padding: 5px 10px;
}
#stockTable td {
	border: 1px solid #999;
	border-collapse: collapse;
} 
input {
	border: 0;
	text-align: center;
	height: 25px;
}
tr td:last-child {
	width: 45px;
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
		</tr>
		<c:forEach var="stockDTO" items="${list }" varStatus="i">
			<tr onchange="update(${i.count })">
				<td>
					<input type="text" name="clNum${i.count }" value="${stockDTO.clNum }" size="7" readonly>
				</td>
				<td>
					<input type="text" name="clName${i.count }" value="${stockDTO.clName }" size="10">
				</td>
				<td>
					<input type="text" name="color${i.count }" value="${stockDTO.color }" size="10">
				</td>
				<td>
					<input type="text" name="category${i.count }" value="${stockDTO.category }" size="10">
				</td>
				<td>
					<input type="text" name="price${i.count }" value="${stockDTO.price }" size="10">
				</td>
				<td style="width: 85px;">
					<input type="text" name="salerate${i.count }" value="${stockDTO.salerate}" size="5">%
				</td>
				<td>
					<input type="text" value="${stockDTO.price *(100 - stockDTO.salerate) / 100 }" size="10" readonly>
				</td>
				<td>
					<input type="text" value="${stockDTO.price * stockDTO.salerate / 100 }" size="10" readonly>
				</td>
				<td>
					<input type="text" name="enterCount${i.count }" value="${stockDTO.enterCount }" size="5">
				</td>
				<td>
					<input type="text" name="outCount${i.count }" value="${stockDTO.outCount }" size="5">
				</td>
				<td>
					<input type="text" value="${stockDTO.enterCount - stockDTO.outCount }" size="5" readonly>
				</td>
				<td>
					<input type="text" name="clDetail${i.count }" value="${stockDTO.clDetail }" readonly>
				</td>
				<td id="buttonTd${i.count }" >
					<button id="change${i.count }" style="visibility: hidden;">수정</button>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	<input type="hidden" name="i" id="i" value="">
</form> 

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function update(i) {
//	$('#buttonTd'+i).append('<button type="button" onclick="updateBtn("'+i+'")">수정</button>');
	document.getElementById("i").value=i;
	document.getElementById("change"+i).setAttribute('style','visibility:visible');
}
</script>
</body>
</html>