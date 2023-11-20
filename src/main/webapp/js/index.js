document.addEventListener("DOMContentLoaded", function () {
  if (elementSlider) {
    _moveLeft();
    _moveRight();
    _clickDot();
    _autoSlider();
  }
});

var elementSlider = document.querySelector(".slider");

var active = 0;
var elementImgItem = document.querySelectorAll(".slider_img_item");
var elementImgList = document.querySelector(".slider_img_list");
var length = elementImgItem.length;
var elementLeft = document.querySelector(".left");
var elementRight = document.querySelector(".right");

var elementDot = document.querySelectorAll(".slider_dot_item");

function _moveLeft() {
  elementLeft.onclick = function () {
    if (active === 0) {
      active = length;
    }
    active--;
    _reloadSlider();
  };
}

function _moveRight() {
  elementRight.onclick = function () {
    if (active === length - 1) {
      active = -1;
    }
    active++;
    _reloadSlider();
  };
}

function _autoSlider() {
  setInterval(function () {
    elementRight.click();
  }, 5000);
}

function _reloadSlider() {
  var checkLeft = elementImgItem[active].offsetLeft;
  elementImgList.style.left = -checkLeft + "px";

  var elementLastDotActive = document.querySelector(
    ".slider_dot_item.background_dot_slider-active"
  );
  elementLastDotActive.classList.remove("background_dot_slider-active");
  elementDot[active].classList.add("background_dot_slider-active");
}

function _clickDot() {
  elementDot.forEach(function (value, index) {
    value.addEventListener("click", function () {
      active = index;
      _reloadSlider();
    });
  });
}
