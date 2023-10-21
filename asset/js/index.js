
/*
Create: Cao Thành Named
Date: 20/10/2023
Note: hiện ra 2 nút thêm vào giở hàng và xem chi tiết sản phẩm
*/

function hoverChangeProductImg(){
    var elementProduct = document.querySelectorAll(".product");
    var elementProductFooter = document.querySelectorAll(".product_btn");

    elementProduct.forEach(function(value, index){
        var elementProductBtn = value.querySelectorAll(".product_btn a");

        value.onmouseover = function(){
            elementProductBtn[0].classList.replace("product_btn-add_card_none", "product_btn-add_card");
            elementProductBtn[1].classList.replace("product_btn--product_detail_none", "product_btn--product_detail");
        }

        value.onmouseout = function(){
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

function addWishList(){
    var elementHeartIcon = document.querySelectorAll(".product_in4_wishlist");
    elementHeartIcon.forEach(function(value){
        value.onclick = function(){
            value.classList.toggle("add_wish_list");
        }
    });

}

var active = 0
var elementImgItem = document.querySelectorAll(".img_item");
var elementImgList = document.querySelector(".img_list")
var length = elementImgItem.length;
var elementLeft = document.querySelector(".left");
var elementRight = document.querySelector(".right");

function moveLeft(){
    elementLeft.onclick = function(){
        if(active === 0) {
            active = length;
        }
        active--;
        reloadSlider();
    }
}
function moveRight(){
    elementRight.onclick = function(){
        if(active === length - 1) {
            active = -1;
        }
        active++;
        reloadSlider();
    }
}

function autoSlider(){
    setInterval(function(){
        elementRight.click();
    }, 5000);
}

function reloadSlider(){
    var checkLeft = elementImgItem[active].offsetLeft;
    elementImgList.style.left = -checkLeft + "px";
}
