<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Radiant 레디언트</title>
    
	<!-- 메인 -->    
    <link rel="stylesheet" href="/radiant/css/radiant_Main.css">
    
    <link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/radiant/js/member.js"></script>
</head>
<body>
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
                    	<li><a href="/radiant/member/updateForm.do">정보수정</a></li>
                    </c:if>
                    <li><a href="/radiant/mypage/mypage.do">마이페이지</a></li>
                    <li><a href="/radiant/board/qnaList.do?pg=1">고객센터</a></li>
                    <c:if test="${sessionScope.memId == '관리자' }">
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
                <li><a href="/radiant/mainNav/allProduct.do">오늘의 할인</a></li>
                <li><a href="/radiant/mainNav/allProduct.do">베스트아이템</a></li>
                <li><a href="/radiant/mainNav/allProduct.do">가을신상15%</a></li>
            </ul>
            <ul>
                <li><a href="/radiant/mainNav/top.do" >원피스</a>
                	<ul class="dropDownMenu">
                		<li><a href="/radiant/mainNav/top.do">니트</a></li>
                		<li><a href="/radiant/mainNav/top.do">플레어</a></li>
                		<li><a href="/radiant/mainNav/top.do">머메이드</a></li>
                		<li><a href="/radiant/mainNav/top.do">롱</a></li>
                	</ul>
                </li>
                <li class="dropHidden"><a href="/radiant/mainNav/top.do">블라우스</a></li>
                <li>
                	<a href="/radiant/mainNav/outer.do">아우터</a>
                	<ul class="dropDownMenu">
                        <li><a href="/radiant/mainNav/outer.do">가디건</a></li>
                        <li><a href="/radiant/mainNav/outer.do">자켓</a></li>
                        <li><a href="/radiant/mainNav/outer.do">코트</a></li>
                        <li><a href="/radiant/mainNav/outer.do">니트</a></li>
                    </ul>
                </li>
                <li><a href="/radiant/mainNav/top.do">니트/티셔츠</a>
                	<ul class="dropDownMenu">
                		<li><a href="/radiant/mainNav/top.do">니트</a></li>
                		<li><a href="/radiant/mainNav/top.do">티셔츠</a></li>
                	</ul>
                </li>
                <li><a href="/mainNav/pants.do">스커트</a>
                	<ul class="dropDownMenu">
                		<li><a href="/radiant/mainNav/pants.do">데님</a></li>
                		<li><a href="/radiant/mainNav/pants.do">니트</a></li>
                		<li><a href="/radiant/mainNav/pants.do">플리츠</a></li>
                		<li><a href="/radiant/mainNav/pants.do">롱</a></li>
                	</ul>
                </li>
                <li><a href="/radiant/mainNav/pants.do">팬츠</a>
                	<ul class="dropDownMenu">
                		<li><a href="/radiant/mainNav/pants.do">반바지</a></li>
                		<li><a href="/radiant/mainNav/pants.do">슬랙스</a></li>
                		<li><a href="/radiant/mainNav/pants.do">스키니</a></li>
                		<li><a href="/radiant/mainNav/pants.do">레깅스</a></li>
                		<li><a href="/radiant/mainNav/pants.do">니트</a>
                	</ul>
                </li>
            </ul>
            <ul>
                <li><a href="/radiant/mainNav/allProduct.do">전체상품보기</a></li>
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
	                <li><a href="/radiant/mainNav/top.do">원피스</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="/radiant/mainNav/top.do">니트</a></li>
	                		<li><a href="/radiant/mainNav/top.do">플레어</a></li>
	                		<li><a href="/radiant/mainNav/top.do">머메이드</a></li>
	                		<li><a href="/radiant/mainNav/top.do">롱</a></li>
	                	</ul>
	                </li>
	                <li><a href="/radiant/mainNav/top.do">블라우스</a></li>
	                <li>
	                	<a href="/radiant/mainNav/outer.do">아우터</a>
	                	<ul class="dropDownMenu1">
	                        <li><a href="/radiant/mainNav/outer.do">가디건</a></li>
	                        <li><a href="/radiant/mainNav/outer.do">자켓</a></li>
	                        <li><a href="/radiant/mainNav/outer.do">코트</a></li>
	                        <li><a href="/radiant/mainNav/outer.do">니트</a></li>
	                    </ul>
	                </li>
	                <li><a href="/radiant/mainNav/top.do">니트/티셔츠</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="/radiant/mainNav/top.do">니트</a></li>
	                		<li><a href="/radiant/mainNav/top.do">티셔츠</a></li>
	                	</ul>
	                </li>
	                <li><a href="/radiant/mainNav/pants.do">스커트</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="/radiant/mainNav/pants.do">데님</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">니트</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">플리츠</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">롱</a></li>
	                	</ul>
	                </li>
	                <li><a href="/radiant/mainNav/pants.do">팬츠</a>
	                	<ul class="dropDownMenu1">
	                		<li><a href="/radiant/mainNav/pants.do">반바지</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">슬랙스</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">스키니</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">레깅스</a></li>
	                		<li><a href="/radiant/mainNav/pants.do">니트</a>
	                	</ul>
	                </li>
	            </ul>
	            <ul class="hiddenMenu">
	                <li><a href="/radiant/mainNav/allProduct.do">전체상품보기</a></li>
	            </ul>
	        </div>
        </div><!--mainNav-->
        	  	
        <div id="section">
        
              <table>
	        	<c:forEach var="i" begin="0" end="${list.size() -1 }" step="1">
       				<c:if test="${i%4==0 }">
       					<tr>
       						<td>
					       		<a class="modal_show" href="/radiant/stock/stockMainForm.do"><img src="/radiant/img/clothes/${list[i] }" alt="${list[i] }" class="img"></a>
		       					<p>${stockList[i].clName }</p>
		       					<p>${stockList[i].price }</p>
		       				</td>
       				</c:if>
       				<c:if test="${i%4 ==3 }">
		       				<td>
					       		<a class="modal_show" href="/radiant/stock/stockMainForm.do"><img src="/radiant/img/clothes/${list[i] }" alt="${list[i] }" class="img"></a>
		       					<p>${stockList[i].clName }</p>
		       					<p>${stockList[i].price }</p>
		       				</td>
       					</tr>
					</c:if>
					<c:if test="${i%4 !=0 && i%4 !=3 }">
	       				<td>
				       		<a class="modal_show" href="/radiant/stock/stockMainForm.do"><img src="/radiant/img/clothes/${list[i] }" alt="${list[i] }" class="img"></a>
	       					<p>${stockList[i].clName }</p>
		       				<p>${stockList[i].price }</p>
	       				</td>
					</c:if>
					<c:if test="${i == list.size() -1 }">
						</tr>
					</c:if>
	        	</c:forEach>
        	</table>
        	
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