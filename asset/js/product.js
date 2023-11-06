var elementPriceOptionList = document.querySelector(
  ".category_price_option_list"
);

var elementPriceOptionListChild = elementPriceOptionList.querySelector(
  ".category_price_option_item ul"
);
var elementPriceIconDown = elementPriceOptionList.querySelector(
  ".category_all_item_icon"
);

var elementBrandOptionList = document.querySelector(
  ".category_brand_option_list"
);

var elementBrandOptionListChild = elementBrandOptionList.querySelector(
  ".category_brand_option_item ul"
);
var elementBrandIconDown = elementBrandOptionList.querySelector(
  ".category_all_item_icon"
);

/* Create: Cao Thành Nam
phương thức hiện bộ lọc cho giá khi ấn vào
khi ấn vào sort theo giá sẽ hiện và tắt sort theo brand
*/
function _clickPrice() {
  elementPriceOptionList.onclick = function () {
    _turnOnPrice(
      elementPriceOptionList,
      elementPriceOptionListChild,
      elementPriceIconDown
    );
    _turnOffBrand(
      elementBrandOptionList,
      elementBrandOptionListChild,
      elementBrandIconDown
    );
  };
}

/* Create: Cao Thành Nam
phương thức hiện bộ lọc cho brand khi ấn vào
khi ấn vào sort theo brand sẽ hiện và tắt sort theo giá
*/
function _clickBrand() {
  elementBrandOptionList.onclick = function () {
    _turnOnBrand(
      elementBrandOptionList,
      elementBrandOptionListChild,
      elementBrandIconDown
    );
    _turnOffPrice(
      elementPriceOptionList,
      elementPriceOptionListChild,
      elementPriceIconDown
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
}


/* Create: Cao Thành Nam
phương thức tắt sort theo brand
*/
function _turnOffBrand(brand, brandChild, icon) {
  brand.classList.remove("border_option_list");
  brandChild.classList.remove("active");
  icon.classList.remove("rotate_icon");
}

/* Create: Cao Thành Nam
phương thức hiện sort theo brand
*/
function _turnOnBrand(brand, brandChild, icon) {
  brand.classList.toggle("border_option_list");
  brandChild.classList.toggle("active");
  icon.classList.toggle("rotate_icon");
}

/* Create: Cao Thành Nam
phương thức này khi ấn vào trang mới thì trang cũ sẽ không đc avtive
*/
var elementNewPageItem = document.querySelectorAll(".new_page_item");
function _refreshPageItem() {
  elementNewPageItem.forEach(function (value) {
    value.classList.remove("padding_down");
    value.classList.remove("choose_page_item");
  });
}

/* Create: Cao Thành Nam
phương thức ấn chuyển trang sẽ được avtive
*/
function _changePage() {
  elementNewPageItem.forEach(function (value) {
    value.onclick = function () {
      _refreshPageItem();
      value.classList.add("padding_down");
      value.classList.add("choose_page_item");
    };
  });
}

_clickPrice();
_clickBrand();
