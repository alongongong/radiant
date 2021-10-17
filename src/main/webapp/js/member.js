//약관 동의 체크박스 확인
function write_agree(){
   
   var chkAll = document.getElementById('chkAll').checked;
   var chk1 = document.getElementById('chk1').checked;
   var chk2 = document.getElementById('chk2').checked;
   
   if(!chkAll && (!chk1 || !chk2)){
      alert("약관에 동의해주세요.");
      return false;   
   }else{   
       document.joinForm.submit();
   }
    
}   

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

//---------------------------------------------------------------------------로그인
	
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

// 아이디/비밀번호 찾기
function findIdPwd() {
	window.open("/radiant/member/findIdPwdForm.do", 
				"findIdPwd", 
				"width=500 height=450 top=200 left=600");
}
function idFind() {
	console.log("id");
	document.getElementById("findTable").innerHTML="";
	document.getElementById("findTable").innerHTML=document.getElementById("findIdTable").innerHTML;
	document.getElementById("findId").checked=true;
}
function pwdFind() {
	console.log("pwd");
	document.getElementById("findTable").innerHTML="";
	document.getElementById("findTable").innerHTML=document.getElementById("findPwdTable").innerHTML;
	document.getElementById("findPwd").checked=true;
}

// 아이디 찾기
function findIdCheck() {
	document.getElementById("findIdNameDiv").innerText="";
	document.getElementById("findIdTelDiv").innerText="";
	document.getElementById("findIdFailDiv").innerText="";
	
	if(document.getElementById("findIdName").value == "") {
		document.getElementById("findIdNameDiv").innerText="이름을 입력해주세요.";
		document.getElementById("findIdName").focus();
	} else if(document.getElementById("findIdTel2").value=="") {
		document.getElementById("findIdTelDiv").innerText="전화번호를 입력해주세요.";
		document.getElementById("findIdTel2").focus();
	} else if(document.getElementById("findIdTel3").value=="") {
		document.getElementById("findIdTelDiv").innerText="전화번호를 입력해주세요.";
		document.getElementById("findIdTel3").focus();
	} else {
		$('#findIdForm').submit();
	}
}

// 비밀번호 찾기
function findPwdCheck() {
	document.getElementById("findPwdIdDiv").innerText="";
	document.getElementById("findPwdNameDiv").innerText="";
	document.getElementById("findPwdTelDiv").innerText="";
	document.getElementById("findPwdFailDiv").innerText="";
	
	if(document.getElementById("findPwdId").value == "") {
		document.getElementById("findPwdIdDiv").innerText="이름을 입력해주세요.";
		document.getElementById("findPwdId").focus();
	} else if(document.getElementById("findPwdName").value == "") {
		document.getElementById("findPwdNameDiv").innerText="이름을 입력해주세요.";
		document.getElementById("findPwdName").focus();
	} else if(document.getElementById("findPwdTel2").value=="") {
		document.getElementById("findPwdTelDiv").innerText="전화번호를 입력해주세요.";
		document.getElementById("findPwdTel2").focus();
	} else if(document.getElementById("findPwdTel3").value=="") {
		document.getElementById("findPwdTelDiv").innerText="전화번호를 입력해주세요.";
		document.getElementById("findPwdTel3").focus();
	} else {
		$('#findPwdForm').submit();
	}
}

// 비밀번호 변경
function changePwdCheck() {
	document.getElementById("currentPwdDiv").innerText="";
	document.getElementById("changePwd").innerText="";
	document.getElementById("reChangePwd").innerText="";
	
	if(document.getElementById("currentPwd").value=="") {
		document.getElementById("currentPwdDiv").innerText="현재 비밀번호를 입력해주세요";
		document.getElementById("currentPwd").focus();
	} else if(document.getElementById("changePwd").value=="") {
		document.getElementById("changePwdDiv").innerText="새 비밀번호를 입력해주세요";
		document.getElementById("changePwd").focus();
	} else if(document.getElementById("changePwd").value!=document.getElementById("reChangePwd").value) {
		document.getElementById("reChangePwdDiv").innerText="위의 비밀번호와 일치하지 않습니다.";
		document.getElementById("reChangePwd").focus();
	} else {
		document.changePwdForm.submit();
	}
		
}

//---------------------------------------------------------------------------------------
//index.jsp 
//imgSlide
var img = 0;
function imgSlide(num) {
	if(num == 0) {img = img - 100;}
	else if(num == 1) {img = img + 100;}
	else {alert("이상함");}
	
	document.getElementById("imgList").setAttribute("style", "margin-left: " + img + "%;");
	
}