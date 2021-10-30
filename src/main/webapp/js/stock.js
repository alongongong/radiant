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
		$('#stockToCart').submit();
	}
	

});

//상품선택추가div
$('form div select').change(function() {
   if($('#colorSelect').val() != 'null' && $('#sizeSelect').val() != 'none') {
      $('.exec').append($('<div>'))
      $('.exec > div').append($('<div>', {
         align: 'left',
         background: 'red'
      }).append($('<span>', {
         text: $('#colorSelect').val() + ' / ' + $('#sizeSelect').val()
      })));
      $('.exec > div').append($('<input>',{
         type: 'hidden',
         id: 'color',
		 name:'color',
         value: $('#colorSelect').val()
      }))
      $('.exec > div').append($('<div>',{background: 'blue'}).append($('<input>',{
         type: 'button',
         value: '삭제'
      })).append($('<span>',{
         text: 22
      })).append($('<input>',{
         type: 'button',
         value: '추가'
      })));
      $('#colorSelect').val('null');
      $('#sizeSelect').val('none');

      $('.exec > div:gt(0)').remove();
   }
});



