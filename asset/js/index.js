/*
Create: Cao Thành Named
Date: 20/10/2023
Note: hiện ra 2 nút thêm vào giở hàng và xem chi tiết sản phẩm
*/

function _hoverChangeProductImg() {
  var elementProduct = document.querySelectorAll(".product");
  var elementProductFooter = document.querySelectorAll(".product_btn");

  elementProduct.forEach(function (value, index) {
    var elementProductBtn = value.querySelectorAll(".product_btn .a");

    value.onmouseover = function () {
      elementProductBtn[0].classList.replace(
        "product_btn-add_card_none",
        "product_btn-add_card"
      );
      elementProductBtn[1].classList.replace(
        "product_btn--product_detail_none",
        "product_btn--product_detail"
      );
    };

    value.onmouseout = function () {
      elementProductBtn[0].classList.replace(
        "product_btn-add_card",
        "product_btn-add_card_none"
      );
      elementProductBtn[1].classList.replace(
        "product_btn--product_detail",
        "product_btn--product_detail_none"
      );
    };
  });
}

/*
Create: Cao Thành Named
Date: 19/10/2023
Note: nếu ấn vào wishlist thì sản phẩm được thêm vào wishlist
*/

var elementHeartIcon = document.querySelectorAll(".product_in4_wishlist");
function _addWishList() {
  elementHeartIcon.forEach(function (value) {
    value.onclick = function () {
      value.classList.toggle("add_wish_list");
      var quantity = parseInt(elemmentQuantityWishList.innerText);

      if(value.classList.contains("add_wish_list")){
        quantity += 1;
      }
      else{
        quantity -= 1;
      }

      elemmentQuantityWishList.innerHTML = quantity;
    };
  });
}

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

var elementAddCard = document.querySelectorAll(".product_btn button");
var elemmentQuantity = document.querySelector(".header_cart_amount_product");

function _addToCard() {
  elementAddCard.forEach(function (value) {
    value.onclick = function () {
      var elementImgProduct =
        value.parentElement.parentElement.querySelector(".fly_to_card");
      elementImgProduct.classList.add("animation_add_to_card");

      elemmentQuantity.innerHTML =
        parseInt(elemmentQuantity.innerText) + 1 + "";

      setTimeout(function () {
        elementImgProduct.classList.remove("animation_add_to_card");
      }, 800);
    };
  });
}
