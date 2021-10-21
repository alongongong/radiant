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

/*let sliderImages = document.querySelectorAll(".slide"),
  arrowLeft = document.querySelector("#arrow-left"),
  arrowRight = document.querySelector("#arrow-right"),
  current = 0;
  
// Clear all images
function reset() {
  for (let i = 0; i < sliderImages.length; i++) {
    sliderImages[i].style.display = "none";
  }
}
  
// Initial slide
function startSlide() {
  reset();
  sliderImages[0].style.display = "block";
  
// Show previous
function slideLeft() {
  reset();
  sliderImages[current - 1].style.display = "block";
  current--;
}
  
// Show next
function slideRight() {
  reset();
  sliderImages[current + 1].style.display = "block";
  current++;
}

window.onload = function(){
	// Left arrow click
	arrowLeft.addEventListener("click", function () {
	  if (current === 0) {
	    current = sliderImages.length;
	  }
	  slideLeft();
	});
	  
	// Right arrow click
	arrowRight.addEventListener("click", function () {
	  if (current === sliderImages.length - 1) {
	    current = -1;
	  }
	  slideRight();
	});
};
startSlide();*/