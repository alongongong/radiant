<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Radiant 회원가입</title>
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


</style>
</head>
<body>
	${param.id }는 이미 사용중인 아이디입니다.
<form action ="/radiant/member/checkId.do">
	<table id="checkIdFail" cellpadding="5">
			<tr align="center">
				<td>
				
				</td>		
			</tr>
			
			
			<tr>
				<td>
					아이디  <input type="text" name="id" id="id" size="30" style="border : none; border-bottom: 1px solid #999">
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<input type="submit" value="중복체크" class="btn" style=" color: white; background: #39210D;font-size : 10pt; align : center;">
				</td>
			</tr>
	</table>	
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>	
</body>
</html>