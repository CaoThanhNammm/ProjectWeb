/**
 * Create: Nguyễn Khải Nam
 * Date: 15/12/2023
 * Note: Dùng để lấy các thông tin link 
 */
var $ = document.querySelector.bind(document)

document.addEventListener('DOMContentLoaded', function() {
	_setLinks()
	_change()
})

const inputs = [$('#address-fb'), $('#address-linkedin'), $('#address-instagram')]

var links = [
	{
		"name": "facebook",
		"link": "https://www.facebook.com/groups/vietnammemes/"
	},
	{
		"name": "linkedin",
		"link": "https://www.linkedin.com/?trk=content-hub-home-page_nav-header-logo"
	},
	{
		"name": "instagram",
		"link": "https://www.instagram.com/rick_astley_memes/"
	}
]

const linkInps = []

inputs.forEach(input => {
	linkInps.push(input.value)
})

function _setLinks() {
	for (let i = 0; i < linkInps.length; ++i) {
		links.forEach(e => {
			if (e.name === linkInps[i]) {
				inputs[i].value = e.link
			}
		})
	}
}

function updateLink(index, value) {
	links[index].link = value
	_setLinks()
}

function _change() {
	for (let i = 0; i < inputs.length; ++i) {
		inputs[i].addEventListener("blur", e => {
			updateLink(i, inputs[i].value)
		})
	}
}