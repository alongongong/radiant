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
#stockTable, #stockTable th, #stockTable td {
	border: 1px solid #999;
	border-collapse: collapse;
	padding: 10px 20px;
}
</style>
</head>
<body>
<form id="stockPrintForm" name="stockPrintForm" method="post" action="">
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
		</tr>
		<c:forEach var="stockDTO" items="${list }">
			<tr>
				<td>
					<input type="text" value="${stockDTO.clNum }">
				</td>
				<td>
					<input type="text" value="${stockDTO.clName }">
				</td>
				<td>
					<input type="text" value="${stockDTO.color }">
				</td>
				<td>
					<input type="text" value="${stockDTO.category }">
				</td>
				<td>
					<input type="text" value="${stockDTO.price }">
				</td>
				<td>
					<input type="text" value="${stockDTO.salerate }">
				</td>
				<td>
					<input type="text" value="${stockDTO.price *(1 - stockDTO.salerate) }">
				</td>
				<td>
					<input type="text" value="${stockDTO.price * stockDTO.salerate }">
				</td>
				<td>
					<input type="text" value="${stockDTO.enterCount }">
				</td>
				<td>
					<input type="text" value="${stockDTO.outCount }">
				</td>
				<td>
					<input type="text" value="${stockDTO.enterCount - stockDTO.outCount }">
				</td>
			</tr>
		</c:forEach>
		
	</table>
</form> 
</body>
</html>