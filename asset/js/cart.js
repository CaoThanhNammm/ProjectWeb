// Cú pháp viết tắt
var $ = document.querySelector.bind(document);
var $$ = document.querySelectorAll.bind(document);

document.addEventListener('DOMContentLoaded', function () {
    update()
})

function update() {
    updateCountItem('.cart_head_count', count('.cart_body_list', '.card'));
}


/*
Create: Nguyễn Khải Nam
Date: 21/10/2023
Note: Hàm tăng giảm số lượng
*/
function quantityAdjust(self, name, option) {
    var e = self.parentElement.querySelector(name)
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
    Note: Xử lý check thanh toán
*/
function checkAbate(e, name) {
    let check = true;
    let generalName = '';
    let mainElement = null;
    for (let i = 0; i < e.classList.length; i++) {
        if (e.classList[i].endsWith('all')) {
            mainElement = e
            check = false;
            break;
        } else {
            generalName = e.classList[i]
        }
    }

    name = name.replace('.', '');
    if (check) {
        toggle(e, name)
    } else {
        let isRemove = false
        if (mainElement.classList.contains(name))
            isRemove = true

        var items = $$('.' + generalName).forEach(item => {
            if (item.classList.contains(name) && isRemove) {
                item.classList.remove(name);
            } else if (!(item.classList.contains(name) || isRemove)) {
                item.classList.add(name);
            }
        })
    }
}


/*
    Create: Nguyễn Khải Nam
    Date: 21/10/2003
    Note: Đếm số lượng phần tử con trong một class nào đó
*/
function count(parent, child) {
    return $(parent).querySelectorAll(child).length
}

/*
    Create: Nguyễn Khải Nam
    Date: 21/10/2003
    Note: Cập nhật giá trị cho name nào đó
*/
function updateCountItem(name, value) {
    if ($(name)) {
        $(name).innerHTML = value
    }
}

/*
    Create: Nguyễn Khải Nam
    Date: 22/10/2003
    Note: Loại bỏ name khỏi class nếu đã tồn tại ngược lại thêm vào
*/
function toggle(e, name) {
    if (e.classList.contains(name)) {
        e.classList.remove(name);
    } else {
        e.classList.add(name);
    }
}

/*
    Create: Nguyễn Khải Nam
    Date: 22/10/2003
    Note: Loại bỏ item khỏi class
*/
function removeItem(parentClass, child, name) {
    name = name.replace('.', '')
    while (!child.classList.contains(name)) {
        child = child.parentElement
    }
    $(parentClass).removeChild(child)
    update()
}

