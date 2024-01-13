document.addEventListener("DOMContentLoaded", function() {

})

var $ = document.querySelector.bind(document)
var $$ = document.querySelectorAll.bind(document)

function addAttributeTable() {
	let parent = $('#e-table');
	let tr = document.createElement('tr');
	let btn = document.createElement('button');

	btn.innerHTML = '<i class="fa-solid fa-trash"></i>';
	btn.setAttribute('class', 'btn btn-warning');
	btn.addEventListener('click', function() {
		removeAttributeTable(tr)
	})

	let td1 = document.createElement('td');
	td1.setAttribute('class', 'table_title');
	td1.innerHTML = '<span><textarea class="w-100 e-txt"></textarea><button class="btn">&nbsp;</button></span>';

	let td2 = document.createElement('td');
	let b = document.createElement('b');
	b.setAttribute('class', 'e-info');
	b.innerHTML = '<span><textarea class="w-100 e-txt"></textarea></span>';
	b.querySelector('span').appendChild(btn);
	td2.appendChild(b);

	tr.appendChild(td1);
	tr.appendChild(td2);

	parent.append(tr);
}



function removeAttributeTable(e) {
	let etxts = e.getElementsByClassName('e-txt');
	let check = Array.from(etxts).reduce((isNull, e) => isNull && e.innerText, true);

	let re = true
	if (check) {
		let confirm = confirm('Bạn có chắc muốn loại bỏ thuộc tính này?')
		if (!confirm) {
			re = false
		}
	}

	if (re) {
		if (e && e.parentNode) {
			e.parentNode.removeChild(e);
		}
	}
}

function cancel() {
	let check = confirm('Bạn có chắc hủy bỏ thay đổi không?')
	if (check) {
		location.reload()
	}
}

function checkFileCount(input) {
	let maxFiles = 6;
	if (input.files.length > maxFiles) {
		alert("Bạn chỉ có thể chọn tối đa " + maxFiles + " tệp!!!");
		input.value = '';
	} else {
		for (let i = 0; i < input.files.length; i++) {
			let reader = new FileReader();
			let preview = $('#e-img-' + i)
			let eActive = $('#e-img-active')

			if (preview) {
				reader.onload = function(e) {
					preview.src = e.target.result;
					if (i == 0)
						eActive.src = e.target.result;
				}

				reader.readAsDataURL(input.files[i]);
			}
		}
	}
}

function updateImg(input) {
	let preview = $('img.active');

	if (input.files && input.files[0]) {
		let reader = new FileReader();
		let eActive = $('#e-img-active')

		reader.onload = function(e) {
			preview.src = e.target.result;
			eActive.src = e.target.result;
		};

		reader.readAsDataURL(input.files[0]);
	}

}

function edit(pid) {
	let btn = $('.e-btn')
	let parent = $('#form-product')
	if (btn.name === 'edit') {
		let check = confirm('Điều chỉnh sẽ làm thay đổi nội dung của sản phẩm. Bạn có chắc chắn không?')
		if (check) {
			let classInfos = $$('.e-info')
			classInfos.forEach(e => {
				let input = document.createElement('textarea')
				input.setAttribute('class', 'w-100 e-txt')
				input.innerText = e.innerText
				e.innerHTML = ''
				e.appendChild(input)
			})

			btn.name = 'close'
			btn.innerHTML = 'Hoàn tất'

			let btnCancel = document.createElement('button')
			btnCancel.setAttribute('class', 'btn w-100 btn-secondary mt-3')
			btnCancel.addEventListener("click", cancel);
			btnCancel.innerHTML = 'Hủy bỏ'
			let comFunction = $('#e-function')
			comFunction.appendChild(btnCancel)

			let mainImg = $('#e-img')

			// Cập nhật ảnh hiện tại
			let btnImg = document.createElement('button')
			btnImg.setAttribute('class', 'btn btn-info e-btn-file me-5')
			btnImg.innerHTML = 'Chỉnh ảnh hiện tại'
			let eImg = document.createElement('input')
			eImg.setAttribute('type', 'file')
			eImg.setAttribute('accept', '.jpg, .jpeg, .png')
			eImg.addEventListener('change', function() {
				updateImg(eImg);
			})
			btnImg.appendChild(eImg)
			mainImg.appendChild(btnImg)

			// Cập nhật toàn bộ ảnh
			let btnImgs = document.createElement('button')
			btnImgs.setAttribute('class', 'btn e-btn-file btn-info')
			btnImgs.innerHTML = 'Chỉnh toàn bộ ảnh'
			let eImgs = document.createElement('input')
			eImgs.setAttribute('type', 'file')
			eImgs.setAttribute('accept', '.jpg, .jpeg, .png')
			eImgs.setAttribute('multiple', 'multiple')
			eImgs.addEventListener('change', function() {
				checkFileCount(eImgs);
			})
			btnImgs.appendChild(eImgs)
			mainImg.appendChild(btnImgs)

			let eAdd = $('#e-add')
			let addBtn = document.createElement('button')
			addBtn.setAttribute('class', 'btn')
			addBtn.innerHTML = '<i class="fa-solid fa-pen-to-square"></i>'
			addBtn.addEventListener('click', function() {
				console.log("Button clicked");
				addAttributeTable()
			})
			eAdd.appendChild(addBtn)

			let form = document.createElement('form')
			form.addEventListener('submit', function(event) {
				event.preventDefault();
			})
			while (parent.firstChild) {
				form.appendChild(parent.firstChild);
			}
			form.setAttribute('action', 'editProduct?status=update&id-product=' + pid)
			form.setAttribute('method', 'post')
			form.setAttribute('id', 'form-product')
			parent.parentNode.replaceChild(form, parent)
		}
	} else {
		let check = confirm('Hoàn tất điều chỉnh. Bạn có chắc chắn không?')
		if (check) {
			let classInfos = $$('.e-info')
			classInfos.forEach(e => {
				let child = e.querySelector('.e-txt')
				e.innerHTML = child.value
				child.remove()
			})
			btn.innerHTML = 'Điều chỉnh sản phẩm'
			btn.name = 'edit'
			parent.addEventListener('submit', function(event) {
				parent.submit()
			})
		}
	}
}