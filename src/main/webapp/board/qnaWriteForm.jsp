<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Radiant 레디언트</title>
    <link rel="stylesheet" href="/radiant/css/radiant_Main.css">
    <link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/radiant/js/board.js">
    </script>
    <style type="text/css">
    #qnaWriteForm {
    	margin: 5% 0 10% 20%;
    }
    #qnaWriteForm td {
    	padding: 5px;
    	height: 35px;
    	font-size: 10pt;
		color: #999;
    }
    #qnaWriteForm tr td:first-child {
    	width: 80px;
    }
    #qnaWriteForm legend {
    	font-size: 20pt;
    }
    #qnaSubject {
    	padding-bottom: 3px;
    	border: 0;
    	border-bottom: 1px solid #999;
    	font-size: 10pt;
    } 
    #qnaContent {
    	border: 1px solid #999;
    	font-size: 10pt;
    }
    #qnaSubject:focus, #qnaContent:focus, #qnaPwd:focus {
    	outline: none;
    }
    #qnaSubjectDiv, #qnaContentDiv {
    	font-size: 9pt;
		font-weight: bold;
		color: brown;
    }
    .filebox .upload-name {
    	display: inline-block;
    	padding: 0 10px;
    	border: 0;
    	border-bottom: 1px solid #999;
    	vertical-align: middle;
    }
    .filebox label {
    	display: inline-block;
    	padding: 3px 15px;
    	background: white;
    	border: 1px solid;
    	font-size: 9pt;
    	vertical-align: top;
    }
    #qnaAttachedFile {
    	width: 0;
    	height: 0;
    	padding: 0;
    	overflow: hidden;
    	border: 0;
    }
    #qnaPwd {
    	border: 0;
    	border-bottom: 1px solid #999;
    }
	#qnaWriteBtn, #qnaCancelBtn {
		width: 150px;
		height: 40px;
		color: white;
		background: #39210D;
	}
    </style>
</head>
<body>
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
        <hr>
        <div id="section">
            <div id="subNav">
                
                <form id="qnaWriteForm" name="qnaWriteForm" method="post" action="/radiant/board/qnaWrite.do">
                	<legend>Q&A</legend>
                	<br>
                	<table>
                		<tr>
                			<td align="center">제목</td>
                			<td>
                				<input type="text" id="qnaSubject" name="qnaSubject" size="78">
                				<div id="qnaSubjectDiv"></div>
                			</td>
                		</tr>
                		<tr>
                			<td align="center">내용</td>
                			<td>
                				<textarea id="qnaContent" name="qnaContent" rows="20" cols="80"></textarea>
                				<div id="qnaContentDiv"></div>
                			</td>
                		</tr>
                		<tr>
                			<td align="center">첨부파일</td>
                			<td class="filebox">
                				<input class="upload-name" id="upload-name" placeholder="파일 첨부" size="62">
                				<label class="btn" for="qnaAttachedFile">파일찾기</label>
                				<input type="file" id="qnaAttachedFile" name="qnaAttachedFile" onchange="qnaAttachedFileName()">
                			</td>
                		</tr>
                		<tr>
                			<td align="center">비밀번호</td>
                			<td>
                				<input type="password" id="qnaPwd" name="qnaPwd" size="30">
                			</td>
                		</tr>
                		<tr>
                			<td>&emsp;</td>
                		</tr>
                		<tr>
                			<td colspan="2" align="center"> &emsp;
                				<button type="button" class="btn" id="qnaWriteBtn" name="qnaWriteBtn" onclick="qnaWriteCheck()">글쓰기</button>
                				<button type="button" class="btn" id="qnaCancelBtn" onclick="qnaWriteCancel()">취소</button>
                			</td>
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
</body>
</html>