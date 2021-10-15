<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Radiant Q&A</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/radiant/js/board.js"></script>
    <link rel="stylesheet" href="/radiant/css/radiant_Main.css">
    <link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/radiant/js/member.js"></script>
    <style type="text/css">
    #qnaListForm {
    	margin: 5% 0 15% 15%;
    	width: 65%;
    }
    #qnaListForm th {
    	color: #999;
    	font-size: 10pt;
    }
    #qnaListForm td {
    	font-size: 11pt;
    	height: 30px;
    }
    #qnaListForm legend {
    	font-size: 20pt;
    }
    .qnaContent1 {
    	display: none;
    }
    .qnaContent2 {
    	visibility: visible;
    }
   	.qnaContent2 td {
   		padding: 5px 50px;
   		
   	}
    #qnaWriteBtn {
    	float: right;
    	width: 80px;
		height: 40px;
		color: white;
		background: #39210D;
    }
    #page {
    	text-align: center;
    }
    #page a {
    	text-decoration: none;
    	color: #999;
    }
    #page a:after {
    	content: ' |';
    	padding: 0 5px;
    	color: #999;
    	font-weight: normal;
    }
    #page a:last-child:after {
    	content: '';
    }
    #page #CurrentPagingA {
    	color: #444;
    	font-weight: bold;
    }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="header">
            
            <div id="logo">
                <a href="/radiant/"><img src="/radiant/img/logo.png" alt="logo"></a>
            </div><!--logo-->
            <div id="icon">
                <a href="/radiant/"><img src="/radiant/img/icon.png" alt="icon"></a>
            </div>

            <div id="headNav">
                <ul>
                	<c:if test="${sessionScope.memId == null}">
                    	<li><a href="/radiant/member/loginForm.do">로그인</a></li>
                    	<li><a href="#">회원가입</a></li>
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
        <div id="mainNav">
            <ul>
                <li>
                    <div id="menu">
                        <a href="#">
                            <img src="/radiant/img/menu.JPG" alt="menu">
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
        <hr>
        <div id="section">
            <div id="subNav">
                
                <form id="qnaListForm" name="qnaListForm" method="post" action="">
                	<legend>Q&A</legend>
                	<br>
                	<c:if test="${requestScope.list != null }">
	                	<table class="table table-hover">
	                		<thead>
	                			<tr>
	                				<th>글번호</th>
	                				<th>제목</th>
	                				<th>작성자</th>
	                				<th>날짜</th>
	                				<th>조회수</th>
	                			</tr>
	                		</thead>
	                		
	                		<tbody>
	                			<c:forEach var="boardDTO" items="${requestScope.list }">
			                		<tr>
			                			<td>${boardDTO.seq }</td>
			                			<td>
			                				<a href="" class="qnaSubject">${boardDTO.subject }</a>
			                			</td>
			                			<td>${boardDTO.id }</td>
			                			<td>${boardDTO.logtime }</td>
			                			<td>${boardDTO.hit }</td>
			                		</tr>
			                		<tr class="qnaContent1">
			                			<td colspan="5">${boardDTO.content }</td>
			                		</tr>
		                		</c:forEach>
	                		</tbody>
	                	</table>
                	</c:if>
                	
                	<c:if test="${sessionScope.memId != null }">
                		<button type="button" class="btn" id="qnaWriteBtn" onclick="location.href='/radiant/board/qnaWriteForm.do'">글쓰기</button>
                	</c:if>
                	
                	<br><br>
                	<div id="page" name="page">
                		<c:forEach begin="1" end="${totalP }" step="1" var="i">
                			<c:if test="${i == pg }">
                				<a href="/radiant/board/qnaList.do?pg=${i }" id="CurrentPagingA">${i }</a>
                			</c:if>
                			<c:if test="${i != pg }">
                				<a href="/radiant/board/qnaList.do?pg=${i }" id="pagingA">${i }</a>
                			</c:if>
                		</c:forEach>
                	</div>
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
</body>
</html>