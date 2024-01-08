package controller;

import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

public class FilterEmpty implements IFilterByPrice {

	@Override
	public List<Product> filterProduct(String nameProduct, String pathImg) {

		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn, pathImg);
		List<Product> productsDefault;

		productsDefault = productDAO.findProductByNameLimitN(nameProduct);
		JDBIConnectionPool.get().releaseConnection(conn);

		return productsDefault;

	}

}
