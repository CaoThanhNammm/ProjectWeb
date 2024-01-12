package controller;

import java.util.List;

import model.Brand;
import model.Product;

public interface IFilterStrategy {

	List<Product> filterPrice(String pathImg);

	List<Product> chooseBrands(String pathImg);

	List<Product> filter(String pathImg);

}
