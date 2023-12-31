package controller;

import java.util.ArrayList;
import java.util.List;

import model.Brand;
import model.Product;

public class FilterStrategy implements IFilterStrategy {
	private IFilterByPrice filterPrice;
	private IFilterByBrand filterBrand;

	public FilterStrategy(IFilterByPrice filterPrice, IFilterByBrand filerBrand) {
		super();
		this.filterPrice = filterPrice;
		this.filterBrand = filerBrand;
	}

	@Override
	public List<Product> filter(String name, List<Brand> brands, String pathImg) {
		List<Product> productByPrice = filterPrice(name, pathImg);
		List<Product> productByBrands = chooseBrands(name, brands, pathImg);

		List<Product> res = new ArrayList<>();

		if (productByPrice.size() == 0 && productByBrands.size() == 0) {
			return res;
		} else if (productByPrice.size() == 0) {
			return productByBrands;
		} else if (productByBrands.size() == 0) {
			return productByPrice;
		}

		for (Product pPrice : productByPrice) {
			for (Product pBrand : productByBrands) {
				if (pPrice.equals(pBrand)) {
					res.add(pPrice);
				}
			}
		}

		return res;
	}

	@Override
	public List<Product> filterPrice(String name, String pathImg) {
		return filterPrice.filterProduct(name, pathImg);
	}

	@Override
	public List<Product> chooseBrands(String name, List<Brand> brands, String pathImg) {
		return filterBrand.chooseBrands(name, brands, pathImg);
	}

}
