document.addEventListener("DOMContentLoaded", function () {
  _setAllWishList();
  _removeWishList();
  _continueBuyProduct();
});

var elementHeart = document.querySelectorAll(".alway_wishlist");
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


/*
create: Cao Thành Nam
phương thức hiện thông báo tiếp tục mua hàng sau khi đã xóa hết sản phẩm yêu thích
 */
function _continueBuyProduct() {
  if (count == 0) {
    document.querySelector(".cart_body-empty").classList.add("active");
    document.querySelector(".product_list_wishlist  h2").classList.add("unactive")
  }
}