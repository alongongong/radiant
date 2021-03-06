<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Radiant 레디언트</title>
<style type="text/css">
#checkPostForm > table {
	border: 1px solid #999;
	border-collapse: collapse;
}
#checkPostForm td {
	width: 100px;
	font-size: 10pt;
	border: 1px solid #999;
	padding: 7px;
}
#checkPostForm input {
	font-size: 10pt;
}
#checkPostForm #addrEmptyTd {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
<form name="postForm" id="checkPostForm">
	<table>
		<tr>
			<td align="center">시도</td>
			<td>
				<select name="sido" id="sido">
					<option>시도선택</option>
					<option value="서울">서울</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="광주">광주</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select>
			</td>
			<td align="center">시.군.구</td>
			<td align="center"><input type="text" name="sigungu" id="sigungu"></td>
		</tr>
		<tr>
			<td align="center">도로명</td>
			<td colspan="3">
				<input type="text" name="roadname" size="40" id="roadname">
				<input type="button" id="checkPostSearchBtn" value="검색">
			</td>
		</tr>
		<tr>
			<td align="center">우편번호</td>
			<td colspan="3" align="center">주소</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/radiant/js/mypage.js"></script>
</body>
</html>