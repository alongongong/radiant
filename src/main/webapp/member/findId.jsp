<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Radiant 로그인</title>
<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
<style type="text/css">
#findIdSucForm{
	color:#333;
	margin : 35px 70px;
	font-size : 12pt;
}
#findIdSucForm td {
	padding: 10px;
	width: 500px;
	height: 40px;
}
#findIdSucForm legend {
	font-size: 18pt;
}
#findIdBtn {
	width: 335px;
	height: 40px;
	color: white; 
	background: #39210D;


</style>
</head>
<body>
<form id="findIdSucForm" name="findIdSucForm" action="/radiant/member/findId.do">
	<legend>아이디/비밀번호 찾기</legend>
	<br><br>
 
	<table>
		<tr>
			<td>조회된 아이디</td>
		</tr>
		<tr>
			<td>
				<a href="" onclick="loginReturnId()">${requestScope.id }</a>
			</td>
		</tr>
		<tr>
			<td>&emsp;</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn" id="findIdBtn" name="findIdBtn" onclick="location.href='/radiant/member/findIdPwdForm.do?pwd=1'">비밀번호 찾기</button>	
			</td>
		</tr>
	</table>
	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>	
</body>
</html>