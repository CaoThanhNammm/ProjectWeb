package controller;

import java.util.List;

import model.Product;

public interface IFilterByPrice {
	List<Product> filterProduct(String nameProduct, String pathImg);
}
