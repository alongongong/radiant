// 파일첨부
function qnaAttachedFileName() {
	var file_name = document.getElementById("qnaAttachedFile").value;
	document.getElementById("upload-name").value = file_name;
}

// Q&A 글쓰기 유효성 검사
function qnaWriteCheck() {
	document.getElementById("qnaSubjectDiv").innerText="";
	document.getElementById("qnaContentDiv").innerText="";
	
	if(document.qnaWriteForm.qnaSubject.value == "") {
		document.getElementById("qnaSubjectDiv").innerText="제목을 입력해주세요.";
		document.getElementById("qnaSubject").focus();
	} else if(document.qnaWriteForm.qnaContent.value == "") {
		document.getElementById("qnaContentDiv").innerText="내용을 입력해주세요.";
		document.getElementById("qnaContent").focus();
	} else {
		document.qnaWriteForm.submit();
	}
}

// Q&A 제목 누르면 글 내용 나오게.
$(function(){
	$('.qnaSubject').click(function(){
		if($(this).parent().parent().next().hasClass('qnaContent1')) {
			$(this).parent().parent().next().removeClass('qnaContent1');
			$(this).parent().parent().next().addClass('qnaContent2');
		} else {
			$(this).parent().parent().next().removeClass('qnaContent2');
			$(this).parent().parent().next().addClass('qnaContent1');
		}
		return false;
	});
});