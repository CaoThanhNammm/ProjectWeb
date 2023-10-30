/**
 * Create: Nguyễn Khải Nam
 * Date: 30/10/2023
 * Note: Thiết lập các hành động cho trang productAdmin
 */

// Chuyển sang trạng thái cập nhật sản phẩm
function transitionStatus(e, nameRoot) {
    var root = findRoot(e, nameRoot)

    //  Thêm nút edit ảnh
    var btnEdit = root.querySelector('button.card-edit')
    if (btnEdit) {
        root.removeChild(btnEdit)
    } else {
        var btn = document.createElement('button')
        btn.classList.add('btn', 'card-edit')
        var icon = document.createElement('i')
        icon.classList.add('fa-solid', 'fa-pen')
        btn.appendChild(icon);
        btn.onclick = () => {

        }
        root.querySelector('img').parentElement.insertBefore(btn, root.querySelector('img').nextSibling)
    }

    // Điều chỉnh các thẻ span thành input và lưu lại nội dung nếu chỉnh sửa
    var flag = true
    var title = root.querySelectorAll('span')
    title.forEach(e => {
        if (e.children[0] && e.children[0].tagName.toLowerCase() == 'input') {
            flag = false
            e.innerHTML = `${e.children[0].value}`
        } else {
            e.innerHTML = `<input type="text" value="${e.innerHTML}" />`;
        }
    });
    e.innerText = flag ? 'Xong' : 'Chỉnh sửa'
}

// Tìm phẩn tử cha
function findRoot(e, nameRoot) {
    var root = $(nameRoot)[0]
    while (e !== root)
        e = e.parentElement
    return e
}

function editImgs(e) {

}