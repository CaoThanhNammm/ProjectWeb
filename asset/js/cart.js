var $$ = document.querySelectorAll.bind(document)

<<<<<<< HEAD
/*
Create: Nguyễn Khải Nam
Date: 21/10/2023
Note: Tạo hành đồng cho sản phẩm
*/

=======
// Cú pháp viết tắt
>>>>>>> master
document.addEventListener('DOMContentLoaded', function () {
    _update()
})

/*
Note: Hàm tăng giảm số lượng
*/
function _quantityAdjust(self, name, option) {
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
    Note: Xử lý check thanh toán
*/
function _checkAbate(e, name) {
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
        _toggle(e, name)
    } else {
        let isRemove = false
        if (mainElement.classList.contains(name))
            isRemove = true

        $$('.' + generalName).forEach(item => {
            if (item.classList.contains(name) && isRemove) {
                item.classList.remove(name);
            } else if (!(item.classList.contains(name) || isRemove)) {
                item.classList.add(name);
            }
        })
    }
}


/*
    Note: Đếm số lượng phần tử con trong một class nào đó
*/
function _count(parent, child) {
    return $(parent)[0].querySelectorAll(child).length
}

/*
    Note: Cập nhật giá trị cho name nào đó
*/
function _updateCountItem(name, value) {
<<<<<<< HEAD
    if ($(name))
        $(name).innerHTML = value
=======
    if ($(name)) {
        $(name)[0].innerHTML = value
    }
>>>>>>> master
}

/*
    Note: Loại bỏ name khỏi class nếu đã tồn tại ngược lại thêm vào
*/
function _toggle(e, name) {
    if (e.classList.contains(name)) {
        e.classList.remove(name);
    } else {
        e.classList.add(name);
    }
}

/*
    Note: Loại bỏ item khỏi class
*/
function _removeItem(parentClass, child, name) {
    name = name.replace('.', '')
    while (!child.classList.contains(name)) {
        child = child.parentElement
        if (!child)
            console.log('Sai cấu trúc cho chỗ cart')
    }
    $(parentClass)[0].removeChild(child)
    _update()
}

/*
    Note: Tự động cập nhật giá trị cho trang cart
*/
function _update() {
<<<<<<< HEAD
    let count = + _count('.cart_body_list', '.card')
    $('.cart_body-empty').style.display = count > 0 ? 'none' : 'block'
    $('.cart_body-item').style.display = count > 0 ? 'flex' : 'none'
=======
    let count = 0
    count = _count('.cart_body_list', '.card')
    $('.cart_body-empty')[0].style.display = count > 0 ? 'none' : 'block'
    $('.cart_body-item')[0].style.display = count > 0 ? 'flex' : 'none'
>>>>>>> master
    _updateCountItem('.cart_head_count', count);
}