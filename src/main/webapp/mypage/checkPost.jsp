<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	width: 100px;
	font-size: 9pt;
}
input {
	font-size: 9pt;
}
</style>
</head>
<body>
<form name="postForm" id="checkPostForm">
	<table border="1" cellspacing="0" cellpadding="7">
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
				<input type="submit" id="checkPostSearchBtn" value="검색">
			</td>
		</tr>
		<tr>
			<td align="center">우편번호</td>
			<td colspan="3" align="center">주소</td>
		</tr>
		<c:if test="${requestScope.list != null}">
			<c:forEach var="zipcodeDTO" items="${requestScope.list }">
				<c:set var="address">
					${zipcodeDTO.sido 
					} ${zipcodeDTO.sigungu 
					} ${zipcodeDTO.yubmyundong 
					} ${zipcodeDTO.ri 
					} ${zipcodeDTO.roadname 
					} ${zipcodeDTO.buildingname }
				</c:set>
				<tr>
					<td align="center">${zipcodeDTO.zipcode }</td>
					<td colspan="3">
						<%-- <a href="#" class="addressA" onclick="checkPostClose('${zipcodeDTO.zipcode}','${address }')">${address }</a> --%>
						
						<a href="#" class="addressA">${address }</a>
						<%-- 값이 여러개라서 id속성을 쓰면 하나 눌렀을 때 모든 항목에 연결됨.
							class속성을 이용하면 각각의 태그가 따로 먹힘. --%>
						<input type="hidden" id="zipcode" value="${zipcodeDTO.zipcode }">
						<input type="hidden" id="address" value="${address }">
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/radiant/js/mypage.js"></script>
</body>
</html>