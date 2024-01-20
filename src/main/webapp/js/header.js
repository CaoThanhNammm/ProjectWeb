document.addEventListener('DOMContentLoaded', function() {
	_startSlideAllList();
	_clickQuit();
	_changeStateOfFormFindProduct();
	_showTabProduct();
	_showButtonRemoveAll();
	_showWarningRemove();

	_clickOutsideSearch();
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
		newParent.setAttribute("action", "../html/FindProduct");
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
	Note: phương thức khi ấn có sự thay đổi trong input thì hiện ra danh sách 
	những sản phẩm cùng tên
*/
function _showTabProduct() {
	elementInput.oninput = function(e) {
		var data = e.target.value;
		if (data !== "") {
			elementModalOverlaySearchOpacity.classList.add("active");
			elementTabProducts.classList.add("active_tab_product");
			_removeAllChild();
			_showProductSuggestion(data);
		}
		else {
			elementModalOverlaySearchOpacity.classList.remove("active");
			elementTabProducts.classList.remove("active_tab_product");
		}
	}
}

/*
	Create: Cao Thành Nam
	Date: 20/12/2023
	Note: phương thức tắt danh sách suggestion khi ấn vào bất kỳ chỗ nào trên trang
*/
function _clickOutsideSearch() {
	elementModalOverlaySearchOpacity.onclick = function() {
		elementTabProducts.classList.remove("active_tab_product");
		elementModalOverlaySearchOpacity.classList.remove("active");
	}
}

/*
	Create: Cao Thành Nam
	Date: 29/11/2023
	Note: phương thức gửi request tới servlet khi truyền tên 
	sản phẩm vào và gắn tên sản phẩm lên tham số của url
*/
function _showProductSuggestion(nameProduct) {
	var productsByString = httpGet("../ProductSuggestionService?nameProduct=" + nameProduct);
	var productsByArray = JSON.parse(productsByString);

	productsByArray.forEach(function(value) {
		var elementSuggestion = document.createElement("a");
		elementSuggestion.classList.add("products_suggestion_item");
		elementSuggestion.setAttribute("href", "../html/FindProduct?currentPage=1&nameProduct=" + value.name);
		elementSuggestion.innerText = value.name;
		elementTabProducts.appendChild(elementSuggestion);
	})
}

/*
	Create: Cao Thành Nam
	Date: 13/12/2023
	Note: phương thức thêm sự kiện click khi ấn vào thùng rác trong danh sách wishlist
*/
function _removeAllChild() {
	var elementItemSuggestion = document.querySelectorAll(".products_suggestion_item");
	elementItemSuggestion.forEach(function(value) {
		elementTabProducts.removeChild(value);
	})
}

function httpGet(theUrl) {
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.open("GET", theUrl, false);
	xmlHttp.send(null);
	return xmlHttp.responseText;
}

function httpPost(theUrl) {
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.open("POST", theUrl, false);
	xmlHttp.send(null);
	return xmlHttp.responseText;
}

/*
	Create: Cao Thành Nam
	Date: 13/12/2023
	Note: phương thức thêm nút "xóa tất cả", 
	khi có sản phẩm trong danh sách yêu thích thì nút này mới hiện, ngược lại thì không
*/
function _showButtonRemoveAll() {
	if (elementWishlistProduct.length > 0) {
		elementButtonRemoveAll.style.display = "flex";
	}
	else {
		elementButtonRemoveAll.style.display = "none";
	}
}

var idRemoveOne = "";
/*
	Create: Cao Thành Nam
	Date: 13/12/2023
	Note: phương thức khi ấn vào nút "xóa tất cả" hoặc thùng rác thì hiện lên bảng cảnh báo xóa
*/
function _showWarningRemove() {
	elementButtonRemoveAll.onclick = function() {
		elementModalOverlayConfirm.style.display = 'flex';
		elementTextRemoveAll.classList.add("active");
		elementTextRemoveOne.classList.remove("active");
		_requestRemoveAll();
	}

	elementTrashCan.forEach(function(value) {
		value.onclick = function() {
			elementModalOverlayConfirm.style.display = 'flex';
			idRemoveOne = value.getAttribute("id");
			elementTextRemoveOne.classList.add("active");
			elementTextRemoveAll.classList.remove("active");
			_requestRemoveOne();
		}
	})
}

/*
	Create: Cao Thành Nam
	Date: 13/12/2023
	Note: phương thức thêm sự kiện click khi ấn vào thùng rác trong danh sách wishlist
*/
function _requestRemoveOne() {
	elementButtonConfirmSuccess.removeEventListener("click", _removeAllSuccess)
	elementButtonConfirmFail.removeEventListener("click", _removeAllFail)

	elementButtonConfirmFail.addEventListener("click", _removeOneFail)
	elementButtonConfirmSuccess.addEventListener("click", _removeOneSuccess)

}

/*
	Create: Cao Thành Nam
	Date: 13/12/2023
	Note: phương thức thêm sự kiện click khi ấn vào nút xóa tất cả
*/
function _requestRemoveAll() {
	elementButtonConfirmSuccess.removeEventListener("click", _removeOneSuccess)
	elementButtonConfirmFail.removeEventListener("click", _removeOneFail)

	elementButtonConfirmSuccess.addEventListener("click", _removeAllSuccess)
	elementButtonConfirmFail.addEventListener("click", _removeAllFail)
}


/*
	Create: Cao Thành Nam
	Date: 13/12/2023
	Note: phương thức khi ấn vào nút "không", 
	js sẽ gửi đến servlet wishlist thông qua ajax kèm theo tham số trên url
*/
function _removeAllSuccess() {
	httpGet("../html/wishlist?remove=yes");
	elementModalOverlayConfirm.style.display = "none";
	location.reload();
}

function _removeAllFail() {
	httpGet("../html/wishlist?&remove=no");
	elementModalOverlayConfirm.style.display = "none";
}

function _removeOneSuccess() {
	httpPost("../html/wishlist?id=" + idRemoveOne + "&remove=yes");
	elementModalOverlayConfirm.style.display = "none";
	location.reload();
}


function _removeOneFail() {
	httpPost("../html/wishlist?id=" + idRemoveOne + "&remove=no");
	elementModalOverlayConfirm.style.display = "none";
}


var elementTextRemoveAll = document.querySelector(".text_remove_all");
var elementTextRemoveOne = document.querySelector(".text_remove_one");
var elementModalOverlayConfirm = document.querySelector(".modal_confirm_before_delete_overlay");
var elementButtonConfirmFail = document.querySelector(".confirm_before_delete_btn-fail");
var elementButtonConfirmSuccess = document.querySelector(".confirm_before_delete_btn-success");
var elementTrashCan = document.querySelectorAll('.remove_one');
var elementModalConfirmWishlist = document.querySelector(".modal_confirm_before_delete");
var elementButtonRemoveAll = document.querySelector(".modal_wishlist_trash_all");
var elementWishlistProduct = document.querySelectorAll(".wishlist_product");
var elementTabProducts = document.querySelector(".tab_suggestion_products");
var elementInput = document.querySelector(".search");
var elementWistListIcon = document.querySelector(".list_wishList");
var elementWistListIconMobile = document.querySelector(".list_wishList--mobile");
var elementModalBodyWishList = document.querySelector(".modal_body_wishList");
var elementWishlistItems = document.querySelector(".wishlist_items");
var elementQuitIconWishList = document.querySelector(".modal_body_quit_wishlist");

var elemmentQuantity = document.querySelector(".header_cart_amount_product");

var elemmentQuantityWishListMobile = document.querySelector(".list_wishList--mobile .amount_wishlist");
var elemmentQuantityWishList = document.querySelector(".list_wishList .amount_wishlist");
var elementModalOverlaySearchOpacity = document.querySelector(".modal_overlay_search_opacity")
var elementCategoryItem = document.querySelectorAll(".category_all_item");
var elementCategoryChildItem = document.querySelectorAll(".category_all_item_child_list");
var elementIconDown = document.querySelectorAll(".category_all_item_icon");



