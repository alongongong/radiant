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

// Q&A 글쓰기 취소 버튼
function qnaWriteCancel() {
	cancel = confirm("정말 종료하시겠습니까?");
	if(!cancel) {
		return false;
	} else {
		location.href="/radiant/board/qnaList.do?pg=1";
	}
}


// Q&A 제목 누르면 글 내용 나오게.(제이쿼리)
$(function(){
	$('.qnaSubject').click(function(){
		if($(this).parent().parent().next().hasClass('qnaContent1')) {
			$(this).parent().parent().next().removeClass('qnaContent1');
			$(this).parent().parent().next().addClass('qnaContent2');
			$(this).parent().parent().next().next().removeClass('qnaComment1');
			$(this).parent().parent().next().next().addClass('qnaComment2');
		} else {
			$(this).parent().parent().next().removeClass('qnaContent2');
			$(this).parent().parent().next().addClass('qnaContent1');
			$(this).parent().parent().next().next().removeClass('qnaComment2');
			$(this).parent().parent().next().next().addClass('qnaComment1');
		}
		return false;
	});
	
	$('.commentBtn').click(function(){
		alert("qsasf");
		$.ajax({
			url: '/radiant/board/commentWrite.do',
			type: 'post',
			data: $('#qnaListForm').serialize(),
			dataType: 'xml',
			success: function(data){
			/*var result = eval($(data).find('result').text());
			  
			
			var commentSeq = $(data).fint('commentnum').text();
			var boardSeq = $(data).find('boardnum').text();
			var writer = $(data).find('writer').text();
			var content = $(data).find('content').text();
			var datetime = $(data).find('datetime').text();
			  
			addComment(commentSeq, boardSeq, writer, content, datetime);*/

			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			statusCode: { 404: function() { //to do 
				location.href="/radiant/board/qnaList.do?pg=1";
			} 
			}

		});
	});

});
/*
function addComment(commentSeq, boardSeq, writer, content, datetime) {
	var new_li = $('<li>');
	new_li.attr('data-num', commentSeq);
	new_li.addClass('comment_item');
	
	var writer_p = $('<p>');
	writer_p.addClass('writer');
	var name_span = $('<span>');
	name_span.addClass('name');
	name_span.html(writer);
	
	var date_span = $('<span>');
	date_span.html(' / ' + datetime + ' ');
	
	var del_input = $('<input>');
	del_input.attr({
		'type': 'button',
		'value': '삭제하기'
	})
	del_input.addClass('delete_btn');
	
	var content_p = $('<p>');
	content_p.html(content);
	
	writer_p.append(name_span).append(date_span).append(del_input);
	new_li.append(writer_p).append(content_p);
	$('#comment_list'+boardSeq).append(new_li);
}*/
