/**
 * Create: Nguyễn Khải Nam
 * Note: Kiểm soát điều chỉnh thông tin của admin
 * Date: 15/12/2023
 */
var $ = document.querySelector.bind(document)
var isChange = true

function _control() {
	if (isChange) {
		var check = confirm("Chấp nhận điều chỉnh thông tin ?")
		if (check) {
			var btn = $('.submit')
			btn.innerText = 'Hoàn tất'
			var inputs = $('.form-group').querySelectorAll('input')
			inputs.forEach(e => {
				e.removeAttribute('readonly')
			})
			$('.upload').style.display = 'inline-block'
			$('.resest-password').style.display = 'inline-block'
			
			isChange = false 
		}
	} else {
		var check = confirm('Bạn có chắc muốn điều chỉnh thông tin')
		if (check) {
			_changeElement('#form', 'form')
		}
	}
}

function _changeElement(name1, name2) {
	var e1 = $(name1)
	var old = $(name1)
	var e2 = document.createElement(name2);
	e2.setAttribute("id", old.id)
	e2.setAttribute("action", "infoAdmin")
	e2.setAttribute("method", "post")

	while (e1 != null && e1.firstChild) {
		e2.appendChild(e1.firstChild);
	}
	old.parentNode.replaceChild(e2, old);
}
