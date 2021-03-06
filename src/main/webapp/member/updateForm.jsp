<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Radiant 회원정보수정</title>
<style type="text/css">
#updateForm {
	margin: 15% 25%;
}
#updateForm table {
	margin: 0 auto;
	font-size: 10pt;
}
#updateForm td {
	padding: 15px 10px;
	height: 40px;
}
#updateForm legend {
	font-size: 18pt;
	padding-left: 60px;
}
#updateTel1, #updateTel2, #updateTel3, #updateEmail1, #updateEmail2, #updateEmailTF, #updateYy, #updateMm, #updateDd {
	border: 0;
	font-size: 10pt;
	border-bottom: 1px solid #999;
}
#updateName, #updateId {
	border: 0;
	font-size: 10pt;
}
#updateName:focus, #updateId:focus, #updateTel1:focus, #updateTel2:focus, #updateTel3:focus, #updateEmail1:focus, #updateEmail2:focus, #updateEmailTF:focus, #updateYy:focus, #updateMm:focus, #updateDd:focus {
	outline: 0;
}
#updateTel1, #updateYy, #updateMm, #updateDd {
	width: 80px;
}
#updateYy, #updateMm, #updateDd {
	background: #eee;
	border-bottom: 0;
}
#updateEmailT, #updateEmailF {
	font-size: 10pt;
	color: #999;
}
#birthDiv {
	margin-top: -20px;
	padding-bottom: 20px;
	padding-left: 10px;
	font-size: 10pt;
	font-weight: bold;
	color: #555;
}
#updateBtn {
	width: 150px;
	height: 40px;
	color: white; 
	background: #39210D;
}
#updateResetBtn {
	width: 150px;
	height: 40px;
	color: white; 
	background: #39210D;
}

</style>
    
	<!-- 메인 -->
    <link rel="stylesheet" href="/radiant/css/radiant_Main.css">
    
    <link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/radiant/js/member.js"></script>
    <script type="text/javascript">
    function updateOnload() {
    	document.updateForm.updateName.value = '${memberDTO.name}';
    	document.updateForm.updateId.value = '${memberDTO.id}';
    	document.updateForm.updateTel1.value = '${memberDTO.tel1}';
    	document.updateForm.updateTel2.value = '${memberDTO.tel2}';
    	document.updateForm.updateTel3.value = '${memberDTO.tel3}';
    	document.updateForm.updateEmail1.value = '${memberDTO.email1}';
    	document.updateForm.updateEmail2.value = '${memberDTO.email2}';
    	document.updateForm.updateEmailTF.value = '${memberDTO.emailTF}';
    	document.updateForm.updateYy.value = '${memberDTO.yy}';
    	document.updateForm.updateMm.value = '${memberDTO.mm}';
    	document.updateForm.updateDd.value = '${memberDTO.dd}';
    }
    function updateChange() {
    	document.getElementById("updateBtn").disabled = false; 
    }
    </script>
