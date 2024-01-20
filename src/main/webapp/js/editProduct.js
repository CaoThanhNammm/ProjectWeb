var $ = document.querySelector.bind(document)
var $$ = document.querySelectorAll.bind(document)

function addAttributeTable() {
	let parent = $('#e-table');
	let tr = document.createElement('tr');

	let btn = document.createElement('button');
	btn.innerHTML = '<i class="fa-solid fa-trash"></i>';
	btn.setAttribute('class', 'btn btn-warning');
	btn.addEventListener('click', function() {
		removeAttributeTable(btn)
	})

	let ainput = document.createElement('input')
	ainput.setAttribute('type', 'hidden')
	ainput.setAttribute('name', 'p-at-name')

	let vinput = document.createElement('input')
	vinput.setAttribute('type', 'hidden')
	vinput.setAttribute('name', 'p-at-value')


	let txta1 = document.createElement('textarea');
	txta1.setAttribute('class', 'w-100 e-txt');
	txta1.addEventListener('input', function(e) {
		ainput.value = e.target.value;
	});

	let b1 = document.createElement('button')
	b1.setAttribute('class', 'btn')
	b1.innerHTML = '&nbsp;'

	let td1 = document.createElement('td');
	td1.setAttribute('class', 'table_title');
	td1.innerHTML = '<span></span>';
	td1.querySelector('span').appendChild(txta1);
	td1.querySelector('span').appendChild(b1);

	let txta2 = document.createElement('textarea');
	txta2.setAttribute('class', 'w-100 e-txt');
	txta2.addEventListener('input', function(e) {
		vinput.value = e.target.value;
	});

	let td2 = document.createElement('td');

	let b = document.createElement('b');
	b.setAttribute('class', 'e-info');
	b.innerHTML = '<span></span>';
	b.querySelector('span').appendChild(txta2);
	b.querySelector('span').appendChild(btn);
	td2.appendChild(b);

	tr.appendChild(ainput)
	tr.appendChild(vinput)
	tr.appendChild(td1);
	tr.appendChild(td2);

	parent.append(tr);
}



function removeAttributeTable(btn) {
	var e = btn.closest('tr')
	let etxts = e.getElementsByClassName('e-txt')
	let check = Array.from(etxts).reduce((isNull, e) => isNull && e.value, true)

	let re = true
	if (check) {
		let isConfirm = confirm('Bạn có chắc muốn loại bỏ thuộc tính này?')
		if (!isConfirm) {
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
	let i = preview.id.substring(preview.id.length - 1, preview.id.length);

	if (input.files && input.files[0]) {
		let reader = new FileReader();
		let eActive = $('#e-img-active')
		let inp = $('.e-inp-' + i)

		reader.onload = function(e) {
			preview.src = e.target.result;
			eActive.src = e.target.result;
			inp.value = i + ',' + e.target.result;
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
				changeInput(input)
				e.innerHTML = ''
				e.appendChild(input)
			})

			let e_old_empty = $$('.e-old-empty')
			e_old_empty.forEach(e => {
				let btn = document.createElement('button')
				btn.setAttribute('class', 'btn')
				btn.innerHTML = '&nbsp;'
				e.appendChild(btn)
			})

			let e_old_btn = $$('.e-old-btn')
			e_old_btn.forEach(e => {
				let btn = document.createElement('button');
				btn.innerHTML = '<i class="fa-solid fa-trash"></i>';
				btn.setAttribute('class', 'btn btn-warning');
				btn.addEventListener('click', function() {
					removeAttributeTable(btn)
				})
				e.appendChild(btn)
			})

			btn.name = 'close'
			btn.innerHTML = 'Hoàn tất'

			let e_selects = $$('.e-select')
			e_selects.forEach(e_select => {
				for (var i = 0; i < e_select.options.length; i++) {
					var option = e_select.options[i];

					if (option.classList.contains("d-none")) {
						option.classList.remove("d-none");
						option.classList.add("d-block");
					}
				}
			})

			let e_select_brand = $('.e-select-brand')
			e_select_brand.addEventListener("change", function() {
				let input = $('input[name="p-brand"]')
				input.value = e_select_brand.value;
			});

			let e_select_cate = $('.e-select-category')
			e_select_cate.addEventListener("change", function() {
				let input = $('input[name="p-category"]')
				input.value = e_select_cate.value;
			});

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
			parent.addEventListener('submit', function(e) {
				parent.submit()
			})
		}
	}
}

function changeInput(e_txt) {
	if (e_txt) {
		e_txt.addEventListener('change', function(e) {
			let trElement = e_txt.closest('td');
			let inp = trElement.querySelector('input');
			inp.value = e_txt.value;
		});
	}
}
