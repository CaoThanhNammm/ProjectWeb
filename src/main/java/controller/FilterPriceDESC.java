package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterPriceDESC implements IFilterByPrice {

	@Override
	public List<Product> filterProduct(String name) {
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn);
		List<Product> productsDESC = productDAO.sortByDiscountDESC(name);
		JDBIConnectionPool.get().releaseConnection(conn);

		return productsDESC;
	}

}
