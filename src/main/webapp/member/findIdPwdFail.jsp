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
	color:#333;
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
#findIdTable {
	display:none;
}
#findPwdTable {
	display: none;
}
#findIdName, #findIdTel1, #findIdTel2, #findIdTel3 {
	border: 0;
	font-size: 10pt;
	border-bottom: 1px solid #999;
}
#findIdName:focus, #findIdTel1:focus, #findIdTel2:focus, #findIdTel3:focus {
	outline : none;
}
#findIdTel1 {
	width: 82px;
}
#findIdNameDiv, #findIdTelDiv, #findIdFailDiv {
	font-size: 8pt;
	font-weight: bold;
	color: brown;
}
#findIdBtn {
	width: 335px;
	height: 40px;
	color: white; 
	background: #39210D;
}
#findPwdId, #findPwdName, #findPwdTel1, #findPwdTel2, #findPwdTel3 {
	border: 0;
	font-size: 10pt;
	border-bottom: 1px solid #999;
}
#findPwdId:focus, #findPwdName:focus, #findPwdTel1:focus, #findPwdTel2:focus, #findPwdTel3:focus {
	outline : none;
}
#findPwdTel1 {
	width: 82px;
}
#findPwdIdDiv, #findPwdNameDiv, #findPwdTelDiv, #findPwdFailDiv {
	font-size: 8pt;
	font-weight: bold;
	color: brown;
}
#findPwdBtn {
	width: 335px;
	height: 40px;
	color: white; 
	background: #39210D;
}


</style>
</head>
<c:if test="${findId == 'aa' }">
<body onload="idFindFail()">
</c:if> <!-- Id 찾기 실패할 때 -->

<c:if test="${findId == null }">
<body onload="idFind()">
</c:if> <!-- Id 찾기-->
 
<c:if test="${findPwd == 'aa' }">
<body onload="pwdFindFail()">
</c:if> <!-- Pwd 찾기 실패할 때 -->

<c:if test="${findPwd == null }">
<body onload="pwdFind()">
</c:if> <!-- Pwd 찾기-->

<legend>아이디/비밀번호 찾기</legend>
<br><br>

<!-- <script type="text/javascript">
window.onload=function(){
	alert("일치하는 정보가 없습니다.");
	history.back();
	/* location.href="/radiant/member/findIdPwdForm.do"; */
}
</script> -->

<div>
	<input type="radio" name="findId" id="findId" onclick="idFind()">
	<label for="findId">아이디 찾기</label> &emsp;
	<input type="radio" name="findId" id="findPwd" onclick="pwdFind()">
	<label for="findPwd">비밀번호 찾기</label>
</div>

<div id="findTable"></div>	<!-- 테이블이 들어갈 위치 -->


<div id="findIdTable"><!-- 아이디찾기 테이블 --> 
	<form id="findIdForm" name="findIdForm"  method="post" action="/radiant/member/findId.do">
		<table>
			<tr>
				<td>
					<input type="text" id="findIdName" name="findIdName" placeholder="이름" size="49">
					<div id="findIdNameDiv"></div>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 20px;">
					<select id="findIdTel1" name="findIdTel1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</select> &emsp;
					<input type="text" id="findIdTel2" name="findIdTel2" size="11"> &emsp;
					<input type="text" id="findIdTel3" name="findIdTel3" size="11">
					<div id="findIdTelDiv"></div>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn" id="findIdBtn" name="findIdBtn" onclick="findIdCheck()">아이디 찾기</button>
					<div id="findIdFailDiv">일치하는 정보가 없습니다.</div>	
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="findPwdTable"><!-- 비밀번호찾기 테이블 -->
	<form id="findPwdForm" name="findPwdForm"  method="post" action="/radiant/member/findPwd.do">
		<table>
			<tr>
				<td>
					<input type="text" id="findPwdId" name="findPwdId" placeholder="아이디" size="49">
					<div id="findPwdIdDiv"></div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="findPwdName" name="findPwdName" placeholder="이름" size="49">
					<div id="findPwdNameDiv"></div>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 20px;">
					<select id="findPwdTel1" name="findPwdTel1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</select> &emsp;
					<input type="text" id="findPwdTel2" name="findPwdTel2" size="11"> &emsp;
					<input type="text" id="findPwdTel3" name="findPwdTel3" size="11">
					<div id="findPwdTelDiv"></div>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn" id="findPwdBtn" name="findPwdBtn" onclick="findPwdCheck()">비밀번호 찾기</button>	
					<div id="findPwdFailDiv">일치하는 정보가 없습니다.</div>
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>	
</body>
</html>