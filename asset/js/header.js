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
<<<<<<< HEAD
function startSlideAllList() {
    elementIconAllList.onclick = function () {
        slideLeftToRightAllList();
=======
function _startSlideAllList(){
    elementIconAllList.onclick = function(){
        _slideLeftToRightAllList();
>>>>>>> master
    }
}

/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức css cho các modal để hiển thị lên màn hình
*/
<<<<<<< HEAD
function slideLeftToRightAllList() {
=======
function _slideLeftToRightAllList(){
>>>>>>> master
    elementModal.classList.toggle("active")
    elementModalBody.style.left = '0';
    elementBody.classList.add('hidden_overflow');
}
/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý khi băt đầu ấn vào tắt danh mục,
     ấn vào nút X hoặc nhấn ra ngoài danh mục
*/
<<<<<<< HEAD
function clickQuit() {
    elementQuitIcon.onclick = function () {
        quitSlide();
    }
    elementModal.onclick = function () {
        quitSlide();
=======
function _clickQuit(){
    elementQuitIcon.onclick = function(){
        _quitSlide();
    }
    elementModal.onclick = function(){
        _quitSlide();
>>>>>>> master
    }
}

/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý để modal tắt khỏi màn hình
*/
<<<<<<< HEAD
function quitSlide() {
=======
function _quitSlide(){
>>>>>>> master
    elementModal.classList.remove("active")
    elementModalBody.style.left = -$(elementModalBody).width() + "px";
    elementBody.classList.remove('hidden_overflow');
<<<<<<< HEAD

    setTimeout(function () {
        elementCategoryItem.forEach(function (value, index) {
            resetSlide(index);
=======
    
    setTimeout(function(){
        elementCategoryItem.forEach(function(value, index){
            _resetSlide(index);
>>>>>>> master
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
<<<<<<< HEAD
function resetSlide(index) {
=======
function _resetSlide(index){
>>>>>>> master
    elementCategoryChildItem[index].classList.replace('active', 'unactive');
    elementIconDown[index].classList.replace('icon_up_rotate', 'icon_down_rotate');
    elementCategoryItem[index].classList.remove('category_all_item_border-none');
}


/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý khi ấn vào từng item sẽ hiện lên item con
*/
<<<<<<< HEAD
function clickChildItem() {
    elementCategoryItem.forEach(function (value, index) {
        value.onclick = function () {
=======
function _clickChildItem(){
    elementCategoryItem.forEach(function(value, index){
        value.onclick = function(){
>>>>>>> master
            value.classList.toggle("category_all_item_border-none");
            elementCategoryChildItem[index].classList.toggle('active');
            elementIconDown[index].classList.toggle('icon_up_rotate');
        }
    });
}

_startSlideAllList();
_clickQuit();
_clickChildItem();