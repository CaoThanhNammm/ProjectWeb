document.addEventListener("DOMContentLoaded", function () {
  _continueBuyProduct();
  _removeOneWishlisted();
});


/*
create: Cao Thành Nam
phương thức hiện thông báo tiếp tục mua hàng sau khi đã xóa hết sản phẩm yêu thích
 */
function _continueBuyProduct() {
  if (elementWishlisted.length == 0) {
    document.querySelector(".cart_body-empty").classList.add("active");
    document.querySelector(".product_list_wishlist  h2").classList.add("unactive")
  }
}

/*
create: Cao Thành Nam
phương thức xóa sản phẩm yêu thích khi ấn vào trái tim
 */
function _removeOneWishlisted(){
	elementWishlisted.forEach(function(value) {
		value.onclick = function() {
			elementModalOverlayConfirm.style.display = 'flex';
			idRemoveOne = value.getAttribute("id");
			console.log(idRemoveOne)
			elementTextRemoveOne.classList.add("active");
			elementTextRemoveAll.classList.remove("active");
			_requestRemoveOne();
		}
	})
}

var elementWishlisted = document.querySelectorAll(".wishlisted");