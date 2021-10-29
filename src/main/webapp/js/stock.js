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
	if(!$('#colorSelect > option:selected').val()||$('#sizeSelect > option:selected').val()=='none'){
		alert("상품을 선택해주세요");
	}else{
		$('#stockToCart').submit();
	}
	

});



