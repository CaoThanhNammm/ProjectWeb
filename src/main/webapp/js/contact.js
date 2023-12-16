/**
 * Create: Nguyễn Khải Nam
 * Date: 15/12/2023
 * Note: Dùng để lấy các thông tin link 
 */
var $ = document.querySelector.bind(document)

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

function _setLinks() {
	const inputs = [$('#address-fb'), $('#address-linkedin'), $('#address-instagram')]
	const linkInps = []
	
	inputs.forEach(input => {
		linkInps.push(input.value)
	})
	
	
	for(let i = 0; i < linkInps.length; ++i) {
		links.forEach(e => {
			if(e.name === linkInps[i]) {
				inputs[i].value = e.link
			}
		})
	}
}

_setLinks()