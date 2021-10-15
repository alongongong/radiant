<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
<style type="text/css">
#checkIdOk{
	color:#333;
	margin-left:55px;
	margin-top : 35px;
	font-size : 12pt;
}


</style>
</head>
<body>
<table id="checkIdOk" cellpadding="15">
		<tr align="center">
			<td style="border-bottom:1px solid #999;">
				<strong id="useid">${param.id }</strong>는 사용 가능한 아이디 입니다.
			</td>
		</tr>
		
		<tr align="center">
			<td>
				<input type="button" value="사용하기" class="btn" id="checkUserId" name="checkUserId" onclick="closeIdCheck()" style=" color: white; background: #39210D;font-size : 10pt; align : center;">
			</td>
		</tr>
</table>		


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>
</body>
</html>