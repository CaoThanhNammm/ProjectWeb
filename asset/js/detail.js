// JavaScript cho phần hình ảnh
function _imageSlider() {
  var images = document.querySelectorAll(".slider_image");
  var mainImage = document.querySelector(".slider_main img");

  images.forEach((image, index) => {
    image.addEventListener("click", () => {
      images.forEach((img) => img.classList.remove("active"));
      image.classList.add("active");
      mainImage.src = image.src;
    });
  });
}
function _refreshPageItem() {
  elementNewPageItem.forEach(function (value) {
    value.classList.remove("padding_down");
    value.classList.remove("choose_page_item");
  });
}

var elementNewPageItem = document.querySelectorAll(".new_page_item");
function _changePage() {
  elementNewPageItem.forEach(function (value) {
    value.onclick = function () {
      _refreshPageItem();
      value.classList.add("padding_down");
      value.classList.add("choose_page_item");
    };
  });
}

_imageSlider();
