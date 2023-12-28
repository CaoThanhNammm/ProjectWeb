package controller;

import java.util.List;

import model.Brand;
import model.Product;

public interface IFilterStrategy {

	List<Product> filterPrice(String name, String pathImg);

	List<Product> chooseBrands(String name, List<Brand> brandID, String pathImg);

	List<Product> filter(String name, List<Brand> brandID, String pathImg);

}
