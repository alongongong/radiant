<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20,30대 여성 대표쇼핑몰 레디언트</title>
<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
<style type="text/css">
#checkIdFail{
	color:#333;
	margin-left:55px;
	margin-top : 35px;
	font-size : 12pt;
}
input:focus{
	outline : none;
}
#checkIdFail{
	text-align : center;
}
#checkIdFailDiv{
	color: red; 
	font-size: 9pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form name="checkIdFailForm" method="get" action ="/radiant/member/checkId.do">
	<table id="checkIdFail" cellpadding="5">
			<tr align="center">
				<td>
					${param.id}는 이미 사용중인 아이디입니다.
				</td>
						
			</tr>
			
			
			<tr>
				<td>
					아이디  <input type="text" name="id" id="checkIdFail_id" size="30" style="border : none; border-bottom: 1px solid #999">
					<br>
					<div id="checkIdFailDiv"></div>
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<input type="button" value="중복체크" id="idFailBtn" class="btn" onclick="check_idFail()" style=" color: white; background: #39210D;font-size : 10pt; align : center;">
				</td>
			</tr>
	</table>	
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>	
</body>
</html>