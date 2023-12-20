package controller;

import java.util.List;

import model.Brand;
import model.Product;

public interface IFilterStrategy {

	List<Product> filterProduct(String name);

	List<Product> chooseBrands(String name, List<Brand> brandID);

	List<Product> filter(String name, List<Brand> brandID);


}
