$(function() {
	$('.paymentImg').click(function(){
		if($(this).attr('data-num')=='0') {
			$(this).attr('data-num','1');
			$(this).not(this).attr('data-num','0');
		} else {
			$(this).attr('data-num','0');
		}
		click();
	});
});

function click() {
	if($('.paymentImg').attr('data-num')=='1') {
		alert("ass");
		var alt = $(this).prop('alt');
		$(this).prop('src', '/radiant/img/payment/'+alt+'_check.png');
	} else {
		var alt = $(this).prop('alt');
		$(this).prop('src', '/radiant/img/payment/'+alt+'.png');
	}
}