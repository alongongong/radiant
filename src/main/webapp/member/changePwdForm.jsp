<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Radiant 로그인</title>
<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	color: #333;
	margin : 35px 70px;
	font-size : 12pt;
}
td {
	padding: 10px;
	width: 500px;
	height: 40px;
}
legend {
	font-size: 18pt;
}
#changeId, #currentPwd, #changePwd, #reChangePwd {
	border: 0;
	font-size: 10pt;
	border-bottom: 1px solid #999;
}
#changeId:focus, #currentPwd:focus, #changePwd:focus, #reChangePwd:focus {
	outline : none;
}
#currentPwdDiv, #changePwdDiv, #reChangePwdDiv {
	font-size: 8pt;
	font-weight: bold;
	color: brown;
}
#changePwdBtn {
	width: 335px;
	height: 40px;
	color: white; 
	background: #39210D;
}
</style>
</head>
<body>
<legend>아이디/비밀번호 찾기</legend>
<br><br>

	<form id="changePwdForm" name="changePwdForm" method="post" action="/radiant/member/changePwd.do">
		<table>
			<tr>
				<td>
					<input type="text" id="changeId" name="changeId" value="${id }" size="49" readonly>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="currentPwd" name="currentPwd" placeholder="현재 비밀번호" size="49">
					<div id="currentPwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="changePwd" name="changePwd" placeholder="새 비밀번호" size="49">
					<div id="changePwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 20px;">
					<input type="password" id="reChangePwd" name="reChangePwd" placeholder="새 비밀번호 확인" size="49">
					<div id="rechangePwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn" id="changePwdBtn" name="changePwdBtn" onclick="changePwdCheck()">비밀번호 변경</button>
				</td>
			</tr>
		</table>
	</form>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>	
</body>
</html>