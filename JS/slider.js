const slider = document.getElementById("sliderTrack");
const slides = document.querySelectorAll(".slides");
let slideIndex = 0;
let intervelId = null;

document.addEventListener("DOMContentLoaded", initializeSlider);

function initializeSlider() {
  if (slides.length > 0) {
    intervelId = setInterval(nextSlide, 4000);
  }

  document.getElementById("next").addEventListener("click", () => {
    clearInterval(intervelId);
    nextSlide();
    intervelId = setInterval(nextSlide, 4000);
  });

  document.getElementById("prev").addEventListener("click", () => {
    clearInterval(intervelId);
    prevSlide();
    intervelId = setInterval(nextSlide, 4000);
  });

  // Swipe support
  let startX = 0;
  let endX = 0;

  slider.addEventListener("touchstart", (e) => {
    startX = e.touches[0].clientX;
  });

  slider.addEventListener("touchend", (e) => {
    endX = e.changedTouches[0].clientX;
    handleSwipe();
  });

  function handleSwipe() {
    const diff = startX - endX;
    if (Math.abs(diff) > 50) {
      if (diff > 0) nextSlide();
      else prevSlide();
    }
  }
}

function showSlide(index) {
  if (index >= slides.length) {
    slideIndex = 0;
  } else if (index < 0) {
    slideIndex = slides.length - 1;
  } else {
    slideIndex = index;
  }

  slider.style.transform = `translateX(-${slideIndex * 100}%)`;
}

function prevSlide() {
  slideIndex--;
  showSlide(slideIndex);
}

function nextSlide() {
  slideIndex++;
  showSlide(slideIndex);
}