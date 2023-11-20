document.addEventListener("DOMContentLoaded", function () {
  if (document.querySelector("#home")) {
    _addProduct(
      nameOfBepDien,
      "bd",
      "../image/product/bepdien",
      "detail.jsp",
      3000000,
      1000000,
      4
    );
    _addProduct(
      nameOfBepGa,
      "bg",
      "../image/product/bepga",
      "detail.jsp",
      3000000,
      1000000,
      3
    );
    _addProduct(
      nameOfNoiCom,
      "nc",
      "../image/product/noicom",
      "detail.jsp",
      3000000,
      1000000,
      5
    );
    _addProduct(
      nameOfMayEpTraiCay,
      "me",
      "../image/product/mayeptraicay",
      "detail.jsp",
      3000000,
      1000000,
      2
    );
    _addProduct(
      nameOfMayXaySinhTo,
      "mx",
      "../image/product/mayxaysinhto",
      "detail.jsp",
      3000000,
      1000000,
      3
    );
    _addProduct(
      nameofBinhDun,
      "bd",
      "../image/product/binhdun",
      "detail.jsp",
      3000000,
      1000000,
      30
    );
  } else if (document.querySelector(".product_list")) {
    _addProduct(
      nameOfBepDien,
      "bd",
      "../image/product/bepdien",
      "detail.jsp",
      3000000,
      1000000,
      20
    );
    _addProduct(
      nameOfBepGa,
      "bg",
      "../image/product/bepga",
      "detail.jsp",
      3000000,
      1000000,
      20
    );
    _addProduct(
      nameOfNoiCom,
      "nc",
      "../image/product/noicom",
      "detail.jsp",
      3000000,
      1000000,
      20
    );
    _addProduct(
      nameOfMayEpTraiCay,
      "me",
      "../image/product/mayeptraicay",
      "detail.jsp",
      3000000,
      1000000,
      20
    );
    _addProduct(
      nameOfMayXaySinhTo,
      "mx",
      "../image/product/mayxaysinhto",
      "detail.jsp",
      3000000,
      1000000,
      20
    );
    _addProduct(
      nameofBinhDun,
      "bd",
      "../image/product/binhdun",
      "detail.jsp",
      3000000,
      1000000,
      20
    );
  }

  if (document.querySelector(".category_product")) {
    _clickPrice();
    _clickBrand();
    _chooseOptionBrand();
    _chooseOptionPrice();
  }

  _hoverChangeProductImg();
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
Create: Cao Thành Named
Date: 20/10/2023
Note: hiện ra 2 nút thêm vào giở hàng và xem chi tiết sản phẩm
*/
function _hoverChangeProductImg() {
  var elementProduct = document.querySelectorAll(".product");

  elementProduct.forEach(function (value, index) {
    var elementProductBtn = value.querySelectorAll(".product_btn .a");

    value.onmouseover = function () {
      elementProductBtn[0].classList.replace(
        "product_btn-add_card_none",
        "product_btn-add_card"
      );
      elementProductBtn[1].classList.replace(
        "product_btn--product_detail_none",
        "product_btn--product_detail"
      );
    };

    value.onmouseout = function () {
      elementProductBtn[0].classList.replace(
        "product_btn-add_card",
        "product_btn-add_card_none"
      );
      elementProductBtn[1].classList.replace(
        "product_btn--product_detail",
        "product_btn--product_detail_none"
      );
    };
  });
}

/*
Create: Cao Thành Named
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

var nameOfBepDien = [
  "Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN",
  "Bếp từ đôi lắp âm Kangaroo KG855i",
  "Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)",
  "Bếp hồng ngoại Delites 853 ",
  "Bếp từ AVA FYM20-71 ",
  "Bếp từ đôi lắp âm BlueStone ICB-6818 ",
  "Bếp từ hồng ngoại lắp âm Pramie PRTH-A1 ",
  "Bếp hồng ngoại Sunhouse SHD 6005(EMC) ",
  "Bếp từ Galanz CH211E ",
  "Bếp từ đôi lắp âm BlueStone ICB-6818 ",
  "Bếp từ đôi lắp âm Kangaroo KG855i",
  "Bếp từ đôi lắp âm BlueStone ICB-6818 ",
];

var nameOfMayLocNuoc = [
  "Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi ",
  "Máy lọc nước RO Hòa Phát HWS1B 1022 10 lõi ",
  "Máy lọc nước RO nóng nguội lạnh Sunhouse SHR76210CK 10 lõi ",
  "Máy lọc nước RO nóng nguội lạnh Sunhouse SHA76213CK 10 lõi ",
  "Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi ",
  "Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi ",
  "Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A12 10 lõi",
  "Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A3 10 lõi ",
  "Máy lọc nước RO không vỏ Kangaroo KG110 9 lõi ",
  "Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi ",
  "Máy lọc nước RO Toshiba TWP-N1686UV(W1) 3 lõi",
  "Máy lọc nước RO Midea MWP-S0620MR 6 lõi ",
  "Máy lọc nước RO Daikiosan DXW-42010H 10 lõi",
  "Máy lọc nước RO Midea MWP-S0820MR 8 lõi  ",
  "Máy lọc nước RO nóng nguội lạnh Toshiba TWP-W1905SV(MB) 3 lõi ",
  "Máy lọc nước R.O Delites DES0820RO 8 lõi ",
];

var nameOfNoiChien = [
  "Nồi chiên không dầu Rapido SMART-7.0M 7 lít ",
  "Nồi chiên không dầu Sunhouse SHD4035 9 lít ",
  "Nồi chiên không dầu AVA KDF-593D 7.5 lít  ",
  "Nồi chiên không dầu Sunhouse SHD4026 6 lít  ",
  "Nồi chiên không dầu Rapido RAF-8.0M 8 lít ",
  "Nồi chiên không dầu Sunhouse SHD4062 6 lít ",
  "Nồi chiên không dầu AVA 55K07A 5.5 lít ",
  "Nồi chiên không dầu AVA AF40155D 5 lít",
  "Lò chiên không dầu Ferroli FAF-12M 12 lít ",
  "Nồi chiên không dầu Kangaroo KG42AF1 4 lít ",
  "Lò chiên không dầu Rapido RAF-12M1 12 lít ",
  "Nồi chiên không dầu Bear QZG-A15T2 4.5 lít",
];
var nameOfNoiCom = [
  "Nồi cơm nắp gài Sunhouse 1 lít SHD8208C ",
  "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E ",
  "Nồi cơm điện tử Sunhouse mama 1.8 lít SHD8903 ",
  "Nồi cơm điện tử Sunhouse mama 1.5 lít SHD8915 ",
  "Nồi cơm nắp gài Sharp 1.8 lít KS-NR191STV ",
  "Nồi cơm nắp gài Sunhouse 1.8 lít SHD8602",
  "Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N  ",
  "Nồi cơm cao tần Sharp 1.8 lít KS-IH191V-BK ",
  "Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT) ",
  "Nồi cơm nắp gài Sunhouse 1.2 lít SHD8217W",
  "Nồi cơm nắp gài BlueStone 1.8 lít RCB-5520 ",
  "Nồi cơm điện tử Philips 1.8 lít HD4515/55 ",
  "Nồi cơm cao tần Sunhouse Mama 1.5 lít SHD8955 ",
  "Nồi cơm nắp gài Delites 1.8 lít NCG1805 ",
  "Nồi cơm điện tử AVA 1.8 lít TP40-CT01E ",
];
var nameOfMayEpTraiCay = [
  "Máy ép trái cây AVA AJ02",
  "Máy ép chậm BlueStone SJB-6556",
  "Máy ép chậm Hafele HS-J32X (535.43.393)",
  "Máy ép trái cây Crystal GS-333",
  "Máy ép trái cây Tefal ZE420D38",
  "Máy ép chậm AVA SJ-009",
  "Máy ép chậm Kangaroo KG150SJ ",
  "Máy xay ép đa năng BlueStone BLB-5343 ",
  "Máy ép trái cây Sunhouse SHD5520 ",
  "Máy ép trái cây Philips HR1811 ",
  "Máy ép chậm Hafele GS-133N (535.43.811)",
  "Máy ép chậm Sunhouse Mama SHD5505 ",
  "Máy ép trái cây Tefal ZC150838    ",
  "Máy xay ép đa năng Panasonic MJ-M176PWRA   ",
  "Máy ép trái cây BlueStone JEB-6545 ",
];
var nameOfMayXaySinhTo = [
  "Máy làm sữa hạt đa năng Magic A-96 bạc ",
  "Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh",
  "Máy xay sinh tố đa năng BlueStone BLB-5339",
  "Máy xay sinh tố Kangaroo KG4B3 ",
  "Máy xay sinh tố đa năng Philips HR2041/10 - 2 cối ",
  "Máy làm sữa hạt đa năng Tefal BL83SD66 ",
  "Máy xay sinh tố đa năng Philips HR2041/50 - 3 cối ",
  "Máy xay sinh tố đa năng Toshiba MX-60T(H) ",
  "Máy xay sinh tố đa năng Kangaroo KG3B2",
  "Máy làm sữa hạt Rapido RHB-1800D ",
  "Máy xay sinh tố Kangaroo KGBL1000X",
  "Máy xay sinh tố đa năng AVA BL328",
  "Máy làm sữa hạt đa năng Tefal BL967B66 ",
  "Máy xay sinh tố đa năng Toshiba BL-70PR1NV",
  "Máy xay sinh tố đa năng AVA YX-906N",
];

var nameOfBepGa = [
  "Bếp ga đôi Sakura SA-695SG ",
  "Bếp ga đôi Sakura SA-2181EB",
  "Bếp ga đôi Sunhouse SHB3365 ",
  "Bếp ga đôi Sunhouse SHB 201MT",
  "Bếp ga đôi Electrolux ETG7266GKR ",
  "Bếp ga đôi Sunhouse Mama MMBB0787MT ",
  "Bếp ga mini Namilux NH-P3031AS",
  "Bếp ga đôi Kangaroo KG519M",
  "Bếp ga đôi Kangaroo KG8G1A ",
  "Bếp ga đôi Sunhouse SHB3326MT",
  "Bếp ga mini Duxton DG-150 ",
  "Bếp ga đôi Rinnai RV-MC27BE",
  "Bếp ga đôi Electrolux ETG7286GKR",
  "Bếp ga đôi Apex APB3551",
  "Bếp ga đôi Electrolux ETG7256GKR",
  "Bếp ga đôi Kangaroo KG8G1C",
];

var nameofBinhDun = [
  "Bình đun siêu tốc Delites 1.8 lít ST18S05",
  "Bình đun siêu tốc Sunhouse 1.8 lít SHD1353",
  "Bình đun siêu tốc Sunhouse 1.8 lít SHD1182",
  "Bình đun siêu tốc Delites 1.5 lít ST15S01",
  "Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL",
  "Bình đun siêu tốc Delites 1.8 lít ST18S04",
  "Bình đun siêu tốc Toshiba 1.7 lít KT-17SH2NV",
  "Bình đun siêu tốc Delites 1.7 lít FD-625",
  "Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen ",
  "Bình đun siêu tốc Sunhouse 1.8 lít SHD1351 ",
  "Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389 ",
  "Bình đun siêu tốc Delites 1.8 lít ST18DB01 ",
  "Bình đun siêu tốc BlueStone 1.7 lít KTB-3417 ",
  "Bình đun siêu tốc BlueStone 1.5 lít KTB-3453 kem ",
  "Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330",
  "Bình đun siêu tốc Delites 1 lít ST10P01 ",
  "Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B ",
];

function _addProduct(
  nameProduct,
  nameImg,
  nameFolderImg,
  nameFolderDetail,
  maxPrice,
  minPrice,
  quantity
) {
  var sizeProduct = nameProduct.length;
  var randomProduct = parseInt(Math.random() * (sizeProduct - 0) + 0);

  for (let index = 1; index <= quantity; index++) {
    var randomProduct = parseInt(Math.random() * (sizeProduct - 0) + 0);
    var randomImg = parseInt(Math.random() * (14 - 1) + 1);
    var randomImgHover = parseInt(Math.random() * (14 - 1) + 1);

    var randomPrice = parseInt(
      Math.random() * (maxPrice - minPrice) + minPrice
    );
    var randomPriceSale = parseInt(
      Math.random() * (randomPrice * 0.7 - randomPrice * 0.2) +
      randomPrice * 0.2
    );

    var eProduct = `<div class="col-lg-3 col-sm-6 col-md-4 product">
      <i class="fa-solid fa-bag-shopping fly_to_card"></i>
      <div class="product_img">
          <img src="${nameFolderImg}/${nameImg + randomImg}.jpg" alt="">
          <div class="product_img_hover">
              <img src="${nameFolderImg}/${nameImg + randomImgHover
      }.jpg" alt="">
          </div>
      </div>
      <div class="product_in4">
          <p class="product_in4_name_product">${nameProduct[randomProduct]}</p>
          <div class="product_in4_bottom">
              <div>
                  <p class="product_in4_price">${randomPrice}₫</p>
                  <p class="product_in4_sale_price">${randomPriceSale}₫</p>
              </div>
              <div class="product_in4_wishlist no_wishlist">
                  <i class="fa-solid fa-heart"></i>
                  <span class="hint_wishlist">yêu thích</span>
              </div>
          </div>
      </div>
    
      <div class="product_btn">
          <button href="" class=" product_btn-add_card_none a">Thêm vào giỏ</button>
          <a href="${nameFolderDetail}" class=" product_btn--product_detail_none a">xem thêm</a>
      </div>
    </div>
    `;

    var elementProductList = document.querySelector(".product_list .row");
    elementProductList.innerHTML += eProduct;
  }
}
