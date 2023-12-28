package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterEmpty implements IFilterByPrice {

	@Override
	public List<Product> filterProduct(String name, String pathImg) {
		
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn, pathImg);
		List<Product> productsDefault = productDAO.findProductByNameLimitN(name);
		JDBIConnectionPool.get().releaseConnection(conn);

		return productsDefault;
	}

}