</head>
<body onload="updateOnload()">
    <div id="wrap">
        <div id="header">
            
            <div id="logo">
                <a href="/radiant/main/index.do"><img src="/radiant/img/logo.png" alt="logo"></a>
            </div><!--logo-->
            <div id="icon">
                <a href="/radiant/main/index.do"><img src="/radiant/img/icon.png" alt="icon"></a>
            </div><!-- icon -->

            <div id="headNav"><!-- 로그인, 회원가입, 로그아웃, 고객센터 -->
                <ul>
                	<c:if test="${sessionScope.memId == null}">
                    	<li><a href="/radiant/member/loginForm.do">로그인</a></li>
                    	<li><a href="/radiant/member/write_agree.do">회원가입</a></li>
                    </c:if>
                    <c:if test="${sessionScope.memId != null }">
                    	<li>${sessionScope.memName }님 로그인</li>
                    	<li><a href="/radiant/member/logout.do">로그아웃</a></li>
                    	<li><a href="#">마이페이지</a></li>
                    </c:if>
                    <li><a href="/radiant/board/qnaList.do?pg=1">고객센터</a></li>
                    <c:if test="${sessionScope.memId == 'admin' }">
                    	<li><a href="/radiant/stock/stockPrint.do">재고관리</a></li>
                    </c:if>
                </ul>
            </div><!--headNav-->
        </div><!--header-->
        <div id="mainNav"><!-- 메인 고정 메뉴 -->
            <ul>
                <li>
                    <div id="menu">
                        <a href="#" id="allMenuBtn">
                            <img src="/radiant/img/menu.png" alt="menu" id="menuImage">
                            <input type="hidden" id="allMenuValue" value="hidden">
                        </a>
                    </div>
                </li>
                <li><a href="#">오늘의 할인</a></li>
                <li><a href="#">베스트아이템</a></li>
                <li><a href="#">가을신상15%</a></li>
            </ul>
            <ul>
                <li><a href="#" >원피스</a>
                	<ul class="dropDownMenu">
                		<li><a href="">니트</a></li>
                		<li><a href="">플레어</a></li>
                		<li><a href="">머메이드</a></li>
                		<li><a href="">롱</a></li>
                	</ul>
                </li>
                <li class="dropHidden"><a href="#">블라우스</a></li>
                <li>
                	<a href="/radiant/mainNav/outer.do">아우터</a>
                	<ul class="dropDownMenu">
                        <li><a href="#">가디건</a></li>
                        <li><a href="#">자켓</a></li>
                        <li><a href="#">코트</a></li>
                        <li><a href="#">니트</a></li>
                    </ul>
                </li>
                <li><a href="#">니트/티셔츠</a>
                	<ul class="dropDownMenu">
                		<li><a href="">니트</a></li>
                		<li><a href="">티셔츠</a></li>
                	</ul>
                </li>
                <li><a href="#">스커트</a>
                	<ul class="dropDownMenu">
                		<li><a href="">데님</a></li>
                		<li><a href="">니트</a></li>
                		<li><a href="">플리츠</a></li>
                		<li><a href="">롱</a></li>
                	</ul>
                </li>
                <li><a href="#">팬츠</a>
                	<ul class="dropDownMenu">
                		<li><a href="">반바지</a></li>
                		<li><a href="">슬랙스</a></li>
                		<li><a href="">스키니</a></li>
                		<li><a href="">레깅스</a></li>
                		<li><a href="">니트</a>
                	</ul>
                </li>
            </ul>
            <ul>
                <li><a href="#">전체상품보기</a></li>
            </ul>
            
	        <hr id="mainNavAfter">
	        
	        <div id="allMenu">
	        	 <ul class="hiddenMenu">
	                <li>
	                    <div id="menuClose">
	                        <a href="#" id="MenuCloseBtn">
	                            <img src="/radiant/img/menu.png" alt="menu">
	                        </a>
	                    </div>
	                </li>
	                <li><a href="#">오늘의 할인</a></li>
	                <li><a href="#">베스트아이템</a></li>
	                <li><a href="#">가을신상15%</a></li>
	            </ul>
	            <ul id="visibleMenu">
	                <li><a href="#">원피스</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="">니트</a></li>
	                		<li><a href="">플레어</a></li>
	                		<li><a href="">머메이드</a></li>
	                		<li><a href="">롱</a></li>
	                	</ul>
	                </li>
	                <li><a href="#">블라우스</a></li>
	                <li>
	                	<a href="/radiant/mainNav/outer.do">아우터</a>
	                	<ul class="dropDownMenu1">
	                        <li><a href="#">가디건</a></li>
	                        <li><a href="#">자켓</a></li>
	                        <li><a href="#">코트</a></li>
	                        <li><a href="#">니트</a></li>
	                    </ul>
	                </li>
	                <li><a href="#">니트/티셔츠</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="">니트</a></li>
	                		<li><a href="">티셔츠</a></li>
	                	</ul>
	                </li>
	                <li><a href="#">스커트</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="">데님</a></li>
	                		<li><a href="">니트</a></li>
	                		<li><a href="">플리츠</a></li>
	                		<li><a href="">롱</a></li>
	                	</ul>
	                </li>
	                <li><a href="#">팬츠</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="">반바지</a></li>
	                		<li><a href="">슬랙스</a></li>
	                		<li><a href="">스키니</a></li>
	                		<li><a href="">레깅스</a></li>
	                		<li><a href="">니트</a>
	                	</ul>
	                </li>
	            </ul>
	            <ul class="hiddenMenu">
	                <li><a href="#">전체상품보기</a></li>
	            </ul>
	        </div>
        </div><!--mainNav-->
	  	
        <div id="section">
        	<form name="updateForm" id="updateForm" method="post" onchange="updateChange()" action="/radiant/member/update.do">
        		<legend>회원 정보 수정</legend>
        		<br>
        		<table>
        			<tr>
        				<td width="180px">이름</td>
        				<td>
        					<input type="text" id="updateName" name="updateName" readonly>
        				</td>
        			</tr>
        			<tr>
        				<td>아이디</td>
        				<td>
        					<input type="text" id="updateId" name="updateId" readonly>
        				</td>
        			</tr>
        			<tr>
        				<td>휴대폰 번호</td>
        				<td>
        					<select id="updateTel1" name="updateTel1">
        						<option value="010">010</option>
        						<option value="011">011</option>
        						<option value="019">019</option>
        					</select>&emsp;
        					<input type="text" id="updateTel2" name="updateTel2" size="13">&emsp;
        					<input type="text" id="updateTel3" name="updateTel3" size="13">
        				</td>
        			</tr>
        			<tr>
        				<td>이메일</td>
        				<td>
        					<input type="text" id="updateEmail1" name="updateEmail1" size="21">@
        					<input type="text" id="updateEmail2" name="updateEmail2" size="21">
        				</td>
        			</tr>
        			<tr>
        				<td>메일수신여부</td>
        				<td>
        					<input type="radio" id="updateEmailT" name="updateEmailTF" value="yes" checked>
        					<label for="updateEmailT">예</label>&emsp;&emsp;
        					<input type="radio" id="updateEmailF" name="updateEmailTF" value="no">
        					<label for="updateEmailF">아니오</label>
        				</td>
        			</tr>
        			<tr>
        				<td>생년월일</td>
        				<td>
        					<select name="updateYy" id="updateYy" disabled>
        						<c:forEach var="yy" begin="1950" end="2021" step="1">
        							<option value="${yy }">${yy }</option>
        						</c:forEach>
        					</select> 년&emsp;
        					<select name="updateMm" id="updateMm" disabled>
        						<c:forEach var="mm" begin="1" end="12" step="1">
        							<option value="${mm }">${mm }</option>
        						</c:forEach>
        					</select> 월&emsp;
        					<select name="updateDd" id="updateDd" disabled>
        						<c:forEach var="dd" begin="1" end="31" step="1">
        							<option value="${dd }">${dd }</option>
        						</c:forEach>
        					</select> 일 
        				</td>
        			</tr>
        			<tr>
        				<td></td>
        				<td>
							<div id="birthDiv">생년월일은 변경이 불가능합니다.</div>
						</td>
        			</tr>
        			<tr>
        				<td colspan="2" align="center">
        					<input type="submit" class="btn" id="updateBtn" value="정보 수정" disabled>
        					<input type="button" class="btn" id="updateResetBtn" value="취소" onclick='location.href="/radiant/member/updateForm.do"'>
        				</td>
        			</tr>
        		</table>
        	</form>
        </div><!--section-->
        
        <hr>
        <div id="footer">
            <div id="footerLeft">
                <p>
                    CUSTOMER CENTER<br>
                    02-1644-3225<br>
                    <br>
                    월~금 : am 11 ~ pm 5&emsp;점심시간 : pm 12 ~ 1<br>
                    (토/일/공휴일은 휴무)<br>
                </p>
            </div><!--footerLeft-->
            <div id="footerRight">
                <p>
                    교환/반품주소지(cj택배이용시) :<br>
                    서울특별시 강남구 강남대로94길 20 삼오빌딩 5-9층<br>
                    교환/반품주소지(타택배이용시) :<br>
                    서울특별시 강남구 강남대로94길 20 삼오빌딩 5-9층<br>
                </p>
            </div><!--footerRight-->
            <div id="footerBottom">
                <ul>
                    <li><a href="#">이용안내</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">파트너쉽</a></li>
                    <li><a href="#">멤버쉽</a></li>
                    <li><a href="#">리크루트</a></li>
                </ul>
                <p>
                    대표 : *** 전화 : 1644-3225 팩스 : 02)2231-4995 주소 : 서울특별시 구로구 구로동 237-14 아뜨랑스<br>
                    통신판매업 신고 : 2015-서울구로-1525 사업자등록번호 : 215-87-38531 [사업자정보확인] 개인정보보호책임자 : 정기열, 윤시영 (attrangs@naver.com)<br>
                </p>
            </div>
        </div><!--footer-->
        
        <div id="top"><a href="#"><input type="button" value="top"/></a></div>
        <div id="bottom"><a href="#footer"><input type="button" value="bottom"/></a></div>
    </div><!--wrap-->
    
</body>
</html>