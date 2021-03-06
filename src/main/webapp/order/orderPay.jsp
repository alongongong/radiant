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
    <link rel="stylesheet" href="/radiant/css/order.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/radiant/js/member.js"></script>
    <script type="text/javascript" src="/radiant/js/order.js"></script>
    <script type="text/javascript" src="/radiant/js/orderOnload.js"></script>
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
        	<form id="payForm" name="payForm" method="post" action="/radiant/order/orderComplete.do">
        		<input type="hidden" id="i" name="i" value="${i }">
				<c:forEach var="j" begin="1" end="${i }" step="1">
        			<input type="hidden" id="clNum" name="clNum${j-1 }" value="${clNum }">
        			<input type="hidden" id="color${j-1 }" name="color${j-1 }" value="${color[j-1]}">
        			<input type="hidden" id="outcount${j-1 }" name="outcount${j-1 }" value="${outcount[j-1]}">
        		</c:forEach>
        		<div id="orderTopDiv">
        			<table id="orderTopTable">
        				<thead>
	        				<tr>
	        					<th colspan="7">
	        						<div id="topDiv" >주문서 작성</div>
	        						<img src="/radiant/img/opderPay.png" alt="주문결제" >
	        					</th>
	        				</tr>
        				</thead>
        				<tbody>
        					<tr>
        						<th colspan="2"  height="70px">상품정보</th>
        						<th>옵션</th>
        						<th>가격</th>
        						<th>수량</th>
        						<th>총금액</th>
        						<th>예상적립금</th>
        					</tr>
        					
        					
        				</tbody>
        				<tfoot>
	        				<tr>
	        					<td colspan="7"><p>배송비는 80,000원 이상 구매시 무료배송입니다.</p></td>
	        				</tr>
        				</tfoot>
        			</table>
        		</div>
        		<br><br><br>
        		<div id="rightDiv">
        			<div id="stickyDiv">
		        		<div id="payInfoDiv">
		        			<table id="payInfoTable">
		        				<tbody>
			        				<tr>
			        					<th colspan="2">결제정보</th>
			        				</tr>
			        				<tr>
			        					<td>총 상품금액</td>
			        					<td id="priceAll" name="priceAll"></td>
			        				</tr>
			        				<tr>
			        					<td>배송료</td>
			        					<td><span id="shipMoney" name="shipMoney"></span>원
			        						<input type="hidden" id="hiddenShipMoney" name="hiddenShipMoney"></td>
			        				</tr>
			        				<tr>
			        					<td>총 할인금액</td>
			        					<td><span id="totSaleMoney"></span>원</td>
			        				</tr>
			        				<tr><td>&emsp;</td></tr>
		        				</tbody>
		        				<tfoot>
		        					<tr>
		        						<td>총 결제금액</td>
		        						<td><span id="totPrice" name="totPrice"></span>원</td>
		        					</tr>
		        				</tfoot>
		        			</table>
		        		</div><!-- payInfoDiv -->
		        	
		        		<div id="payBtnDiv">
			        		<table id="payBtnTable">
		        				<tbody>
			        				<tr><td>&emsp;</td></tr>
			        				<tr>
			        					<td>
			        						<input type="button" class="btn" id="orderPayBtn" value="결제하기">
			        						<input type="button" class="btn" id="orderCancelBtn" value="취소">
			        						<div id="noticeDiv"></div>
			        					</td>
			        				</tr>
			        				<tr><td>&emsp;</td></tr>
		        				</tbody>
		        			</table>
		       			</div><!-- payBtnDiv -->
		       		</div><!-- stickyDiv -->
	       		</div><!-- rightDiv -->
	       		
	       		
        		<div id="leftDiv">
	        		<div id="saleDiv">
	        			<table id="saleTable">
	        				<tbody>
	        					<tr>
	        						<th colspan="2">할인/혜택</th>
	        					</tr>
	        					<tr>
	        						<td colspan="2">
	        							<div><p>적립금</p>보유적립금 <span id="haveSaved">1,000</span><span>원</span></div>
	        							<input type="text" id="saved" name="saved" value="0" size="101">
	        							<input type="button" id="allUseBtn" class="btn" value="전액사용">
	        						</td>
	        					</tr>
	        					<tr>
	        						<td colspan="2"><div><p>적립포인트</p>구매하시면 <span id="newSaved" name="newSaved"></span><span>원</span>이 적립됩니다.</div></td>
	        					</tr>
		        				<tr><td>&emsp;</td></tr>
	        				</tbody>
	        				<tfoot>
	        					<tr>
	        						<td>총 할인내역</td>
	        						<td>
	        							<div>기본할인 (-) <span id="saleMoney"></span>원</div>
	        							<div>적립금 (-) <span id="useSaved">0</span>원</div>
	        						</td>
	        					</tr>
	        				</tfoot>
	        			</table>
	        		</div>
	        		<br><br><br>
	        		<div id="userInfodiv">
	        			<table id="userInfoTable">
	        				<tbody>
		        				<tr>
		        					<th>주문자정보</th>
		        				</tr>
		        				<tr>
		        					<td>
		        						<input type="checkbox" id="memberUpdate" name="memberUpdate" checked>
		        						<label for="memberUpdate">주문자 정보로 회원정보를 업데이트 합니다.</label>
		        					</td>
		        				</tr>
		        				<tr>
		        					<td>
		        						<input type="text" id="userInfoName" name="userInfoName" value="" size="115" readonly>
		        					</td>
		        				</tr>
		        				<tr>
		        					<td>
		        						<select id="userInfoTel1" name="userInfoTel1" style="width: 255px">
		        							<option value="010">010</option>
		        							<option value="011">011</option>
		        							<option value="019">019</option>	
		        						</select>
		        						<input type="text" id="userInfoTel2" name="userInfoTel2" placeholder="휴대폰 번호" size="33">
		        						<input type="text" id="userInfoTel3" name="userInfoTel3" placeholder="휴대폰 번호" size="33">
		        					</td>
		        				</tr>
		        				<tr>
		        					<td>
		        						<input type="email" id="userInfoEmail" name="userInfoEmail" placeholder="이메일" size="115">
		        					</td>
		        				</tr>
		        				<tr><td>&emsp;</td></tr>
		        			</tbody>
	        			</table>
	        		</div><!-- userInfodiv -->
	        		<br><br><br>
	        		<div id="shipInfoDiv">
	        			<table id="shipInfoTable">
	        				<tbody>
	        					<tr>
	        						<th>배송지정보</th>
	        					</tr>
	        					<tr>
	        						<td>
	        							<input type="checkbox" id="userSame">
	        							<label for="userSame">주문인 정보와 동일</label>
	        						</td>
	        					<tr>
	        					<tr>
	        						<td> <!-- DB에 입력된 배송지정보 for문으로 불러오기 -->
	        							<select id="shipInfoSelect" style="width: 740px">
	        								<option value="0">배송지를 선택해주세요</option>
	        							</select>
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<input type="text" id="shipName" name="shipName" value="" placeholder="이름" size="115">
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<select id="shipTel1" name="shipTel1" style="width: 255px">
		        							<option value="010">010</option>
		        							<option value="011">011</option>
		        							<option value="019">019</option>	
		        						</select>
	        							<input type="text" id="shipTel2" name="shipTel2" placeholder="휴대폰번호" size="33">
	        							<input type="text" id="shipTel3" name="shipTel3" placeholder="휴대폰번호" size="33">
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<input type="text" id="shipZipcode" name="shipZipcode" placeholder="우편번호" size="96">
	        							<input type="button" class="btn" id="zipcodeBtn" value="우편번호 검색">
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<input type="text" id="shipAddr1" name="shipAddr1"placeholder="주소" size="115">
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<input type="text" id="shipAddr2" name="shipAddr2"placeholder="상세주소" size="115">
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<textarea id="shipMemo" name="shipMemo" placeholder="배송메모" cols="117" rows="4"></textarea>
	        						</td>
	        					<tr>
	        					<tr>
	        						<td>
	        							<div>배송메모는 배달기사님께 보여지는 메모입니다.</div>
	        							<div>주문건 관련하여 요청사항 있으실 경우 게시판에 꼭! 남겨주세요:)</div>
	        						</td>
	        					</tr>
		        				<tr><td>&emsp;</td></tr>
	        				</tbody>
	        			</table>
	        		</div><!-- shipInfoDiv -->
	        		<br><br><br>
	        		<div id="paymentDiv">
	        			<table id="paymentTable">
	        				<tbody>
		        				<tr>
		        					<th colspan="2">결제수단 선택</th>
		        				</tr>
		        				<tr>
		        					<td colspan="2" align="center">
		        						<input type="button" class="btn" id="buyBenefit" value="구매혜택">
		        						<input type="button" class="btn" id="freeMonthly" value="무이자 할부">
		        						<input type="button" class="btn" id="saveInfo" value="적립금 지급안내">
		        					</td>
		        				</tr>
		        				<tr><td>&emsp;</td></tr>
		        				<tr>
		        					<td colspan="2">
		        						<ul>
		        							<li class="paymentLi" data-num="0"><img src="/radiant/img/payment/deposit.png" alt="무통장입금" class="paymentImg"> 
		        								<img src="/radiant/img/payment/deposit_check.png" alt="무통장입금" class="paymentImgCheckHidden">
											</li><li class="paymentLi" data-num="1" style="background: #3E3E3E"><img src="/radiant/img/payment/card.png" alt="신용카드" class="paymentHidden">
												<img src="/radiant/img/payment/card_check.png" alt="신용카드"  class="paymentImgCheck">
											</li><li class="paymentLi" data-num="0"><img src="/radiant/img/payment/phone.png" alt="휴대폰 결제" class="paymentImg">
												<img src="/radiant/img/payment/phone_check.png" alt="휴대폰결제"  class="paymentImgCheckHidden">
											</li><li class="paymentLi" data-num="0"><img src="/radiant/img/payment/samsung.png" alt="삼성페이" class="paymentImg">
												<img src="/radiant/img/payment/samsung_check.png" alt="삼성페이"  class="paymentImgCheckHidden"></li></ul>
		        						<ul>
		        							<li class="paymentLi" data-num="0"><img src="/radiant/img/payment/payco.png" alt="PAYCO" class="paymentImg">
		        								<img src="/radiant/img/payment/payco_check.png" alt="PAYCO"  class="paymentImgCheckHidden">
		        							</li><li class="paymentLi" data-num="0"><img src="/radiant/img/payment/kakao.png" alt="카카오페이" class="paymentImg">
		        								<img src="/radiant/img/payment/kakao_check.png" alt="카카오페이"  class="paymentImgCheckHidden">
		        							</li><li class="paymentLi" data-num="0"><img src="/radiant/img/payment/smilepay.png" alt="스마일페이" class="paymentImg">
		        								<img src="/radiant/img/payment/smilepay_check.png" alt="스마일페이"  class="paymentImgCheckHidden">
		        							</li><li class="paymentLi" data-num="0"><img src="/radiant/img/payment/simplepay.png" alt="간편결제" class="paymentImg">
		        								<img src="/radiant/img/payment/simplepay_check.png" alt="간편결제" class="paymentImgCheckHidden"></li>
		        						</ul>
		        						<input type="hidden" id="paymentCheck" name="paymentCheck" value="신용카드">
		        					</td>
		        				</tr>
		        				<tr><td>&emsp;</td></tr>
		        				<tr>
		        					<td colspan="2">
										<div><span>'선택한 결제수단'</span>를 선택하셨습니다.</div>
										<div>아래 주문하기를 눌러 결제를 이어가주세요.</div>
									</td>
		        				</tr>
		        				<tr>
		        					<td>
		        						<p>무통장입금</p>
		        					</td>
		        					<td>
		        						<div>레디언트에 지정된 계좌로 직접 입금하는 방식입니다.</div>
		        						<div>(인터넷뱅킹, 텔레뱅킹, ATM, 은행방문)</div>
		        					</td>
		        				</tr>
		        				<tr>
		        					<td>
		        						<p>실시간계좌이체</p>
		        					</td>
		        					<td>
		        						<div>은행을 거치지않고 회원님 계좌에서 바로 이체되는 편리한 서비스입니다. (이체수수료무료 / 공인인증서필수)</div>
		        					</td>
		        				</tr>
		        				<tr>
		        					<td>
		        						<p>휴대폰결제</p>
		        					</td>
		        					<td>
		        						<div>인증번호를 통해 간단히 휴대폰으로 결제처리가 되면 익월통신요금에 합산청구됩니다.</div>
		        					</td>
		        				</tr>
		        				<tr><td>&emsp;</td></tr>
	        				</tbody>
	        			</table>
	        		</div><!-- paymentDiv -->
	       		</div><!-- leftDiv -->

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