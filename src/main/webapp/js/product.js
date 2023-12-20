document.addEventListener("DOMContentLoaded", function() {
	if (document.querySelector(".category_product")) {
		_clickPrice();
		_clickBrand();
		_checkChoiceBrand();
		_clickOutsideFilter();
	}
	_eventChangeStateIconheart();
	_changePage();
	_setStateWishlisted();
});


/* Create: Cao Thành Nam
phương thức hiện bộ lọc cho giá khi ấn vào
khi ấn vào sort theo giá sẽ hiện và tắt sort theo brand
*/
function _clickPrice() {
	elementPriceOptionList.onclick = function() {
		_turnOnPrice(
			elementPriceOptionList,
			elementPriceOptionListChild,
			elementPriceIconDown
		);
	};
}

/* Create: Cao Thành Nam
phương thức hiện bộ lọc cho brand khi ấn vào
khi ấn vào sort theo brand sẽ hiện và tắt sort theo giá
*/
function _clickBrand() {
	elementBrandOptionList.onclick = function() {
		_turnOnBrand(
			elementBrandOptionList,
			elementBrandOptionListChild,
			elementBrandIconDown
		);
	};
}

/* Create: Cao Thành Nam
phương thức tắt sort theo giá
*/
function _turnOffPrice(price, priceChild, icon) {
	price.classList.remove("border_option_list");
	priceChild.classList.remove("active");
	icon.classList.remove("rotate_icon");
}

/* Create: Cao Thành Nam
phương thức hiện sort theo giá
*/
function _turnOnPrice(price, priceChild, icon) {
	price.classList.toggle("border_option_list");
	priceChild.classList.toggle("active");
	icon.classList.toggle("rotate_icon");

	elementModalOverlayOpacity.classList.toggle("active");

}

/* Create: Cao Thành Nam
phương thức tắt sort theo brand
*/
function _turnOffBrand(brand, brandChild, icon) {
	brand.classList.remove("border_option_list");

	brandChild.classList.remove("active_filter");

	icon.classList.remove("rotate_icon");
}

/* Create: Cao Thành Nam
phương thức hiện sort theo brand
*/
function _turnOnBrand(brand, brandChild, icon) {
	brand.classList.toggle("border_option_list");
	brandChild.classList.toggle("active_filter");
	icon.classList.toggle("rotate_icon");
	elementModalOverlayOpacity.classList.toggle("active");
}

/* Create: Cao Thành Nam
phương thức này khi ấn vào bất kỳ chỗ nào trên trang thì bộ lọc sẽ tắt
*/
function _clickOutsideFilter() {
	elementModalOverlayOpacity.onclick = function() {
		_turnOffBrand(
			elementBrandOptionList,
			elementBrandOptionListChild,
			elementBrandIconDown
		);
		_turnOffPrice(
			elementPriceOptionList,
			elementPriceOptionListChild,
			elementPriceIconDown
		);
		elementModalOverlayOpacity.classList.remove("active");
	}

}

/* Create: Cao Thành Nam
phương thức này khi ấn vào trang mới thì trang cũ sẽ không đc avtive
*/

function _refreshPageItem() {
	elementNewPageItem.forEach(function(value) {
		value.classList.remove("padding_down");
		value.classList.remove("choose_page_item");
	});
}

/* Create: Cao Thành Nam
phương thức ấn chuyển trang sẽ được avtive
*/
function _changePage() {
	elementNewPageItem.forEach(function(value) {
		value.onclick = function() {
			_refreshPageItem();
			value.classList.add("padding_down");
			value.classList.add("choose_page_item");
		};
	});
}

/*
Create: Cao Thành Nam
Date: 19/10/2023
Note: nếu ấn vào icon yêu thích thì sẽ đổi sang màu đỏ
*/
function _eventChangeStateIconheart() {
	elementNoWishlist.forEach(function(value) {
		value.onclick = function() {
			value.classList.toggle("wishlisted");
			value.classList.toggle("no_wishlist");
		}
	})
}

/*
create: Cao Thành Nam
phương thức set trái tim màu đỏ khi thêm vào danh sách yêu thích
 */
function _setStateWishlisted() {
	elementNoWishlist.forEach(function(valueNoWishlist) {
		var idNoWishlist = valueNoWishlist.getAttribute("id");
		elementWishlist.forEach(function(valueWishlisted) {
			var idWishlist = valueWishlisted.getAttribute("id");

			if (idNoWishlist === idWishlist) {
				valueNoWishlist.classList.add("wishlisted");
			}
		})
	})
}


/* Create: Cao Thành Nam
phương thức này khi chọn thương hiệu nào thì sẽ border hình ảnh của thương hiệu đó
*/
function _checkChoiceBrand() {
	var brands = elementSetBrand.innerText.split(', ');
	brands.forEach(function(nameBrand) {
		elementBrandOptionListItemImg.forEach(function(brandImg) {
			if (nameBrand === brandImg.getAttribute("id")) {
				brandImg.classList.toggle("choose_page_item")
			}
		})
	})
}

var elementModalOverlayOpacity = document.querySelector('.modal_overlay_filter_opacity');
var elementSetBrand = document.querySelector(
	".category_brand_option_default"
);

var elementNoWishlist = document.querySelectorAll(".no_wishlist");
var elementWishlist = document.querySelectorAll(".remove_one");
var elementPriceOptionListChildItem = document.querySelectorAll(
	".category_price_option_list .category_price_option_item ul li"
);

var elementShowChoose = document.querySelector(
	".category_price_option_default"
);
var elementBrandOptionListItemImg = document.querySelectorAll(
	".category_brand_option_item_img"
);
var elementBrandOptionListItem = document.querySelectorAll(
	".category_brand_option_list .category_brand_option_item ul label"
);

var elementNewPageItem = document.querySelectorAll(".new_page_item");
var elementPriceOptionList = document.querySelector(
	".category_price_option_list"
);

var elementPriceOptionListChild = document.querySelector(
	".category_price_option_list .category_price_option_item ul"
);

var elementPriceIconDown = document.querySelector(
	".category_price_option_list .category_all_item_icon"
);

var elementBrandOptionList = document.querySelector(
	".category_brand_option_list"
);

var elementBrandOptionListChild = document.querySelector(
	".category_brand_option_list .category_brand_option_item ul"
);

var elementBrandIconDown = document.querySelector(
	".category_brand_option_list .category_all_item_icon"
);