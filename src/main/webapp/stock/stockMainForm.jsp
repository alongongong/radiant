<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, height=device-height, 
                   minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
    <title>Radiant 레디언트</title>
    
	<!-- 메인 -->    
    <link rel="stylesheet" href="/radiant/css/radiant_Main.css">
    <link rel="stylesheet" href="/radiant/css/stock.css">
    
    <link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
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
                    </c:if>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="/radiant/board/qnaList.do?pg=1">고객센터</a></li>
                </ul>
            </div><!--headNav-->
        </div><!--header-->
        <div id="mainNav"><!-- 메인 고정 메뉴 -->
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
        
        <header id="stockTitle" class="header">
		
		</header><!-- header -->
		<nav id="title" class="nav">
			
		</nav>
	
		<section id="stockDetail" class="section">
			<div class=image>
				<div class="carousel-container">
					<!--Add Add Preview and Next buttons-->
					<div class="navigation">
						<div class="prev nav-btn"><</div>
						<div class="next nav-btn">></div>
						</div>
						<!--Add Image-->
						<div class="carousel">
							<div class="item main">
								<img src="../img/clothes/${mainFileList }" alt="${mainFileList }" />
								<div class="caption">
									Image 1
								</div>
							</div>
							<div class="item">
								<img src="../img/clothes/1.png" alt="1.png" />
								<div class="caption">
									Image 2
								</div>
							</div>
							<div class="item">
								<img src="../img/clothes/2.png" alt="cityscape" />
								<div class="caption">
								Image 3
								</div>
							</div>      
						</div>
					</div>
				</div>
			
			
			
			
			
			
			
				<%-- <div id="img-slide">
					<div id="arrow-left" class="arrow"></div>
						<div class="slide slide1" id="img-main"><img alt="${mainFileList }" src="../img/clothes/${mainFileList }"/></div><!-- 메인 이미지 출력부 -->
					    <div class="slide slide2"></div>
					    <div class="slide slide3"></div>
					    <div class="slide slide4"></div>
				    <div id="arrow-right" class="arrow"></div>
				</div><!-- 이미지슬라이드 -->
			</div><!-- 이미지 들어오는곳 --> --%>
			
			<div class="stock-detail">
				<div id="stock-title">
					<h4>
						<span>[레디언트]ts2866 1+1 레이어드 하기 좋은 베이직 속기모 하이넥 티 tee</span>
					</h4><br>
					<h3>
						<span>21% 18,900원</span> <del>24,000원</del>
					</h3>
				</div><!-- 상세정보 제목부 -->
				
				<div id="stock-list">
					<div id="stock-color">
						<div id="stock-index-color">
							<p>색상<p>
						</div>
						
						<div id="color-index-list">
							<div id="img-color1">색사진1</div>
							<div id="img-color2">색사진2</div>
						</div>
					</div><!-- 색상정보 -->
					
					<div id="stock-size">
						<div id="stock-index-size">
							<p>사이즈<p>
						</div>
						
						<div id="size-index-list">
							<div id="img-size1">사이즈사진1</div>
							<div id="img-size2">사이즈사진2</div>
						</div>
					</div><!-- 사이즈정보 -->
					
				</div>
				
				<div class="like-buy-mycart">
					<input type="button" id="likeBtn" value="찜하기"/>
					<input type="button" id="buyBtn" value="구매하기"/>
					<input type="button" id="mycartBtn" value="장바구니"/>
				</div>
				
			</div><!-- 제품 상세페이지 -->
		</section><!--section-->
		
	<aside id="stockReview" class="aside"><!-- 제품정보 페이지 -->
	</aside><!--section-->
	
	<footer class="footer"><!-- 리뷰게시판 -->
		게시판
	</footer><!-- footer -->
	<script type="text/javascript" src="/radiant/js/stock.js"></script>

       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
	
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

</body>
</html>