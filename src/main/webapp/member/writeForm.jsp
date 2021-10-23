<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/radiant/css/radiant_Main.css">
<script type="text/javascript" src="/radiant/js/member.js"></script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	background-color: white;
}
#writeBody{
	color:#999;
	margin-left:30px;
	margin-top : 40px;
	font-size : 9pt;
}
#writeOkBtn, #wrtieCancleBtn{
	margin-top : 30px;	
	width : 150px;
	height : 40px;
}
#writeIdCheckBtn{
	height : 30px;
	width : 83px;
}
#writeNameDiv, #writeIdDiv, #writePwdDiv, #writeRepwdDiv, #writePhoneDiv, #writeEmailDiv {
	color: red; 
	font-size: 9pt;
	font-weight: bold;
}
#writeTableBody{
	border: 1px solid #999;
}

#writeTableBody td:first-child {
	padding-left: 80px;
}

#writeTable{
	width : 50%;
	height:50%;
}
/*입력창 테두리 포커스 없애기*/
input:focus{
	outline : none;
}
</style>
</head>
<body id="writeForm">
    <div id="wrap">
        <div id="header">
            
            <div id="logo">
                <a href="/radiant/main/index.do"><img src="/radiant/img/logo.png" alt="logo"></a>
            </div><!--logo-->
            <div id="icon">
                <a href="/radiant/main/index.do"><img src="/radiant/img/icon.png" alt="icon"></a>
            </div>

            <div id="headNav">
                <ul>
                	<%-- <c:if test="${sessionScope.memId == null}"> --%>
                    	<li><a href="/radiant/member/loginForm.do">로그인</a></li>
                    	<li><a href="/radiant/member/write_agree.do">회원가입</a></li>
                   <%--  </c:if> --%>
                    <c:if test="${sessionScope.memId != null }">
                    	<li>${sessionScope.memName }님 로그인</li>
                    	<li><a href="/radiant/member/logout.do">로그아웃</a></li>
                    </c:if>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="/radiant/board/qnaList.do?pg=1">고객센터</a></li>
                </ul>
            </div><!--headNav-->
        </div><!--header-->
        <div id="mainNav">
            <ul>
                <li>
                    <div id="menu">
                        <a href="#">
                            <img src="/radiant/img/menu.png" alt="menu">
                        </a>
                    </div>
                </li>
                <li><a href="#">오늘의 할인</a></li>
                <li><a href="#">베스트아이템</a></li>
                <li><a href="#">가을신상15%</a></li>
            </ul>
            <ul>
                <li>
                    <a href="#">원피스</a>
                    <ul class="dropDownMenu">
                        <li><a href="#">이거</a></li>
                        <li><a href="#">하나만</a></li>
                        <li><a href="#">샘플로</a></li>
                        <li><a href="#">해봤어요</a></li>
                    </ul>
                </li>
                <li><a href="#">블라우스</a></li>
                <li><a href="#">아우터</a></li>
                <li><a href="#">니트/티셔츠</a></li>
                <li><a href="#">스커트</a></li>
                <li><a href="#">팬츠</a></li>
                <li><a href="#">주얼리</a></li>
                <li><a href="#">액세서리</a></li>
                <li><a href="#">아슈즈우터</a></li>
                <li><a href="#">가방</a></li>
                <li><a href="#">언더웨어</a></li>
                <li><a href="#">테마룩</a></li>
            </ul>
            <ul>
                <li><a href="#">전체상품보기</a></li>
            </ul>
        </div><!--mainNav-->
        <hr id="mainNavAfter">

        <div id="section">
            <div id="subNav">
     <br><br>           
	<form name="writeForm" method="post" action="http://localhost:8080/radiant/member/write.do">
		<table id="writeTable" align="center" cellpadding="15">
		<thead>
			<tr style="color:#333; font-size:20pt;">
				<td colspan="2" align="center">회원가입</td>	
			</tr>
			<tr>
			<td colspan="2" align="center">
				<img src="../img/write_step2.PNG" width="500"  alt="회원가입_스탭2"/>
			</td>
			</tr>
		</thead>	
		
		<tbody id="writeTableBody">
		
			<tr>
				<td>&emsp;</td>
			</tr>
			<!-- 이름  -->
			<tr>
				<td>이름 <font color="red">*</font></td>
				<td>
					<input type="text" name="writeName" size="30" style="border : none; border-bottom: 1px solid #999">
					<div id="writeNameDiv"></div>
				</td>
			</tr>
			
			<!-- 아이디  -->
			<tr>
				<td align="left">아이디 <font color="red">*</font></td>
				
				<td>
					<input type="text" name="writeId" id="writeId" size="30" onkeydown="inputIdChk()" style="border : none; border-bottom: 1px solid #999;">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn" id="writeIdCheckBtn" onclick="checkId()" style=" color: black; background: white; border: 0.1px solid #999;font-size : 8pt;">중복확인</button>
					<div id="writeIdDiv"></div>
					<input type="hidden" id="writeIdDuplication" name="writeIdDuplication" value="idUncheck">
				</td> 
			</tr>
			
			<!-- 비밀번호  -->
			<tr>
				<td align="left">비밀번호 <font color="red">*</font></td>
				<td>
					<input type="password" name="writePwd" size="30" style="border : none; border-bottom: 1px solid #999">
					<div id="writePwdDiv"></div>
				</td>
			</tr>
			
			<!-- 비밀번호 확인  -->
			<tr>
				<td align="left">비밀번호 확인 <font color="red">*</font></td>
				<td>
					<input type="password" name="writeRepwd" size="30" style="border : none; border-bottom: 1px solid #999">
					<div id="writeRepwdDiv"></div>
				</td>
			</tr>
			
			<!-- 휴대폰번호  -->
			<tr>
				<td align="left">휴대폰 번호 <font color="red">*</font></td>
				<td>
					<select name="writeTel1" id="writeTel1"  onkeydown="inputPhoneChk()" style="width: 70px; height : 23px; border : none; border-bottom: 1px solid #999;">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="011">019</option>
					</select>
					<input type="text" name="writeTel2" id="writeTel2" size="7" maxlength="4" onkeydown="inputPhoneChk()" style="border : none; border-bottom: 1px solid #999">
					<input type="text" name="writeTel3" id="writeTel3" size="7" maxlength="4" onkeydown="inputPhoneChk()" style="border : none; border-bottom: 1px solid #999">&nbsp;&nbsp;&nbsp;&nbsp;
 					<button type="button" class="btn" id="writePhoneBtn" onclick="checkPhone()" style=" color: black; background: white; border: 1px solid #999;font-size : 8pt;">휴대폰 중복체크</button> 
					<div id="writePhoneDiv"></div>
					<input type="hidden" id="writePhoneDuplication" name="writePhoneDuplication" value="phoneUnCheck">
				</td>
			</tr>
			
			<!-- 생년월일  -->
			<tr>
				<td align="left">생년월일 <font color="red">*</font></td>
				<td>
					<select name="yy" style="width: 80px; border : none; border-bottom: 1px solid #999;">
						 <c:forEach var="yy" begin="1950" end="2021" step="1">
							<option value="${yy}">${yy}</option>
						</c:forEach> 
					</select>
			
					<select name="mm" style="width: 80px; border : none; border-bottom: 1px solid #999;">
						 <c:forEach var="mm" begin="1" end="12" step="1">
							<option value="${mm}">${mm}</option>
						</c:forEach> 
					</select>
					
					<select name="dd" style="width: 80px; border : none; border-bottom: 1px solid #999;">
						 <c:forEach var="dd" begin="1" end="31" step="1">
							<option value="${dd}">${dd}</option>
						</c:forEach> 
					</select>
				</td>
				
			</tr>
			
			<!-- 이메일  -->
			<tr>
				<td align="left">이메일 <font color="red">*</font></td>
				<td>
					<input type="text" name="writeEmail1" size="20" style="border : none; border-bottom: 1px solid #999"> 
					@
					<input type="text" name="writeEmail2" size="20" style="border : none; border-bottom: 1px solid #999">
					<div id="writeEmailDiv"></div>
				</td>
			</tr>
			
			<!-- 메일수신여부  -->
			<tr>
				<td align="left">메일수신여부 <font color="red">*</font></td>
				<td>
					<input type="radio" name="writeemailtf" checked/>
					<label for="yes">예</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="writeemailtf">
					<label for="no">아니오</label>
				</td>
			</tr>
			
			<!-- 추천인아이디  -->
			<tr>
				<td align="left">추천인아이디</td>
				<td>
					<input type="text" name="writeRecommenderid" size="30" style="border : none; border-bottom: 1px solid #999">
				</td>
			</tr>
			
			<tr>
				<td>&emsp;</td>
			</tr>
			
			</tbody>
			
			
			<!-- button  -->
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn" id="writeOkBtn" onclick="checkWrite()" style=" color: white; background: #39210D;font-size : 13pt;">회원가입</button>
					<input type="reset" class="btn" value="취  소" id="wrtieCancleBtn" style=" color: white; background: #39210D;font-size : 13pt;" >
				</td>
			</tr>
			
			<tr>
				<td>&emsp;</td>
			</tr>
		</table>
	</form>
	   </div><!--subNav-->
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
    </div><!--wrap-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>
</body>
</html>