/**
 * Create: Nguyễn Khải Nam
 * Date: 13/11/2023
 * Note: Thực hiện các công việc xóa, điều chỉnh sản phẩm, thêm sản phẩm
 */
var $ = document.querySelector.bind(document)
var $$ = document.querySelectorAll.bind(document)

document.addEventListener("DOMContentLoaded", function () {
    _imageSlider()
})

// Tên phần tử sản phẩm
var nProduct = 'card-deck'
var nParentProduct = 'card-products'

// Các nội dung
var nText = 'card-text'
var nTitle = 'card-title'

// Phần tử ảnh
var nImg = 'slider_main'

// Có cho phép điều chỉnh
var flag = true
var isEdit = false

// Sản phẩm
var eProduct = `
<div class="card-deck">
<div class="card">
<div class="card_img_top col-5">
    <div class="slider_main">
        <img src="../image/detail/img1.jpg" alt="img1">
    </div>
    <div class="slider_images">
        <img class="slider_image active" src="../image/detail/img1.jpg" alt="img1">
        <img class="slider_image" src="../image/detail/img2.jpg" alt="img2">
        <img class="slider_image" src="../image/detail/img3.jpg" alt="img3">
        <img class="slider_image" src="../image/detail/img4.jpg" alt="img4">
        <img class="slider_image" src="../image/detail/img5.jpg" alt="img5">
        <img class="slider_image" src="../image/detail/img6.jpg" alt="img6">
    </div>
</div>
<div class="card-body col-7">
    <h5 class="card-title">Tiêu đề</h5>
    <p class="card-text">Nội dung</p>
    <p>Trị giá: <span class="card-text">Giá</span> VND / <span class="card-text"> Số lượng 
        </span> sản phẩm</p>
    <p>Thương hiệu: <span class="card-text">Tên thương hiệu</span></p>
    <p>Màu: <span class="card-text">Màu sắc</span></p>
    <p>Chất liệu: <span class="card-text">Chất liệu</span></p>
    <p>Kích thước (Dài x Rộng x Cao): <span class="card-text"></span>cm x <span
            class="card-text"></span>cm x <span class="card-text"></span>cm</p>
    <p>Dung tích: <span class="card-text">Số dung tích</span>lít</p>
    <p>Số lượng: <span class="card-text">Số lượng</span></p>
    <div>
        <button class="btn btn-danger" onclick="hideProduct(this)">Ẩn đi</button>
        <button class="btn btn-warning" onclick="editProduct(this)">Điều chỉnh</button>
    </div>
</div>
</div>
</div>`

// Hàm ẩn sản phẩm: eBtn - phần tử btn
function hideProduct(eBtn) {
    var node = findElement(eBtn, nProduct)
    var status = ['Ẩn đi', 'Hiển thị']
    if (eBtn.innerText === status[0]) {
        if (isEdit) {
            alert('Sản phẩm đang điều chỉnh không ẩn đi được')
        } else {
            var check = confirm('Sản phẩm này sẽ được ẩn đi. Bạn có chắc với hành động của mình?')
            if (check) {
                eBtn.innerText = status[1]
                node.style.color = '#ccc'
                flag = false
            }
        }
    } else {
        var check = confirm('Sản phẩm này sẽ được hiển thị. Bạn có chắc với hành động của mình?')
        if (check) {
            eBtn.innerText = status[0]
            node.style.color = '#000'
            flag = true
        }
    }
}

// Hàm điều chỉnh sản phẩm
function editProduct(eBtn) {
    if (flag) {
        // Nội dung
        isEdit = true
        var node = findElement(eBtn, nProduct)
        subEditProduct(node.querySelectorAll('.' + nTitle))
        subEditProduct(node.querySelectorAll('.' + nText))
        var titles = ['Điều chỉnh', 'Hoàn tất']
        if (eBtn.innerText === titles[0]) {
            eBtn.innerText = titles[1]
        } else {
            eBtn.innerHTML = titles[0]
            isEdit = false
        }

        // Hình ảnh
        var img = node.querySelector('.' + nImg)
        if (img.parentNode.innerHTML.includes('input')) {
            img.parentNode.querySelector('input').remove()
        } else {
            var input = document.createElement('input')
            input.setAttribute('type', 'file')
            input.setAttribute('value', 'Lựa chọn file của bạn')
            img.parentNode.insertBefore(input, img.nextSibling)
        }
    }
}

function subEditProduct(nodes) {
    nodes.forEach(node => {
        var check = node.innerHTML.includes('input')
        if (check) {
            var input = node.querySelector('input')
            node.innerText = input.value
        } else {
            node.style = '-webkit-line-clamp: 0;'
            node.innerHTML = `<input type='text' value='${node.innerText}' style="width: 100%;"/>`
        }
    })
}

// Hàm tìm phần tử
function findElement(e, name) {
    while (!e.classList.contains(name)) {
        e = e.parentElement
    }
    return e
}

// Chuyển đổi slide ảnh
function _imageSlider() {
    var images = document.querySelectorAll('.slider_image');
    var mainImage = document.querySelector('.slider_main img');

    images.forEach((image, index) => {
        image.addEventListener('click', () => {
            images.forEach((img) => img.classList.remove('active'));
            image.classList.add('active');
            mainImage.src = image.src;
        });
    });
}

// Thêm sản phẩm
function addProduct() {
    var parentProduct = $('.' + nParentProduct)
    parentProduct.innerHTML = eProduct + parentProduct.innerHTML
}