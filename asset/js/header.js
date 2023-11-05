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
    elementIconAllList.onclick = function () {
        _slideLeftToRightAllList();
    }

    elementWistListIcon.onclick = function(){
        _slideRightToLefttAllList();
    }

    elementWistListIconMobile.onclick = function(){
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
    elementQuitIcon.onclick = function () {
        _quitSlide();
    }
    elementModal.onclick = function () {
        _quitSlide();
    }
    elementQuitIconWishList.onclick = function () {
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
    
    setTimeout(function () {
        elementCategoryItem.forEach(function (value, index) {
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
    elementCategoryItem.forEach(function (value, index) {
        value.onclick = function () {
            value.classList.toggle("category_all_item_border-none");
            elementCategoryChildItem[index].classList.toggle('active');
            elementIconDown[index].classList.toggle('icon_up_rotate');
        }
    });
}


var elementWistListIcon = document.querySelector(".list_wishList");
var elementWistListIconMobile = document.querySelector(".list_wishList--mobile");
var elementModalBodyWishList = document.querySelector(".modal_body_wishList");
var elementQuitIconWishList = document.querySelector(".modal_body_quit_wishlist");

var elemmentQuantity = document.querySelector(".header_cart_amount_product");


elemmentQuantity.innerHTML = elemmentQuantity.innerHTML + " ";