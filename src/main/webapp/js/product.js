document.addEventListener("DOMContentLoaded", function () {
  if (document.querySelector(".category_product")) {
    _clickPrice();
    _clickBrand();
    _chooseOptionBrand();
    _chooseOptionPrice();
  }
  _addWishList();
  _addToCard();
  _changePage();
});

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

/* Create: Cao Thành Nam
phương thức set item cho bộ lọc theo giá
*/
function _chooseOptionPrice() {
  elementPriceOptionListChildItem.forEach(function (value) {
    var elementShowChoose = value.parentElement.parentElement.querySelector(
      ".category_price_option_default"
    );
    value.onclick = function () {
      elementShowChoose.innerText = value.innerText;
    };
  });
}

var elementPriceOptionListChildItem = document.querySelectorAll(
  ".category_price_option_list .category_price_option_item ul li"
);

var elementBrandOptionListItem = document.querySelectorAll(
  ".category_brand_option_list .category_brand_option_item ul label"
);

/* Create: Cao Thành Nam
phương thức set item cho bộ lọc theo thương hiệu
*/
var re = [];
function _chooseOptionBrand() {
  elementBrandOptionListItem.forEach(function (value) {
    value.onchange = function (e) {
      elementBrandOptionListChild.classList.add("active");
      if (e.target.checked) {
        re.push(e.target.name);
      } else {
        re = re.filter(function (value) {
          return value !== e.target.name;
        });
      }
      _setChooseBrand(re);
    };
  });
}

function _setChooseBrand(array) {
  var elementSetBrand = document.querySelector(
    ".category_brand_option_default"
  );

  if (array.length === 0) {
    console.log("default");
    elementSetBrand.innerText = "Theo thương hiệu";
  } else {
    elementSetBrand.innerText = "";
  }

  array.forEach(function (value, index) {
    if (index === array.length - 1) {
      elementSetBrand.innerText += value;
    } else {
      elementSetBrand.innerText += value + "-";
    }
  });
}

/*
Create: Cao Thành Nam
Date: 19/10/2023
Note: nếu ấn vào wishlist thì sản phẩm được thêm vào wishlist
*/

function _addWishList() {
  var elementHeartIcon = document.querySelectorAll(".no_wishlist");
  elementHeartIcon.forEach(function (value) {
    value.onclick = function () {
      value.classList.toggle("wishlisted");
      value.classList.toggle("no_wishlist");

      var quantityMobilt = parseInt(elemmentQuantityWishListMobile.innerText);
      var quantity = parseInt(elemmentQuantityWishList.innerText);
      if (value.classList.contains("wishlisted")) {
        quantity += 1;
        quantityMobilt += 1;
      } else {
        quantity -= 1;
        quantityMobilt -= 1;
      }
      elemmentQuantityWishList.innerHTML = quantity;
      elemmentQuantityWishListMobile.innerHTML = quantity;
    };
  });
}

function _addToCard() {
  var elementAddCard = document.querySelectorAll(".product_btn button");
  var elemmentQuantity = document.querySelector(".header_cart_amount_product");
  elementAddCard.forEach(function (value) {
    value.onclick = function () {
      var elementImgProduct =
        value.parentElement.parentElement.querySelector(".fly_to_card");
      elementImgProduct.classList.add("animation_add_to_card");

      elemmentQuantity.innerHTML =
        parseInt(elemmentQuantity.innerText) + 1 + "";

      setTimeout(function () {
        elementImgProduct.classList.remove("animation_add_to_card");
      }, 800);
    };
  });
}