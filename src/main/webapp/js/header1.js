document.addEventListener('DOMContentLoaded', function() {
	_startSlideAllList();
	_clickQuit();
	_clickChildItem();
	_changeStateOfFormFindProduct();
	_showTabProduct();
})

var elementModal = document.querySelector('.modal_overlay');
var elementModalBody = document.querySelector('.modal_body');
var elementIconAllList = document.querySelector('.all_list');
var elementQuitIcon = document.querySelector(".modal_body_quit");
var elementBody = document.querySelector('body');

/*
	Create: Cao Thành Nam
	Date: 22/10/2023
	Note: phương thức xử lý bắt đầu ấn vào tất cả danh mục
*/

function _startSlideAllList() {
	elementIconAllList.onclick = function() {
		_slideLeftToRightAllList();
	}

	elementWistListIcon.onclick = function() {
		_slideRightToLefttAllList();
	}

	elementWistListIconMobile.onclick = function() {
		_slideRightToLefttAllList();
	}
}

/*
	Create: Cao Thành Nam
	Date: 22/10/2023
	Note: phương thức css cho các modal để hiển thị lên màn hình
	phương này là của tất cả danh mục
*/

function _slideLeftToRightAllList() {
	elementModal.classList.toggle("active")
	elementModalBody.style.left = '0';
	elementBody.classList.add('hidden_overflow');
}

/*
	Create: Cao Thành Nam
	Date: 29/10/2023
	Note: phương thức css cho các modal để hiển thị lên màn hình
	phương thức này là của wishlist
*/
function _slideRightToLefttAllList() {
	elementModal.classList.toggle("active")
	elementModalBodyWishList.style.right = '0';
	elementBody.classList.add('hidden_overflow');
}


/*
	Create: Cao Thành Nam
	Date: 22/10/2023
	Note: phương thức xử lý khi băt đầu ấn vào tắt danh mục,
	 ấn vào nút X hoặc nhấn ra ngoài danh mục
*/
function _clickQuit() {
	elementQuitIcon.onclick = function() {
		_quitSlide();
	}
	elementModal.onclick = function() {
		_quitSlide();
	}
	elementQuitIconWishList.onclick = function() {
		_quitSlide();
	}
}

/*
	Create: Cao Thành Nam
	Date: 22/10/2023
	Note: phương thức xử lý để modal tắt khỏi màn hình
*/
function _quitSlide() {
	elementModal.classList.remove("active")
	elementModalBody.style.left = -$(elementModalBody).width() + "px";
	elementBody.classList.remove('hidden_overflow');
	elementModalBodyWishList.style.right = -$(elementModalBodyWishList).width() + "px";

	setTimeout(function() {
		elementCategoryItem.forEach(function(value, index) {
			_resetSlide(index);
		})
	}, 350);
}

var elementCategoryItem = document.querySelectorAll(".category_all_item");
var elementCategoryChildItem = document.querySelectorAll(".category_all_item_child_list");
var elementIconDown = document.querySelectorAll(".category_all_item_icon");

/*
	Create: Cao Thành Nam
	Date: 22/10/2023
	Note: phương thức reset lại modal trở về vị trí ban đầu
*/
function _resetSlide(index) {
	elementCategoryChildItem[index].classList.replace('active', 'unactive');
	elementIconDown[index].classList.replace('icon_up_rotate', 'icon_down_rotate');
	elementCategoryItem[index].classList.remove('category_all_item_border-none');
}


/*
	Create: Cao Thành Nam
	Date: 22/10/2023
	Note: phương thức xử lý khi ấn vào từng item sẽ hiện lên item con
*/
function _clickChildItem() {
	elementCategoryItem.forEach(function(value, index) {
		value.onclick = function() {
			value.classList.toggle("category_all_item_border-none");
			elementCategoryChildItem[index].classList.toggle('active');
			elementCategoryChildItem[index].classList.remove('unactive');
			elementIconDown[index].classList.toggle('icon_up_rotate');
		}
	});
}

/*
	Create: Cao Thành Nam
	Date: 29/11/2023
	Note: phương thức thay đổi tên thẻ cha nhưng vẫn giữ các thẻ con
*/
function _renameParentElement(oldParentId, newTagName) {
	// Lấy phần tử cha cũ
	var oldParent = document.querySelector("." + oldParentId);

	// Tạo một phần tử cha mới với tên mới
	var newParent = document.createElement(newTagName);
	newParent.classList.add(oldParentId);

	if (newTagName === "form") {
		newParent.setAttribute("action", "../html/FindProduct?currentPage=1");
		newParent.setAttribute("method", "POST");
		newParent.classList.add("available");
	}

	// Di chuyển tất cả các phần tử con từ phần tử cha cũ sang phần tử cha mới
	while (oldParent.firstChild) {
		newParent.appendChild(oldParent.firstChild);
	}

	// Thay thế phần tử cha cũ bằng phần tử cha mới
	oldParent.parentNode.replaceChild(newParent, oldParent);
}

/*
	Create: Cao Thành Nam
	Date: 29/11/2023
	Note: phương thức chặn thao tác ấn của người dùng khi chưa nhập tên sản phẩm
*/
function _changeStateOfFormFindProduct() {
	elementInput.onchange = function(e) {
		if (e.target.value !== "") {
			_renameParentElement("header_search", "form");
		}
		else {
			_renameParentElement("header_search", "div");
		}
	}
}


/*
	Create: Cao Thành Nam
	Date: 29/11/2023
	Note: phương thức hiện ra những sản phẩm cùng tên
*/
function _showTabProduct() {
	elementInput.oninput = function(e) {
		var data = e.target.value;
		if (data !== "") {
			elementTabProducts.classList.replace("unactive", "active_tab_product");
			_removeAllChild();
			_showProductSuggestion(data);
		}
		else {
			elementTabProducts.classList.replace("active_tab_product", "unactive");
		}
	}
}

function _showProductSuggestion(nameProduct) {
	var productsByString = httpGet("http://localhost:8080/Final/ProductSuggestionService?nameProduct=" + nameProduct);
	var productsByArray = JSON.parse(productsByString);
	
	productsByArray.forEach(function(value) {
		var elementSuggestion = document.createElement("a");
		elementSuggestion.classList.add("products_suggestion_item");
		elementSuggestion.setAttribute("href", "../html/FindProduct?currentPage=1&nameProduct=" + value.name);
		elementSuggestion.innerText = value.name;
		elementTabProducts.appendChild(elementSuggestion);
	})
}

function _removeAllChild() {
	var elementItemSuggestion = document.querySelectorAll(".products_suggestion_item");
	elementItemSuggestion.forEach(function(value) {
		elementTabProducts.removeChild(value);
	})
}

var elementTabProducts = document.querySelector(".tab_suggestion_products");
var elementInput = document.querySelector(".search");
var elementWistListIcon = document.querySelector(".list_wishList");
var elementWistListIconMobile = document.querySelector(".list_wishList--mobile");
var elementModalBodyWishList = document.querySelector(".modal_body_wishList");
var elementQuitIconWishList = document.querySelector(".modal_body_quit_wishlist");

var elemmentQuantity = document.querySelector(".header_cart_amount_product");

var elemmentQuantityWishListMobile = document.querySelector(".list_wishList--mobile .amount_wishlist");
var elemmentQuantityWishList = document.querySelector(".list_wishList .amount_wishlist");


function _removeSuggestion(nameProduct) {
	suggestIsValid.filter(function(value) {
		return value.name !== nameProduct;
	})
}

function httpGet(theUrl) {
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.open("GET", theUrl, false);
	xmlHttp.send(null);
	return xmlHttp.responseText;
}




