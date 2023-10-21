// Cú pháp viết tắt
var $ = document.querySelector.bind(document);
var $$ = document.querySelectorAll.bind(document);

document.addEventListener('DOMContentLoaded', function () {
    hoverChangeProductImg();
    addWishList();
    updateCountItem('.cart_head_count', count('.cart_body_list', '.card'));
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

    if (min <= newValue && newValue <= max) {
        e.setAttribute('value', newValue)
    }
}

/*
    Create: Nguyễn Khải Nam
    Date: 21/10/2003
    Note: Thêm class hoặc xóa nếu đã tồn tại
*/
function toggle(e, name) {
    console.log(e)
    name = name.replace('.', '')
    if (e.classList.contains(name)) {
        e.classList.remove(name)
    } else {
        e.classList.add(name)
    }
}

/*
    Create: Nguyễn Khải Nam
    Date: 21/10/2003
    Note: Đếm số lượng phần tử trong một class nào đó
*/
function count(parent, child) {
    return $(parent).querySelectorAll(child).length
}

/*
    Create: Nguyễn Khải Nam
    Date: 21/10/2003
    Note: Cập nhật giá trị cho name nào đó
*/
function updateCountItem(name, count) {
    if ($(name)) {
        $(name).innerHTML = count
    }
}