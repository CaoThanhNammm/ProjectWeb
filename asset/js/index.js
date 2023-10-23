<<<<<<< HEAD
=======

>>>>>>> master
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
<<<<<<< HEAD
            elementProductImg.setAttribute("src", "\\asset\\image\\jpg\\content_introduce.jpg");
=======
            elementProductImg.setAttribute("src", "asset\\image\\jpg\\content_introduce.jpg");
>>>>>>> master
            value.style.border = "1px solid var(--gray-second)";
            elementProductBtn[0].classList.replace("product_btn-add_card_none", "product_btn-add_card");
            elementProductBtn[1].classList.replace("product_btn--product_detail_none", "product_btn--product_detail");
        }

        value.onmouseout = function () {
<<<<<<< HEAD
            elementProductImg.setAttribute("src", "\\asset\\image\\jpg\\product_img.jpg");
=======
            elementProductImg.setAttribute("src", "asset\\image\\jpg\\product_img.jpg");
>>>>>>> master
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
<<<<<<< HEAD
=======

>>>>>>> master
function addWishList() {
    var elementHeartIcon = document.querySelectorAll(".product_in4_wishlist");
    elementHeartIcon.forEach(function (value) {
        value.onclick = function () {
<<<<<<< HEAD
            value.classList.checkAbate("add_wish_list");
=======
            value.classList.toggle("add_wish_list");
>>>>>>> master
        }
    });
}