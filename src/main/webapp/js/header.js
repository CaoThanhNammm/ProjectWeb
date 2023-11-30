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
	var productsByString = httpGet("http://localhost:8080/Project/ProductSuggestionService?nameProduct=" + nameProduct);
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



var jsonProduct = [
	{
		"id": "1",
		"name": "Bếp ga đôi Apex APB3551"
	},
	{
		"id": "2",
		"name": "Bếp ga đôi Kangaroo KG519M"
	},
	{
		"id": "3",
		"name": "Bếp ga đôi Electrolux ETG7266GKR"
	},
	{
		"id": "4",
		"name": "Bếp ga đôi Sunhouse Mama MMBB0787MT"
	},
	{
		"id": "5",
		"name": "Bếp ga đôi Apex APB3551"
	},
	{
		"id": "6",
		"name": "Bếp ga đôi Sunhouse SHB3326MT"
	},
	{
		"id": "7",
		"name": "Bếp ga đôi Kangaroo KG519M"
	},
	{
		"id": "8",
		"name": "Bếp ga đôi Sunhouse SHB 201MT"
	},
	{
		"id": "9",
		"name": "Bếp ga đôi Sunhouse Mama MMBB0787MT"
	},
	{
		"id": "10",
		"name": "Bếp ga mini Namilux NH-P3031AS"
	},
	{
		"id": "11",
		"name": "Bếp ga đôi Sunhouse Mama MMBB0787MT"
	},
	{
		"id": "12",
		"name": "Bếp ga đôi Electrolux ETG7266GKR"
	},
	{
		"id": "13",
		"name": "Bếp ga đôi Sakura SA-695SG"
	},
	{
		"id": "14",
		"name": "Bếp ga mini Namilux NH-P3031AS"
	},
	{
		"id": "15",
		"name": "Bếp ga đôi Electrolux ETG7266GKR"
	},
	{
		"id": "16",
		"name": "Bếp ga đôi Sunhouse SHB3365"
	},
	{
		"id": "17",
		"name": "Bếp ga đôi Rinnai RV-MC27BE"
	},
	{
		"id": "18",
		"name": "Bếp ga đôi Sunhouse SHB3365"
	},
	{
		"id": "19",
		"name": "Bếp ga đôi Kangaroo KG8G1C"
	},
	{
		"id": "20",
		"name": "Bếp ga đôi Sunhouse SHB3326MT"
	},
	{
		"id": "21",
		"name": "Bếp ga đôi Sunhouse Mama MMBB0787MT"
	},
	{
		"id": "22",
		"name": "Bếp ga đôi Rinnai RV-MC27BE"
	},
	{
		"id": "23",
		"name": "Bếp ga mini Namilux NH-P3031AS"
	},
	{
		"id": "24",
		"name": "Bếp ga đôi Sunhouse Mama MMBB0787MT"
	},
	{
		"id": "25",
		"name": "Bếp ga đôi Kangaroo KG8G1A"
	},
	{
		"id": "26",
		"name": "Bếp ga đôi Rinnai RV-MC27BE"
	},
	{
		"id": "27",
		"name": "Bếp ga đôi Sunhouse SHB 201MT"
	},
	{
		"id": "28",
		"name": "Bếp ga đôi Apex APB3551"
	},
	{
		"id": "29",
		"name": "Bếp ga đôi Kangaroo KG8G1A"
	},
	{
		"id": "30",
		"name": "Bếp từ hồng ngoại lắp âm Pramie PRTH-A1"
	},
	{
		"id": "31",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "32",
		"name": "Bếp từ hồng ngoại lắp âm Pramie PRTH-A1"
	},
	{
		"id": "33",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "34",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "35",
		"name": "Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN"
	},
	{
		"id": "36",
		"name": "Bếp hồng ngoại Delites 853"
	},
	{
		"id": "37",
		"name": "Bếp từ đôi lắp âm Kangaroo KG855i"
	},
	{
		"id": "38",
		"name": "Bếp từ đôi lắp âm Kangaroo KG855i"
	},
	{
		"id": "39",
		"name": "Bếp từ AVA FYM20-71"
	},
	{
		"id": "40",
		"name": "Bếp từ hồng ngoại lắp âm Pramie PRTH-A1"
	},
	{
		"id": "41",
		"name": "Bếp từ Galanz CH211E"
	},
	{
		"id": "42",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "43",
		"name": "Bếp hồng ngoại Delites 853"
	},
	{
		"id": "44",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "45",
		"name": "Bếp hồng ngoại Sunhouse SHD 6005(EMC)"
	},
	{
		"id": "46",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "47",
		"name": "Bếp từ đôi lắp âm Kangaroo KG855i"
	},
	{
		"id": "48",
		"name": "Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)"
	},
	{
		"id": "49",
		"name": "Bếp từ đôi lắp âm Kangaroo KG855i"
	},
	{
		"id": "50",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "51",
		"name": "Bếp từ đôi lắp âm Kangaroo KG855i"
	},
	{
		"id": "52",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "53",
		"name": "Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN"
	},
	{
		"id": "54",
		"name": "Bếp từ Galanz CH211E"
	},
	{
		"id": "55",
		"name": "Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)"
	},
	{
		"id": "56",
		"name": "Bếp hồng ngoại Delites 853"
	},
	{
		"id": "57",
		"name": "Bếp từ đôi lắp âm BlueStone ICB-6818"
	},
	{
		"id": "58",
		"name": "Bếp từ Galanz CH211E"
	},
	{
		"id": "59",
		"name": "Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN"
	},
	{
		"id": "60",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S05"
	},
	{
		"id": "61",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "62",
		"name": "Bình đun siêu tốc Sunhouse 1.8 lít SHD1351"
	},
	{
		"id": "63",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "64",
		"name": "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B"
	},
	{
		"id": "65",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389"
	},
	{
		"id": "66",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330"
	},
	{
		"id": "67",
		"name": "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B"
	},
	{
		"id": "68",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "69",
		"name": "Bình đun siêu tốc Toshiba 1.7 lít KT-17SH2NV"
	},
	{
		"id": "70",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389"
	},
	{
		"id": "71",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "72",
		"name": "Bình đun siêu tốc Sunhouse 1.8 lít SHD1182"
	},
	{
		"id": "73",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "74",
		"name": "Bình đun siêu tốc BlueStone 1.7 lít KTB-3417"
	},
	{
		"id": "75",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "76",
		"name": "Bình đun siêu tốc Sunhouse 1.8 lít SHD1182"
	},
	{
		"id": "77",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389"
	},
	{
		"id": "78",
		"name": "Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen"
	},
	{
		"id": "79",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "80",
		"name": "Bình đun siêu tốc BlueStone 1.7 lít KTB-3417"
	},
	{
		"id": "81",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330"
	},
	{
		"id": "82",
		"name": "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B"
	},
	{
		"id": "83",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18DB01"
	},
	{
		"id": "84",
		"name": "Bình đun siêu tốc Delites 1.5 lít ST15S01"
	},
	{
		"id": "85",
		"name": "Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen"
	},
	{
		"id": "86",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "87",
		"name": "Bình đun siêu tốc BlueStone 1.5 lít KTB-3453 kem"
	},
	{
		"id": "88",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "89",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S05"
	},
	{
		"id": "90",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "91",
		"name": "Bình đun siêu tốc Sunhouse 1.8 lít SHD1351"
	},
	{
		"id": "92",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "93",
		"name": "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B"
	},
	{
		"id": "94",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389"
	},
	{
		"id": "95",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330"
	},
	{
		"id": "96",
		"name": "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B"
	},
	{
		"id": "97",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "98",
		"name": "Bình đun siêu tốc Toshiba 1.7 lít KT-17SH2NV"
	},
	{
		"id": "99",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389"
	},
	{
		"id": "100",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "101",
		"name": "Bình đun siêu tốc Sunhouse 1.8 lít SHD1182"
	},
	{
		"id": "102",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "103",
		"name": "Bình đun siêu tốc BlueStone 1.7 lít KTB-3417"
	},
	{
		"id": "104",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "105",
		"name": "Bình đun siêu tốc Sunhouse 1.8 lít SHD1182"
	},
	{
		"id": "106",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389"
	},
	{
		"id": "107",
		"name": "Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen"
	},
	{
		"id": "108",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18S04"
	},
	{
		"id": "109",
		"name": "Bình đun siêu tốc BlueStone 1.7 lít KTB-3417"
	},
	{
		"id": "110",
		"name": "Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330"
	},
	{
		"id": "111",
		"name": "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B"
	},
	{
		"id": "112",
		"name": "Bình đun siêu tốc Delites 1.8 lít ST18DB01"
	},
	{
		"id": "113",
		"name": "Bình đun siêu tốc Delites 1.5 lít ST15S01"
	},
	{
		"id": "114",
		"name": "Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen"
	},
	{
		"id": "115",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "116",
		"name": "Bình đun siêu tốc BlueStone 1.5 lít KTB-3453 kem"
	},
	{
		"id": "117",
		"name": "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL"
	},
	{
		"id": "118",
		"name": "Máy lọc nước RO Midea MWP-S0820MR 8 lõi"
	},
	{
		"id": "119",
		"name": "Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi"
	},
	{
		"id": "120",
		"name": "Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi"
	},
	{
		"id": "121",
		"name": "Máy lọc nước RO nóng nguội lạnh Sunhouse SHA76213CK 10 lõi"
	},
	{
		"id": "122",
		"name": "Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi"
	},
	{
		"id": "123",
		"name": "Máy lọc nước RO Daikiosan DXW-42010H 10 lõi"
	},
	{
		"id": "124",
		"name": "Máy lọc nước RO nóng nguội lạnh Toshiba TWP-W1905SV(MB) 3 lõi"
	},
	{
		"id": "125",
		"name": "Máy lọc nước RO nóng nguội lạnh Sunhouse SHR76210CK 10 lõi"
	},
	{
		"id": "126",
		"name": "Máy lọc nước RO nóng nguội lạnh Toshiba TWP-W1905SV(MB) 3 lõi"
	},
	{
		"id": "127",
		"name": "Máy lọc nước RO Midea MWP-S0620MR 6 lõi"
	},
	{
		"id": "128",
		"name": "Máy lọc nước RO Midea MWP-S0620MR 6 lõi"
	},
	{
		"id": "129",
		"name": "Máy lọc nước RO không vỏ Kangaroo KG110 9 lõi"
	},
	{
		"id": "130",
		"name": "Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi"
	},
	{
		"id": "131",
		"name": "Máy lọc nước RO Hòa Phát HWS1B 1022 10 lõi"
	},
	{
		"id": "132",
		"name": "Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi"
	},
	{
		"id": "133",
		"name": "Máy lọc nước RO Midea MWP-S0820MR 8 lõi"
	},
	{
		"id": "134",
		"name": "Máy lọc nước RO Toshiba TWP-N1686UV(W1) 3 lõi"
	},
	{
		"id": "135",
		"name": "Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi"
	},
	{
		"id": "136",
		"name": "Máy lọc nước RO Midea MWP-S0820MR 8 lõi"
	},
	{
		"id": "137",
		"name": "Máy lọc nước R.O Delites DES0820RO 8 lõi"
	},
	{
		"id": "138",
		"name": "Máy lọc nước RO Midea MWP-S0620MR 6 lõi"
	},
	{
		"id": "139",
		"name": "Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi"
	},
	{
		"id": "140",
		"name": "Máy lọc nước RO Midea MWP-S0620MR 6 lõi"
	},
	{
		"id": "141",
		"name": "Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi"
	},
	{
		"id": "142",
		"name": "Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi"
	},
	{
		"id": "143",
		"name": "Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi"
	},
	{
		"id": "144",
		"name": "Máy lọc nước RO Hòa Phát HWS1B 1022 10 lõi"
	},
	{
		"id": "145",
		"name": "Máy lọc nước R.O Delites DES0820RO 8 lõi"
	},
	{
		"id": "146",
		"name": "Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi"
	},
	{
		"id": "147",
		"name": "Máy ép trái cây Tefal ZE420D38"
	},
	{
		"id": "148",
		"name": "Máy ép trái cây BlueStone JEB-6545"
	},
	{
		"id": "149",
		"name": "Máy xay ép đa năng Panasonic MJ-M176PWRA"
	},
	{
		"id": "150",
		"name": "Máy ép trái cây Philips HR1811"
	},
	{
		"id": "151",
		"name": "Máy ép chậm Kangaroo KG150SJ"
	},
	{
		"id": "152",
		"name": "Máy ép trái cây Philips HR1811"
	},
	{
		"id": "153",
		"name": "Máy ép trái cây Crystal GS-333"
	},
	{
		"id": "154",
		"name": "Máy ép trái cây Philips HR1811"
	},
	{
		"id": "155",
		"name": "Máy ép chậm Hafele HS-J32X (535.43.393)"
	},
	{
		"id": "156",
		"name": "Máy ép chậm BlueStone SJB-6556"
	},
	{
		"id": "157",
		"name": "Máy ép chậm BlueStone SJB-6556"
	},
	{
		"id": "158",
		"name": "Máy ép trái cây BlueStone JEB-6545"
	},
	{
		"id": "159",
		"name": "Máy ép trái cây Sunhouse SHD5520"
	},
	{
		"id": "160",
		"name": "Máy ép trái cây Crystal GS-333"
	},
	{
		"id": "161",
		"name": "Máy ép chậm Sunhouse Mama SHD5505"
	},
	{
		"id": "162",
		"name": "Máy ép trái cây AVA AJ02"
	},
	{
		"id": "163",
		"name": "Máy ép chậm Kangaroo KG150SJ"
	},
	{
		"id": "164",
		"name": "Máy ép trái cây Sunhouse SHD5520"
	},
	{
		"id": "165",
		"name": "Máy ép trái cây Philips HR1811"
	},
	{
		"id": "166",
		"name": "Máy ép chậm Hafele GS-133N (535.43.811)"
	},
	{
		"id": "167",
		"name": "Máy ép chậm Hafele GS-133N (535.43.811)"
	},
	{
		"id": "168",
		"name": "Máy ép trái cây Tefal ZE420D38"
	},
	{
		"id": "169",
		"name": "Máy ép trái cây AVA AJ02"
	},
	{
		"id": "170",
		"name": "Máy ép chậm BlueStone SJB-6556"
	},
	{
		"id": "171",
		"name": "Máy ép trái cây Tefal ZC150838"
	},
	{
		"id": "172",
		"name": "Máy ép trái cây BlueStone JEB-6545"
	},
	{
		"id": "173",
		"name": "Máy ép trái cây Sunhouse SHD5520"
	},
	{
		"id": "174",
		"name": "Máy xay ép đa năng Panasonic MJ-M176PWRA"
	},
	{
		"id": "175",
		"name": "Máy xay ép đa năng BlueStone BLB-5343"
	},
	{
		"id": "176",
		"name": "Máy làm sữa hạt Rapido RHB-1800D"
	},
	{
		"id": "177",
		"name": "Máy xay sinh tố đa năng BlueStone BLB-5339"
	},
	{
		"id": "178",
		"name": "Máy xay sinh tố đa năng AVA YX-906N"
	},
	{
		"id": "179",
		"name": "Máy xay sinh tố Kangaroo KGBL1000X"
	},
	{
		"id": "180",
		"name": "Máy xay sinh tố đa năng Philips HR2041/50 - 3 cối"
	},
	{
		"id": "181",
		"name": "Máy xay sinh tố đa năng BlueStone BLB-5339"
	},
	{
		"id": "182",
		"name": "Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh"
	},
	{
		"id": "183",
		"name": "Máy xay sinh tố đa năng Philips HR2041/50 - 3 cối"
	},
	{
		"id": "184",
		"name": "Máy xay sinh tố đa năng Toshiba BL-70PR1NV"
	},
	{
		"id": "185",
		"name": "Máy làm sữa hạt Rapido RHB-1800D"
	},
	{
		"id": "186",
		"name": "Máy làm sữa hạt đa năng Tefal BL83SD66"
	},
	{
		"id": "187",
		"name": "Máy làm sữa hạt Rapido RHB-1800D"
	},
	{
		"id": "188",
		"name": "Máy xay sinh tố đa năng AVA BL328"
	},
	{
		"id": "189",
		"name": "Máy làm sữa hạt đa năng Tefal BL967B66"
	},
	{
		"id": "190",
		"name": "Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh"
	},
	{
		"id": "191",
		"name": "Máy xay sinh tố đa năng AVA BL328"
	},
	{
		"id": "192",
		"name": "Máy xay sinh tố đa năng AVA YX-906N"
	},
	{
		"id": "193",
		"name": "Máy làm sữa hạt đa năng Tefal BL83SD66"
	},
	{
		"id": "194",
		"name": "Máy làm sữa hạt đa năng Tefal BL967B66"
	},
	{
		"id": "195",
		"name": "Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh"
	},
	{
		"id": "196",
		"name": "Máy xay sinh tố đa năng Philips HR2041/10 - 2 cối"
	},
	{
		"id": "197",
		"name": "Máy xay sinh tố Kangaroo KG4B3"
	},
	{
		"id": "198",
		"name": "Máy làm sữa hạt Rapido RHB-1800D"
	},
	{
		"id": "199",
		"name": "Máy xay sinh tố đa năng Philips HR2041/10 - 2 cối"
	},
	{
		"id": "200",
		"name": "Máy xay sinh tố Kangaroo KG4B3"
	},
	{
		"id": "201",
		"name": "Máy xay sinh tố Kangaroo KG4B3"
	},
	{
		"id": "202",
		"name": "Máy xay sinh tố đa năng Kangaroo KG3B2"
	},
	{
		"id": "203",
		"name": "Máy làm sữa hạt đa năng Magic A-96 bạc"
	},
	{
		"id": "204",
		"name": "Máy xay sinh tố đa năng AVA YX-906N"
	},
	{
		"id": "205",
		"name": "Nồi chiên không dầu AVA KDF-593D 7.5 lít"
	},
	{
		"id": "206",
		"name": "Nồi chiên không dầu Kangaroo KG42AF1 4 lít"
	},
	{
		"id": "207",
		"name": "Nồi chiên không dầu Sunhouse SHD4062 6 lít"
	},
	{
		"id": "208",
		"name": "Nồi chiên không dầu AVA KDF-593D 7.5 lít"
	},
	{
		"id": "209",
		"name": "Nồi chiên không dầu AVA KDF-593D 7.5 lít"
	},
	{
		"id": "210",
		"name": "Nồi chiên không dầu Rapido SMART-7.0M 7 lít"
	},
	{
		"id": "211",
		"name": "Nồi chiên không dầu Bear QZG-A15T2 4.5 lít"
	},
	{
		"id": "212",
		"name": "Nồi chiên không dầu Rapido RAF-8.0M 8 lít"
	},
	{
		"id": "213",
		"name": "Nồi chiên không dầu Rapido RAF-8.0M 8 lít"
	},
	{
		"id": "214",
		"name": "Nồi chiên không dầu Sunhouse SHD4026 6 lít"
	},
	{
		"id": "215",
		"name": "Nồi chiên không dầu Kangaroo KG42AF1 4 lít"
	},
	{
		"id": "216",
		"name": "Nồi chiên không dầu Bear QZG-A15T2 4.5 lít"
	},
	{
		"id": "217",
		"name": "Nồi chiên không dầu Rapido RAF-8.0M 8 lít"
	},
	{
		"id": "218",
		"name": "Nồi chiên không dầu AVA AF40155D 5 lít"
	},
	{
		"id": "219",
		"name": "Nồi chiên không dầu AVA KDF-593D 7.5 lít"
	},
	{
		"id": "220",
		"name": "Nồi chiên không dầu AVA KDF-593D 7.5 lít"
	},
	{
		"id": "221",
		"name": "Nồi chiên không dầu Sunhouse SHD4026 6 lít"
	},
	{
		"id": "222",
		"name": "Lò chiên không dầu Ferroli FAF-12M 12 lít"
	},
	{
		"id": "223",
		"name": "Nồi chiên không dầu Sunhouse SHD4062 6 lít"
	},
	{
		"id": "224",
		"name": "Nồi chiên không dầu Bear QZG-A15T2 4.5 lít"
	},
	{
		"id": "225",
		"name": "Nồi chiên không dầu AVA AF40155D 5 lít"
	},
	{
		"id": "226",
		"name": "Nồi chiên không dầu AVA 55K07A 5.5 lít"
	},
	{
		"id": "227",
		"name": "Nồi chiên không dầu AVA AF40155D 5 lít"
	},
	{
		"id": "228",
		"name": "Nồi chiên không dầu Kangaroo KG42AF1 4 lít"
	},
	{
		"id": "229",
		"name": "Nồi chiên không dầu Kangaroo KG42AF1 4 lít"
	},
	{
		"id": "230",
		"name": "Nồi chiên không dầu Sunhouse SHD4026 6 lít"
	},
	{
		"id": "231",
		"name": "Nồi chiên không dầu Rapido RAF-8.0M 8 lít"
	},
	{
		"id": "232",
		"name": "Lò chiên không dầu Ferroli FAF-12M 12 lít"
	},
	{
		"id": "233",
		"name": "Nồi chiên không dầu AVA KDF-593D 7.5 lít"
	},
	{
		"id": "234",
		"name": "Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)"
	},
	{
		"id": "235",
		"name": "Nồi cơm cao tần Sharp 1.8 lít KS-IH191V-BK"
	},
	{
		"id": "236",
		"name": "Nồi cơm nắp gài Sunhouse 1.8 lít SHD8602"
	},
	{
		"id": "237",
		"name": "Nồi cơm nắp gài Delites 1.8 lít NCG1805"
	},
	{
		"id": "238",
		"name": "Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)"
	},
	{
		"id": "239",
		"name": "Nồi cơm nắp gài Sharp 1.8 lít KS-NR191STV"
	},
	{
		"id": "240",
		"name": "Nồi cơm nắp gài Delites 1.8 lít NCG1805"
	},
	{
		"id": "241",
		"name": "Nồi cơm điện tử Philips 1.8 lít HD4515/55"
	},
	{
		"id": "242",
		"name": "Nồi cơm nắp gài Sunhouse 1.8 lít SHD8602"
	},
	{
		"id": "243",
		"name": "Nồi cơm nắp gài Sunhouse 1 lít SHD8208C"
	},
	{
		"id": "244",
		"name": "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E"
	},
	{
		"id": "245",
		"name": "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E"
	},
	{
		"id": "246",
		"name": "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E"
	},
	{
		"id": "247",
		"name": "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E"
	},
	{
		"id": "248",
		"name": "Nồi cơm điện tử Sunhouse mama 1.8 lít SHD8903"
	},
	{
		"id": "249",
		"name": "Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)"
	},
	{
		"id": "250",
		"name": "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E"
	},
	{
		"id": "251",
		"name": "Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N"
	},
	{
		"id": "252",
		"name": "Nồi cơm nắp gài Delites 1.8 lít NCG1805"
	},
	{
		"id": "253",
		"name": "Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)"
	},
	{
		"id": "254",
		"name": "Nồi cơm cao tần Sharp 1.8 lít KS-IH191V-BK"
	},
	{
		"id": "255",
		"name": "Nồi cơm cao tần Sunhouse Mama 1.5 lít SHD8955"
	},
	{
		"id": "256",
		"name": "Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N"
	},
	{
		"id": "257",
		"name": "Nồi cơm nắp gài BlueStone 1.8 lít RCB-5520"
	},
	{
		"id": "258",
		"name": "Nồi cơm điện tử Philips 1.8 lít HD4515/55"
	},
	{
		"id": "259",
		"name": "Nồi cơm điện tử Sunhouse mama 1.8 lít SHD8903"
	},
	{
		"id": "260",
		"name": "Nồi cơm cao tần Sunhouse Mama 1.5 lít SHD8955"
	},
	{
		"id": "261",
		"name": "Nồi cơm nắp gài Sunhouse 1.2 lít SHD8217W"
	},
	{
		"id": "262",
		"name": "Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N"
	}
]


