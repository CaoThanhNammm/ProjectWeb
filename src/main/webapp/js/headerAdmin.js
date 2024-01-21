document.addEventListener('DOMContentLoaded', function() {
	_slideTopToBottom();
	_loadTabState();
	_addElementChildActive();
	_activeGeneral();
})


function _slideTopToBottom() {
	elementNavlink.forEach(function(value) {

		value.onclick = function() {
			var elementChildNavLink = value.parentElement.querySelector(".nav-item_list_child");
			elementChildNavLink.classList.toggle("active_child");
			localStorage.clear();
			// lấy ra những tab đã được sổ xuống
			var elementParentActive = document.querySelectorAll(".active_child")
			// thêm tất cả các tab được sổ xuống vào localStorage
			elementParentActive.forEach(function(value) {
				var idActive = value.getAttribute("id");
				localStorage.setItem(idActive, "open");
			})

		}
	})
}

// load tất cả các tab được sổ xuống đã được lưu trong localStorage và giữ nguyên trạng thái của nó
function _loadTabState() {
	elementParentActive.forEach(function(value) {
		var idActive = value.getAttribute("id");
		var elementChildActive = value.querySelectorAll(".nav-item_item_child")

		// những tab được sổ xuống có value là "open"
		if (localStorage.getItem(idActive) === "open") {
			value.classList.add("active_child");
		}

		// lặp qua từng con một của cha
		elementChildActive.forEach(function(value) {
			// lấy ra id của con
			var id = value.getAttribute("id")
			// nếu id của con đã có trong localStorage thì active
			if (localStorage.getItem(id) === "open") {
				value.classList.add("active");
			}
		})

		// active tab tổng quan
		if (localStorage.getItem("nav-item_item_child-GENERAL") === "open") {

			elementGeneral.parentElement.classList.add("active")
		}
	})
}

// phương thức thêm con của tab đã được sổ xuống vào localStorage
function _addElementChildActive() {
	// lặp qua từng con một
	elementChildActive.forEach(function(value) {
		value.onclick = function() {
			// xóa hết những cái hiện có 
			localStorage.clear();

			// lấy ra cha của con được ấn
			var elementParentActive = value.parentElement;

			// lấy id của cha và con
			var idOfParent = elementParentActive.getAttribute("id");
			var idOfChild = value.getAttribute("id");

			// thêm cha và con được ấn vào localStorage
			localStorage.setItem(idOfChild, "open");
			localStorage.setItem(idOfParent, "open");
		}
	})
}

function _activeGeneral() {
	elementGeneral.onclick = function() {
		localStorage.clear();
		localStorage.setItem("nav-item_item_child-GENERAL", "open");
	}
}

var elementGeneral = document.querySelector("#nav-item_item_child-GENERAL");
var elementNavItem = document.querySelectorAll(".nav-item");
var elementNavlink = document.querySelectorAll(".nav-link");
var elementParentActive = document.querySelectorAll(".nav-item_list_child");
var elementChildActive = document.querySelectorAll(".nav-item_item_child");
