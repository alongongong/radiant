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
    <script type="text/javascript" src="/radiant/js/stock.js"></script>
</head>
<body>
	<header id="stockTitle" class="header">
		
	</header><!-- header -->
	<nav id="title" class="nav">
		
	</nav>
	
	<section id="stockDetail" class="section">
		<div class=image>
			<div id="img-main">
				<img alt="1.png" src="../img/clothes/1.png"/>
			</div><!-- 메인 이미지 출력부 -->
			
			<div id="img-slide">
				[이미지 슬라이드 출력]
			</div><!-- 이미지슬라이드 -->
		</div><!-- 이미지 들어오는곳 -->
		
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

</body>
</html>