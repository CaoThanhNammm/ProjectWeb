package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterEmptyPrice implements IFilterByPrice {
	private String nameProduct;

	public FilterEmptyPrice(String nameProduct) {
		super();
		this.nameProduct = nameProduct;
	}

	public List<Product> filterProduct(String pathImg) {

		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn, pathImg);
		List<Product> productsDefault = productDAO.findProductByNameLimitN(nameProduct, "2");

		JDBIConnectionPool.get().releaseConnection(conn);
		return productsDefault;

	}

}
