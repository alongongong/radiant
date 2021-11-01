//이미지 슬라이드

const prev = document.querySelector('.prev');
const next = document.querySelector('.next');
const images = document.querySelector('.carousel').children;
const totalImages = images.length;
let index = 0;

prev.addEventListener('click', () => {
  nextImage('next');
})

next.addEventListener('click', () => {
  nextImage('prev');
})

function nextImage(direction) {
  if(direction == 'next') {
    index++;
    if(index == totalImages) {
      index = 0;
    }
  } else {
    if(index == 0) {
      index = totalImages - 1;
    } else {
      index--;
    }
  }

  for(let i = 0; i < images.length; i++) {
    images[i].classList.remove('main');
  }
  images[index].classList.add('main');
}

// 컬러 셀렉 박스 선택


//장바구니 
$('#mycartBtn').click(function(){
	if(document.querySelector('.exec > div') == null){
		alert("상품을 선택해주세요");
	}else{
		var i = parseInt($('.exec #i').val());
		var color='';
		var outcount='';
		for(j=0; j<i; j++) {
			color += '&color'+j+'=';
			color += $('.exec #color'+j).val();
			
			outcount += '&outcount' + j + '=';
			outcount += $('.outcount:eq(' + j +')').text();
		}
		location.href='/radiant/cart/cart.do?mainFileList='+$('#mainFileList').val()+color+ outcount +'&i='+i;
	}
});

//상품선택추가div
var i=0;
$('form div select').change(function() {
	if($('#colorSelect').val() != 'null' && $('#sizeSelect').val() != 'none') {
		if(document.querySelector('input[value=' + $('#colorSelect').val() + ']') == null) {
			$('.exec').append($('<div>'))
			$('.exec > div').append($('<div>', {
				align: 'left',
				class: 'colorSize'
			}).append($('<span>', {
				text: $('#colorSelect').val() + ' / ' + $('#sizeSelect').val()
			})));
			$('.exec > div').append($('<input>',{
				type: 'hidden',
				id: 'color'+i,
				name: 'color',
				value: $('#colorSelect').val()
			}))
			$('.exec > div').append($('<div>',{ 
				margin: '10px',
				class: 'amount'
			}).append($('<input>',{
				type: 'button',
				class: 'minus',
				value: '<'
			})).append($('<span>',{
				class: 'outcount',
				text: 1
			})).append($('<input>',{
				type: 'button',
				class: 'plus',
				value: '>'
			}))).append($('<br>'));
			i++;
			$('.exec #i').val(i);
			
		} else {alert('이미 선택된 옵션입니다.');}
		
		$('#colorSelect').val('null');
		$('#sizeSelect').val('none');

		$('.exec > div:gt(0)').remove();
	}

});

$(document).on('click', '.plus', function() {
	var start = $(this).prev().text();
	var num = Number(start);
	
	num++;
	$(this).prev().text(num);
});

$(document).on('click', '.minus', function() {
	var start = $(this).next().text();
	var num = Number(start);
	
	if(num<=1){
			num = 1;
	}else {
		num--;		
	}
	
	$(this).next().text(num);
});




