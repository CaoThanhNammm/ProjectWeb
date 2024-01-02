document.addEventListener("DOMContentLoaded", function() {
	if (document.querySelector(".category_product")) {
		_clickPrice();
		_clickBrand();
		_checkChoiceBrand();
		_clickOutsideFilter();
		_stateRangePrice();
		_stateInputPrice();
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
	price.classList.add("border_option_list");
	priceChild.classList.add("active");
	icon.classList.add("rotate_icon");
	elementModalOverlayOpacity.classList.add("active");

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
	brand.classList.add("border_option_list");
	brandChild.classList.add("active_filter");
	icon.classList.add("rotate_icon");
	elementModalOverlayOpacity.classList.add("active");
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
		elementBrandOptionListItem.forEach(function(brandImg) {
			if (nameBrand === brandImg.getAttribute("id")) {
				brandImg.classList.toggle("choose_page_item")
			}
		})
	})
}


/* Create: Cao Thành Nam
phương thức này set giá trị của input min khi nút trượt min di chuyển đồng thời set trạng thái progess
*/
function _slideMin() {
	var gap = parseInt(elementRangeMax.value) - parseInt(elementRangeMin.value);
	if (gap <= minGap) {
		elementRangeMin.value = parseInt(elementRangeMax.value) - minGap
	}
	elementPriceInputMin.value = elementRangeMin.value;
	_setArea();
}

/* Create: Cao Thành Nam
phương thức này set giá trị của input max khi nút trượt max di chuyển đồng thời set trạng thái progess
*/
function _slideMax() {
	var gap = parseInt(elementRangeMax.value) - parseInt(elementRangeMin.value);

	if (gap <= minGap) {
		elementRangeMax.value = parseInt(elementRangeMin.value) + minGap
	}

	elementPriceInputMax.value = elementRangeMax.value;
	_setArea();
}

/* Create: Cao Thành Nam
phương thức này set thanh progress khi trượt
*/
function _setArea() {
	var sliderMinValue = elementRangeMin.min;
	var sliderMaxValue = elementRangeMax.max;
	elementProgress.style.left = ((elementRangeMin.value - sliderMinValue) / (sliderMaxValue - sliderMinValue)) * 100 + "%"
	elementProgress.style.right = 100 - ((elementRangeMax.value - sliderMinValue) / (sliderMaxValue - sliderMinValue)) * 100 + "%";
}

/* Create: Cao Thành Nam
phương thức này thực hiện các thao tác khi trượt nút trượt
*/
function _stateRangePrice() {
	var sliderMinValue = elementRangeMin.min;
	var sliderMaxValue = elementRangeMax.max;
	elementProgress.style.left = ((elementRangeMin.value - sliderMinValue) / (sliderMaxValue - sliderMinValue)) * 100 + "%"
	elementProgress.style.right = 100 - ((elementRangeMax.value - sliderMinValue) / (sliderMaxValue - sliderMinValue)) * 100 + "%";
	elementRangeMin.oninput = function() {
		_slideMin();
	}
	elementRangeMax.oninput = function() {
		_slideMax();
	}
}

/* Create: Cao Thành Nam
phương thức này set trạng thái cho nút trượt min khi input thay đổi
*/
function _slideMinInput() {
	var maxPrice = parseInt(elementPriceInputMax.value);
	var minPrice = parseInt(elementPriceInputMin.value);
	if (minPrice > maxPrice) {
		elementRangeMin.value = maxPrice;
	}
	else {
		elementRangeMin.value = minPrice;
	}
	_setArea();
}

/* Create: Cao Thành Nam
phương thức này set trạng thái cho nút trượt max khi input thay đổi
*/
function _slideMaxInput() {
	var maxPrice = parseInt(elementPriceInputMax.value);
	var minPrice = parseInt(elementPriceInputMin.value);

	if (maxPrice < minPrice) {
		elementRangeMax.value = minPrice;
	}
	else {
		elementRangeMax.value = maxPrice;
	}
	_setArea();
}



/* Create: Cao Thành Nam
phương thức này thực hiện các thao tác khi input thay đổi phần filter trong khoảng giá
*/
function _stateInputPrice() {
	elementPriceInputMin.oninput = function() {
		_slideMinInput();
	}
	elementPriceInputMax.oninput = function() {
		_slideMaxInput();
	}
}

var elementPriceInputMin = document.querySelector(".price_input_left-min");
var elementPriceInputMax = document.querySelector(".price_input_right-max");
var elementRangeMin = document.querySelector(".range_min");
var elementRangeMax = document.querySelector(".range_max");

var elementProgress = document.querySelector(".slider_price_progress");
var minGap = 0;


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
var elementBrandOptionListItem = document.querySelectorAll(
	".category_brand_option_list .category_brand_option_item ul li"
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