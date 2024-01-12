package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterPriceInRange implements IFilterByPrice {
	private String nameProduct;
	private int from;
	private int to;

	public FilterPriceInRange(String nameProduct, int from, int to) {
		super();
		this.nameProduct = nameProduct;
		this.from = from;
		this.to = to;
	}

	@Override
	public List<Product> filterProduct(String pathImg) {
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn, pathImg);

		List<Product> products = productDAO.getProductsInRangePrice(nameProduct, from, to);
		JDBIConnectionPool.get().releaseConnection(conn);

		return products;
	}

}
