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
    p {
    	margin-bottom: 0;
    }
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
    .boardUpdateBtn, .boardDeleteBtn {
    	border: 0;
   		background: none;
   		color: blue;	
		font-size: 9pt;
    }
    .boardUpdateBtn:hover, .boardDeleteBtn:hover {
    	text-decoration: underline;
    }
    .qnaContent1 {
    	display: none;
    }
    .qnaContent2 {
    	visibility: visible;
    }
   	.qnaContent2, .qnaContent2 td {
   		padding: 20px 30px;   		
   	}
   	.qnaComment1 {
   		display: none;
   	}
   	.qnaComment2 {
   		visibility: visible;
   	}
   	.qnaComment2 ul {
   		margin: 10px 30px 0 30px;
   		padding: 0 10px; 
   		font-size: 9pt;
   	}
   	.qnaComment2 .commentView a {
   		padding-left: 5px;
   	}
   	.qnaComment2 .commentView {
   		border-top: 1px dotted #999;
   		border-collapse: collapse;   	
   		padding : 15px 0;	
   	}  	
   	.qnaComment2 .commentView:first-child {
   		border-top: 0;
   	}
   	.commentWriteLi {
   		padding-bottom : 10px;
   	}
   	.commentBtn {
   		float: right;
    	width: 80px;
		height:60px;
		color: white;
		background: #39210D;
		font-size: 9pt;
   	}
   	.commentUpBtn {
   		float: right;
		width: 80px;
		height: 60px;
		color: white;
		background: #39210D;
		font-size: 9pt;
	}
   	.commentDeleteBtn, .commentUpdateBtn {
   		border: 0;
   		background: none;
   		color: blue;
   	}
   	.commentDeleteBtn:hover {
   		text-decoration: underline;
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
                <a href="/radiant/main/index.do"><img src="/radiant/img/logo.png" alt="logo"></a>
            </div><!--logo-->
            <div id="icon">
                <a href="/radiant/main/index.do"><img src="/radiant/img/icon.png" alt="icon"></a>
            </div>

            <div id="headNav">
                <ul>
                	<c:if test="${sessionScope.memId == null}">
                    	<li><a href="/radiant/member/loginForm.do">?????????</a></li>
                    	<li><a href="/radiant/member/write_agree.do">????????????</a></li>
                    </c:if>
                    <c:if test="${sessionScope.memId != null }">
                    	<li>${sessionScope.memName }??? ?????????</li>
                    	<li><a href="/radiant/member/logout.do">????????????</a></li>
                    </c:if>
                    <li><a href="#">???????????????</a></li>
                    <li><a href="/radiant/board/qnaList.do?pg=1">????????????</a></li>
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
                <li><a href="#">????????? ??????</a></li>
                <li><a href="#">??????????????????</a></li>
                <li><a href="#">????????????15%</a></li>
            </ul>
            <ul>
                <li>
                    <a href="#">?????????</a>
                    <ul class="dropDownMenu">
                        <li><a href="#">??????</a></li>
                        <li><a href="#">?????????</a></li>
                        <li><a href="#">?????????</a></li>
                        <li><a href="#">????????????</a></li>
                    </ul>
                </li>
                <li><a href="#">????????????</a></li>
                <li><a href="#">?????????</a></li>
                <li><a href="#">??????/?????????</a></li>
                <li><a href="#">?????????</a></li>
                <li><a href="#">??????</a></li>
                <li><a href="#">?????????</a></li>
                <li><a href="#">????????????</a></li>
                <li><a href="#">???????????????</a></li>
                <li><a href="#">??????</a></li>
                <li><a href="#">????????????</a></li>
                <li><a href="#">?????????</a></li>
            </ul>
            <ul>
                <li><a href="#">??????????????????</a></li>
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
	                				<th>?????????</th>
	                				<th>??????</th>
	                				<th>?????????</th>
	                				<th>??????</th>
	                				<th>?????????</th>
	                			</tr>
	                		</thead>
	                		
	                		<tbody>
	                			<c:forEach var="boardDTO" items="${requestScope.list }">
			                		<tr>
			                			<td>${boardDTO.boardSeq }</td>
			                			<td>
			                				<a href="" class="qnaSubject">${boardDTO.subject }</a>
			                			</td>
			                			<td>${boardDTO.id }</td>
			                			<td>${boardDTO.logtime }</td>
			                			<td>${boardDTO.hit }</td>
			                		</tr>
			                		<tr class="qnaContent1">
			                			<td colspan="5">
			                				<c:if test="${boardDTO.id == sessionScope.memId || sessionScope.memId == '?????????' }">
				                				<div align="right">
					                				<a class="boardUpdateBtn" href="/radiant/board/qndUpdateForm.do?boardSeq=${boardDTO.boardSeq }">??????</a> &emsp;
					                				<input type="button" class="boardDeleteBtn" value="??????" > &emsp;&emsp;&emsp;&emsp;
				                				</div>
				                			</c:if>
			                				${boardDTO.content }<br><br><br><br><br>
			                			</td>
			                		</tr>
			                		<tr class="qnaComment1">
			                			<td colspan="5">
		                					<ul id="comment_list${boardDTO.boardSeq }">
		                						<li class="commentWriteLi">
		                							<c:if test="${sessionScope.memId != null }">
			                							<textarea name="commentText${boardDTO.boardSeq }" rows="3" cols="103" ></textarea>
			                							<input type="button" class="commentBtn" value="????????????">
			                							<input type="hidden" class="boardSeq${boardDTO.boardSeq }" value="${boardDTO.boardSeq }">
		                							</c:if>
		                							<c:if test="${sessionScope.memId == null }">
			                							<textarea name="commentText${boardDTO.boardSeq }" rows="3" cols="103" placeholder="???????????? ????????????" readonly></textarea>
			                							<input type="button" class="commentBtn"  value="????????????" disabled>
			                							<input type="hidden" class="boardSeq${boardDTO.boardSeq }" value="${boardDTO.boardSeq }">
		                							</c:if>
		                							
		                						</li>
		                						<c:forEach var="commentDTO" items="${commentList }">
			                						<c:if test="${boardDTO.boardSeq == commentDTO.boardSeq }">
				                						<li class="commentView" value="${commentDTO.commentSeq }">
				                							<div>
				                								${commentDTO.commentId } &emsp;&emsp; 
				                								<font size="2" color="lightgray">${commentDTO.commentDate }</font>
				                								<c:if test="${commentDTO.commentId == sessionScope.memId || sessionScope.memId == '?????????' }">
				                								&emsp;
				                								<input type="button" class="commentUpdateBtn" value="??????">
				                								<input type="button" class="commentDeleteBtn" value="??????">
				                								</c:if>
				                							</div>
				                							<div>
				                								<p class="content_p">${commentDTO.commentText}</p><br>
				                							</div>
				                						</li>
			                						</c:if>
		                						</c:forEach>
		                					</ul>
			                			</td>
			                		</tr>
		                		</c:forEach>
	                		</tbody>
	                	</table>
                	</c:if>
	               	<input type="hidden" id="boardSeq" name="boardSeq" value="">
                	
                	
                	<c:if test="${sessionScope.memId != null }">
                		<button type="button" class="btn" id="qnaWriteBtn" onclick="location.href='/radiant/board/qnaWriteForm.do'">?????????</button>
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
                    ???~??? : am 11 ~ pm 5&emsp;???????????? : pm 12 ~ 1<br>
                    (???/???/???????????? ??????)<br>
                </p>
            </div><!--footerLeft-->
            <div id="footerRight">
                <p>
                    ??????/???????????????(cj???????????????) :<br>
                    ??????????????? ????????? ????????????94??? 20 ???????????? 5-9???<br>
                    ??????/???????????????(??????????????????) :<br>
                    ??????????????? ????????? ????????????94??? 20 ???????????? 5-9???<br>
                </p>
            </div><!--footerRight-->
            <div id="footerBottom">
                <ul>
                    <li><a href="#">????????????</a></li>
                    <li><a href="#">????????????</a></li>
                    <li><a href="#">????????????????????????</a></li>
                    <li><a href="#">????????????</a></li>
                    <li><a href="#">?????????</a></li>
                    <li><a href="#">????????????</a></li>
                </ul>
                <p>
                    ?????? : *** ?????? : 1644-3225 ?????? : 02)2231-4995 ?????? : ??????????????? ????????? ????????? 237-14 ????????????<br>
                    ??????????????? ?????? : 2015-????????????-1525 ????????????????????? : 215-87-38531 [?????????????????????] ??????????????????????????? : ?????????, ????????? (attrangs@naver.com)<br>
                </p>
            </div>
        </div><!--footer-->
    </div><!--wrap-->
</body>
</html>