document.addEventListener("DOMContentLoaded", function() {
	activeEventFilterProductByBrand()
	activeEventFilterProductByOrder()
});

function unhideP(id) {
	window.location = "editProduct?id-product=" + id + '&status=unhide';
}

function activeEventFilterProductByBrand() {
	elementBrandsProduct.addEventListener("change", function() {
		var selectedIndex = elementBrandsProduct.selectedIndex;
		window.location = "FindProductHiddenAdmin?brand=" + elementBrandsProduct.options[selectedIndex].value;
	})
}

function activeEventFilterProductByOrder() {
	elementPriceProduct.addEventListener("change", function() {
		var selectedIndex = elementPriceProduct.selectedIndex;
		window.location = "FindProductHiddenAdmin?order=" + elementPriceProduct.options[selectedIndex].value;
	})
}

var elementPriceProduct = document.getElementById("price_admin");
var elementBrandsProduct = document.getElementById("brands_admin");