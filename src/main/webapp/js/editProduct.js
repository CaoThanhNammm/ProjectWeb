document.addEventListener("DOMContentLoaded", function() {

})

var $ = document.querySelector.bind(document)
var $$ = document.querySelectorAll.bind(document)

function edit() {
	var btn = $('.e-btn')
	var parent = $('#form-product')
	if (btn.name === 'edit') {
		let check = confirm('Điều chỉnh sẽ làm thay đổi nội dung của sản phẩm. Bạn có chắc chắn không?')
		if (check) {
			let classInfos = $$('.e-info')
			classInfos.forEach(e => {
				let input = document.createElement('textarea')
				input.setAttribute('class', 'w-100 e-txt')
				input.value = e.innerHTML
				e.innerHTML = ''
				e.appendChild(input)
			})
			btn.name = 'close'
			btn.innerHTML = 'Hoàn tất'
			var form = document.createElement('form')
			form.addEventListener('submit', function(event) {
				event.preventDefault();
			})
			while (parent.firstChild) {
				form.appendChild(parent.firstChild);
			}
			form.setAttribute('action', 'editProduct?status=update')
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