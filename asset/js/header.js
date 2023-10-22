var elementModal = document.querySelector('.modal_overlay');
var elementModalBody = document.querySelector('.modal_body');
var elementIconAllList = document.querySelector('.all_list');
var elementQuitIcon = document.querySelector(".modal_body_quit");

function startSlideAllList(){
    elementIconAllList.onclick = function(){
        slideLeftToRightAllList();
    }
}

function slideLeftToRightAllList(){
    elementModal.style.zIndex = 1;
    elementModal.style.opacity = 1;
    elementModalBody.style.left = '0';
    elementCategoryItem.forEach(function(value, index){
        elementCategoryChildItem[index].classList.replace('active', 'unactive');
    })
}

function clickQuit(){
    elementQuitIcon.onclick = function(){
        quitSlide();
    }
    elementModal.onclick = function(){
        quitSlide();
    }
}

function quitSlide(){
    elementModal.style.zIndex = -1;
    elementModal.style.opacity = 0;
    elementModalBody.style.left = '-30%';
}

var elementCategoryItem = document.querySelectorAll(".category_all_item");
var elementCategoryChildItem = document.querySelectorAll(".category_all_item_child_list");
var elementIconDown = document.querySelectorAll(".category_all_item_icon");

function clickChildItem(){
    elementCategoryItem.forEach(function(value, index){
        value.onclick = function(){
            value.classList.toggle("category_all_item_border");
            elementCategoryChildItem[index].classList.toggle('active');
            elementIconDown[index].classList.toggle('incon_down_rotate');
        }
    });
}