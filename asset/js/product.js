var elementPriceOptionList = document.querySelector(".category_price_option_list");

var elementPriceOptionListChild = elementPriceOptionList.querySelector(".category_price_option_item ul");
var elementPriceIconDown = elementPriceOptionList.querySelector(".category_all_item_icon");

var elementBrandOptionList = document.querySelector(".category_brand_option_list");

var elementBrandOptionListChild = elementBrandOptionList.querySelector(".category_brand_option_item ul");
var elementBrandIconDown = elementBrandOptionList.querySelector(".category_all_item_icon");

function _clickPrice(){
  elementPriceOptionList.onclick = function () {
    _turnOnPrice(elementPriceOptionList, elementPriceOptionListChild, elementPriceIconDown);
    _turnOffBrand(elementBrandOptionList, elementBrandOptionListChild, elementBrandIconDown);
  };
}

function _clickBrand(){
  
  elementBrandOptionList.onclick = function () {
    _turnOnBrand(elementBrandOptionList, elementBrandOptionListChild, elementBrandIconDown);
    _turnOffPrice(elementPriceOptionList, elementPriceOptionListChild, elementPriceIconDown);
  };
}

function _turnOffPrice(price, priceChild, icon){
  price.classList.remove("border_option_list");
  priceChild.classList.remove("active");
  icon.classList.remove("rotate_icon");
}

function _turnOnPrice(price, priceChild, icon) {
  price.classList.toggle("border_option_list");
  priceChild.classList.toggle("active");
  icon.classList.toggle("rotate_icon");
}

function _turnOffBrand(brand, brandChild, icon){
  brand.classList.remove("border_option_list");
  brandChild.classList.remove("active");
  icon.classList.remove("rotate_icon");
}

function _turnOnBrand(brand, brandChild, icon) {
  brand.classList.toggle("border_option_list");
  brandChild.classList.toggle("active");
  icon.classList.toggle("rotate_icon");
}

_clickPrice();
_clickBrand();