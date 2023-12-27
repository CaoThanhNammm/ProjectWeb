package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterPriceInRange implements IFilterByPrice {
	private int from;
	private int to;

	public FilterPriceInRange(int from, int to) {
		super();
		this.from = from;
		this.to = to;
	}

	@Override
	public List<Product> filterProduct(String name) {
		// TODO Auto-generated method stub
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn);

		List<Product> products = productDAO.getProductsInRangePrice(name, from, to);
		JDBIConnectionPool.get().releaseConnection(conn);

		return products;
	}

}
