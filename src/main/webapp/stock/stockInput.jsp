<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#clName, #color, #clDetail {
		text-align: left;
	}
	
	#price, #salerate {
		text-align: right;
	}
</style>
<script type="text/javascript">
	function check() {
		
		if(document.getElementById("clName").value == "") {
			document.getElementById("clNameDiv").innerText="이름을 입력 해 주세요";
			document.getElementById("clName").focus();
		}else if(document.getElementById("category").value == "0") {
			document.getElementById("category").focus();
		}else if(document.getElementById("price").value == "") {
			document.getElementById("priceDiv").innerText="가격을 입력 해 주세요";
			document.getElementById("price").focus();
		}else if(document.getElementById("salerate").value == "") {
			document.getElementById("salerateDiv").innerText="할인율을 입력 해 주세요";
			document.getElementById("salerate").focus();
		}else if(document.getElementById("color").value == "") {
			document.getElementById("colorDiv").innerText="색깔을 입력 해 주세요";
			document.getElementById("color").focus();
		}else if(document.getElementById("enterCount").value == "") {
			document.getElementById("enterCountDiv").innerText="입고를 입력 해 주세요";
			document.getElementById("enterCount").focus();
		}else if(document.getElementById("clDetail").value == "") {
			document.getElementById("clDetailDiv").innerText="옷설명을 입력 해 주세요";
			document.getElementById("clDetail").focus();
		}else {
			document.getElementById("stockForm").submit();
		}
	}
</script>
</head>
<body>
	<form id="stockForm" name="stockForm" method="post" action="/radiant/stock/stockInput.do">
		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" id="clName" name="clName">
					<div id="clNameDiv"></div>
				</td>
			</tr>
			<tr>
				<td>종류</td>
				<td>
					<select id="category" name="category">
						<option value="0">선택해주세요</option>
						<option value="상의">상의</option>
						<option value="하의">하의</option>
						<option value="아우터">아우터</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input type="text" id="price" name="price">
					<div id="priceDiv"></div>
				</td>
			</tr>
			<tr>
				<td>할인율</td>
				<td>
					<input type="text" id="salerate" name="salerate" value="0">
					<div id="salerateDiv"></div>
				</td>
			</tr>
			<tr>
				<td>색깔</td>
				<td>
					<input type="text" id="color" name="color">
					<div id="colorDiv"></div>
				</td>
			</tr>
			<tr>
				<td>입고</td>
				<td>
					<input type="text" id="enterCount" name="enterCount">
					<div id="enterCountDiv"></div>
				</td>
			</tr>
			<tr>
				<td>옷설명</td>
				<td>
					<input type="text" id="clDetail" name="clDetail">
					<div id="clDetailDiv"></div>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="완료" onclick="check()"></td>
				<td><input type="reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>