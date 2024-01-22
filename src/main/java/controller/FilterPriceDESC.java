package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterPriceDESC implements IFilterByPrice {
	private String nameProduct;

	public FilterPriceDESC(String nameProduct) {
		super();
		this.nameProduct = nameProduct;
	}

	@Override
	public List<Product> filterProduct(String pathImg) {
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn, pathImg);
		List<Product> productsDESC = productDAO.sortByDiscountDESC(nameProduct, 2);
		JDBIConnectionPool.get().releaseConnection(conn);

		return productsDESC;
	}

}
