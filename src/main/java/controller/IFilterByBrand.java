package controller;

import java.util.List;

import model.Brand;
import model.Product;

public interface IFilterByBrand {
	List<Product> chooseBrands(String name, List<Brand> brandID, String pathImg);
}
