document.addEventListener("DOMContentLoaded", function () {
  _setAllWishList();
  _removeWishList();
  _continueBuyProduct();
});

var elementHeart = document.querySelectorAll(".product_in4_wishlist i");
var elementProduct = document.querySelectorAll(".product");

/*
create: Cao Thành Nam
phương thức set tất cả sản phẩm đều yêu thích
 */
var count = 0;
function _setAllWishList() {
  elementHeart.forEach(function (value) {
    value.style.color = "red";
    count++;
  });
}

/*
create: Cao Thành Nam
phương thức xóa những sản phẩm không được yêu thích
 */
function _removeWishList() {
  elementHeart.forEach(function (value, index) {
    value.onclick = function () {
      elementProduct[index].remove();
      count--;
      _continueBuyProduct();
    };
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

/*
create: Cao Thành Nam
phương thức hiện thông báo tiếp tục mua hàng sau khi đã xóa hết sản phẩm yêu thích
 */
function _continueBuyProduct() {
  if (count == 0) {
    document.querySelector(".cart_body-empty").classList.add("active");
    document.querySelector(".new_page").classList.add("unactive");
    document.querySelector(".product_list h2").classList.add("unactive")
  }
}
