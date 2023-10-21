// Cú pháp viết tắt
var $ = document.querySelector.bind(document);
var $$ = document.querySelectorAll.bind(document);

document.addEventListener('DOMContentLoaded', function () {
    hoverChangeProductImg();
    addWishList();
})
/*
Create: Cao Thành Named
Date: 19/10/2023
Note: thay đổi hình ảnh khi đưa chuột vào sản phẩm
*/
function hoverChangeProductImg() {
    var elementProduct = document.querySelectorAll(".product");

    elementProduct.forEach(function (value, index) {
        var elementProductImg = value.querySelector(".product_img img");
        var elementProductBtn = value.querySelectorAll(".product_btn a");

        value.onmouseover = function () {
            elementProductImg.setAttribute("src", "asset\\image\\jpg\\content_introduce.jpg");
            value.style.border = "1px solid var(--gray-second)";
            elementProductBtn[0].classList.replace("product_btn-add_card_none", "product_btn-add_card");
            elementProductBtn[1].classList.replace("product_btn--product_detail_none", "product_btn--product_detail");
        }

        value.onmouseout = function () {
            elementProductImg.setAttribute("src", "asset\\image\\jpg\\product_img.jpg");
            value.style.border = "none";
            elementProductBtn[0].classList.replace("product_btn-add_card", "product_btn-add_card_none");
            elementProductBtn[1].classList.replace("product_btn--product_detail", "product_btn--product_detail_none");
        }
    });
}

/*
Create: Cao Thành Named
Date: 19/10/2023
Note: nếu ấn vào wishlist thì sản phẩm được thêm vào wishlist
*/
function addWishList() {
    var elementHeartIcon = document.querySelectorAll(".product_in4_wishlist");
    elementHeartIcon.forEach(function (value) {
        value.onclick = function () {
            value.classList.toggle("add_wish_list");
        }
    });

}

/*
Create: Nguyễn Khải Nam
Date: 21/10/2023
Note: Hàm tăng giảm số lượng
*/
function quantityAdjust(name, option) {
    var e = $(name)
    var min = e.getAttribute('min')
    var max = e.getAttribute('max')
    var value = e.getAttribute('value')
    var step = e.getAttribute('step')

    var calcStep = (option === '-' ? -1 : 1) * step
    let newValue = parseInt(value) + calcStep

    console.log(max, min, value, step)

    if (min <= newValue && newValue <= max) {
        e.setAttribute('value', newValue)
    }
}

/*
    Create: 
    Date: 21/10/2003
    Note: Cập nhật phần tử 1 thành 2
*/
function swapClass(name1, name2) {
    var e = $(name1)
    if (e) {
        name1 = name1.replace('.', '')
        name2 = name2.replace('.', '')
        e.classList.add(name2)
        e.classList.remove(name1)
    } else {
        e = $(name2)
        name1 = name1.replace('.', '')
        name2 = name2.replace('.', '')
        e.classList.add(name1)
        e.classList.remove(name2)
    }
}