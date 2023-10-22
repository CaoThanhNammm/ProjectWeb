var elementModal = document.querySelector('.modal_overlay');
var elementModalBody = document.querySelector('.modal_body');
var elementIconAllList = document.querySelector('.all_list');
var elementQuitIcon = document.querySelector(".modal_body_quit");

/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý bắt đầu ấn vào tất cả danh mục
*/
function startSlideAllList(){
    elementIconAllList.onclick = function(){
        slideLeftToRightAllList();
    }
}

/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức css cho các modal để hiển thị lên màn hình
*/
function slideLeftToRightAllList(){
    elementModal.style.zIndex = 1;
    elementModal.style.opacity = 1;
    elementModalBody.style.left = '0';

}

/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý khi băt đầu ấn vào tắt danh mục,
     ấn vào nút X hoặc nhấn ra ngoài danh mục
*/
function clickQuit(){
    elementQuitIcon.onclick = function(){
        quitSlide();
    }
    elementModal.onclick = function(){
        quitSlide();
    }
}

/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý để modal tắt khỏi màn hình
*/
function quitSlide(){
    elementModal.style.zIndex = -1;
    elementModal.style.opacity = 0;
    elementModalBody.style.left = '-30%';
    
    setTimeout(function(){
        elementCategoryItem.forEach(function(value, index){
            resetSlide(index);
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
function resetSlide(index){
    elementCategoryChildItem[index].classList.replace('active', 'unactive');
    elementIconDown[index].classList.replace('icon_up_rotate', 'icon_down_rotate');
}


/*
    Create: Cao Thành Nam
    Date: 22/10/2023
    Note: phương thức xử lý khi ấn vào từng item sẽ hiện lên item con
*/
function clickChildItem(){
    elementCategoryItem.forEach(function(value, index){
        value.onclick = function(){
            value.classList.toggle("category_all_item_border");
            elementCategoryChildItem[index].classList.toggle('active');
            elementIconDown[index].classList.toggle('icon_up_rotate');
        }
    });
}

startSlideAllList();
clickQuit();
clickChildItem();