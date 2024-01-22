document.addEventListener("DOMContentLoaded", function() {
	activeEventFilterProductByOrder();
	activeEventFilterProductByBrand();

});


function edit(id) {
	window.location = "editProduct?id-product=" + id + '&status=edit';
}

function hideP(id) {
	window.location = "editProduct?id-product=" + id + '&status=hide';
}

function activeEventFilterProductByBrand() {
	elementBrandsProduct.addEventListener("change", function() {
		var selectedIndex = elementBrandsProduct.selectedIndex;
		window.location = "FindProductAdmin?brand=" + elementBrandsProduct.options[selectedIndex].value;
	})
}

function activeEventFilterProductByOrder() {

	elementPriceProduct.addEventListener("change", function() {
		var selectedIndex = elementPriceProduct.selectedIndex;
		window.location = "FindProductAdmin?order=" + elementPriceProduct.options[selectedIndex].value;
	})
}


var elementPriceProduct = document.getElementById("price_admin");
var elementBrandsProduct = document.getElementById("brands_admin");

