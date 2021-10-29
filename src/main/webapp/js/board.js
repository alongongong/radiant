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

// Q&A 수정하기 유효성 검사
function qnaUpdateCheck() {
	document.getElementById("qnaSubjectDiv").innerText="";
	document.getElementById("qnaContentDiv").innerText="";
	
	if(document.qnaUpdateForm.qnaSubject.value == "") {
		document.getElementById("qnaSubjectDiv").innerText="제목을 입력해주세요.";
		document.getElementById("qnaSubject").focus();
	} else if(document.qnaUpdateForm.qnaContent.value == "") {
		document.getElementById("qnaContentDiv").innerText="내용을 입력해주세요.";
		document.getElementById("qnaContent").focus();
	} else {
		document.qnaUpdateForm.submit();
	}
}

// Q&A 수정하기 취소 버튼
function qnaUpdateCancel() {
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
	
	// 게시글 삭제
	$('.boardDeleteBtn').click(function(){
		var boardSeq = $(this).parents('tr').prev().find('td:eq(0)').text();
		var url = "/radiant/board/qnaDelete.do";
		$.get(url, {'boardSeq':boardSeq}, function(data){
			alert("게시글이 삭제되었습니다.");
			location.href="/radiant/board/qnaList.do?pg=1";
		}).fail(function(){
			alert("오류가 발생했습니다. 잠시 후에 다시 시도해주세요.");
		});
	})
	
	// 댓글달기 버튼
	$('.commentBtn').click(function(){
		var boardSeq = $(this).next().val();
		$('#boardSeq').val(boardSeq);
		$.ajax({
			url: '/radiant/board/commentWrite.do',
			type: 'post',
			data: $('#qnaListForm').serialize(),
			dataType: 'xml',
			success: function(data){
				var result = eval($(data).find('result').text());
				  
				
				var commentSeq = $(data).find('commentnum').text();
				var boardSeq = $(data).find('boardnum').text();
				var writer = $(data).find('writer').text();
				var content = $(data).find('content').text();
				var datetime = $(data).find('datetime').text();
				  
				addComment(commentSeq, boardSeq, writer, content, datetime);
				
				$('textarea[name="commentText'+boardSeq+'"]').val('');
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			/*statusCode: { 404: function() { //to do 
				location.href="/radiant/board/qnaList.do?pg=1";
				} 
			}*/

		}); // ajax
	}); // click 이벤트
	
	// 댓글 수정 버튼
	$(document).on('click','.commentUpdateBtn', function(){
		var commentSeq = $(this).parents('.commentView').val();
		var target = $(this).parent().next().find('.content_p');
		var content = target.text();
		content = content.trim();
		target.html('');
		$('<textarea>', {
			text: content,
			id: 'commentUpText',
			rows: '3',
			cols: '103'
		}).appendTo(target);
		$('<input>',{
			type: 'button',
			class: 'commentUpBtn',
			value: '수정',
			disabled: 'true'
		}).appendTo(target);
		
		$('#commentUpText').change(function(){
			$('.commentUpBtn').prop('disabled','');
		});
		
		$('.commentUpBtn').click(function(){
			$.ajax({
				url: '/radiant/board/commentUpdate.do',
				type: 'post',
				data: 'commentSeq=' + commentSeq + '&commentContent=' + $('#commentUpText').val(),
				success: function(data) {
					var commentUpText = $('#commentUpText').val();
					$('#commentUpText').remove();
					$(this).remove();
					target.text(commentUpText);
				},
				error: function(err) {
					console.log(err);
				}
			});
		});
	});

	// 댓글 삭제 버튼
	$(document).on('click', '.commentDeleteBtn', function(){
		if(confirm('선택하신 댓글을 삭제하시겠습니까?')){
			var commentSeq = $(this).parents('.commentView').val();
			var target = $(this).parents('.commentView');
			
			var url = "/radiant/board/commentDelete.do";
			$.post(url, {'commentSeq': commentSeq}, function(){
				target.remove();
			}).fail(function(){
				alert("댓글을 삭제하는데 실패했습니다. 잠시 후에 다시 시도해주세요.")
			});
		}
	});

});

// 새 댓글 추가
function addComment(commentSeq, boardSeq, writer, content, datetime) {
	var new_li = $('<li>');
	new_li.attr('data-num', commentSeq);
	new_li.attr('style', 'border-top: 1px dotted #999; border-collapse: collapse;')
	new_li.addClass('commentView');
	
	var writer_p = $('<p>');
	writer_p.addClass('writer');
	var name_span = $('<span>');
	name_span.addClass('name');
	name_span.html(writer);
	
	var date_span = $('<font size="2" color="lightgray">');
	date_span.html('&emsp;&emsp;' + datetime + '&emsp;');
	
	var up_input = $('<input>');
	up_input.attr({
		'type' : 'button',
		'value' : '수정',
		'class' : 'commentUpdateBtn'
	})
	
	var del_input = $('<input>');
	del_input.attr({
		'type' : 'button',
		'value': '삭제'
	})
	del_input.addClass('commentDeleteBtn');
	
	var content_p = $('<p>');
	content_p.html(content);
	content_p.addClass('content_p')
	
	writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
	new_li.append(writer_p).append(content_p);
	$('#comment_list'+boardSeq).append(new_li);
}
