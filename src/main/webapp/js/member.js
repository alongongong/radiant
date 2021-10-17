//회원가입 버튼 클릭시 유효성 체크
function checkWrite(){
	
	document.getElementById("writeNameDiv").innerText="";
	document.getElementById("writeIdDiv").innerText="";
	document.getElementById("writePwdDiv").innerText="";
	document.getElementById("writeRepwdDiv").innerText="";
	document.getElementById("writePhoneDiv").innerText="";
	document.getElementById("writeEmailDiv").innerText="";
	
	if(document.writeForm.writeName.value==""){
		document.getElementById("writeNameDiv").innerText="이름을 입력하세요";
	}else if(document.writeForm.writeId.value==""){
		document.getElementById("writeIdDiv").innerText="아이디를 입력하세요";
	}else if(document.writeForm.writePwd.value ==""){
		document.getElementById("writePwdDiv").innerText="비밀번호를 입력하세요";
	}else if(document.writeForm.writeRepwd.value !=document.writeForm.writePwd.value){
		document.getElementById("writeRepwdDiv").innerText="비밀번호가 다릅니다.";
	}else if(document.writeForm.writeTel2.value==""){
		document.getElementById("writePhoneDiv").innerText="휴대폰 번호를 입력하세요"
	}else if(document.writeForm.writeTel3.value==""){
		document.getElementById("writePhoneDiv").innerText="휴대폰 번호를 입력하세요"
	}else if(document.writeForm.writeEmail1.value==""){
		document.getElementById("writeEmailDiv").innerText="이메일을 입력하세요";
	}else if(document.writeForm.writeEmail2.value==""){
		document.getElementById("writeEmailDiv").innerText="이메일을 입력하세요";
	}else if(document.writeForm.writeIdDuplication.value!="idCheck"){
		document.getElementById("writeEmailDiv").innerText="아이디 중복체크를 해주세요";
	}else{
		document.writeForm.submit();
	}
	
}

//아이디 중복 체크
function checkId(id){
	
	var id=document.getElementById("writeId").value;
	
	document.getElementById("writeIdDiv").innerText="";
	
	if(document.writeForm.writeId.value==""){
		document.getElementById("writeIdDiv").innerText="아이디를 입력하세요.";
	}else{
		window.open("http://localhost:8080/radiant/member/checkId.do?id="+id,
					"writeCheckId",//창 중복 방지
					"width=400 height=150 top=200 left=600");
	}
	
}
//아이디 중복체크 후 결과 넘기기
function closeIdCheck(){
	window.opener.document.writeForm.writeId.value = document.getElementById("useid").innerHTML;
	opener.document.writeForm.writeIdDuplication.value="idCheck";
	window.close();
	opener.writeForm.focus();
}

function inputIdChk(){
	document.writeForm.writeIdDuplication.value="idUncheck";
	console.log("check");
}
//핸드폰 중복체크
function checkPhone(tel2, te13){
	
	var tel2 =document.getElementById("writeTel2").value;
	var tel3 =document.getElementById("writeTel2").value;
	
	document.getElementById("writePhoneDiv").innerText="";
	
	if(document.writeForm.writeTel2.value==""){
		document.getElementById("writeIdDiv").innerText="휴대폰 번호를 입력하세요";
	}else if(document.writeForm.writeTel2.value==""){
		document.getElementById("writeIdDiv").innerText="휴대폰 번호를 입력하세요";
	}else{
		window.open("http://localhost:8080/radiant/member/checkPhone.do?tel2="+te12,
					"writeCheckId",//창 중복 방지
					"width=400 height=150 top=200 left=600");
	}
	
}
	
//로그인 유효성 체크
function checkLogin() {
	document.getElementById("loginIdDiv").innerText="";
	document.getElementById("loginPwdDiv").innerText="";
	
	var id = document.getElementById("loginId").value;
	var pwd = document.getElementById("loginPwd").value;
	if(id=="") {
		document.getElementById("loginIdDiv").innerText="아이디를 입력하세요.";
		document.getElementById("loginId").focus();
	} else if(pwd=="") {
		document.getElementById("loginPwdDiv").innerText="비밀번호를 입력하세요.";
		document.getElementById("loginPwd").focus();
	} else {
		document.loginForm.submit();
	}
}
// 로그인 실패
function loginFail() {
	document.getElementById("loginFailDiv").innerText="아이디와 비밀번호를 확인해주세요.";
}

//index.jsp 
//imgSlide
var img = 0;
function imgSlide(num) {
	if(num == 0) {img = img - 100;}
	else if(num == 1) {img = img + 100;}
	else {alert("이상함");}
	
	document.getElementById("imgList").setAttribute("style", "margin-left: " + img + "%;");
}
	