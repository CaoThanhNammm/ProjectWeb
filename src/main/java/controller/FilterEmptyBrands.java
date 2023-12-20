package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Brand;
import model.Product;

public class FilterEmptyBrands implements IFilterByBrand {

	@Override
	public List<Product> chooseBrands(String name, List<Brand> brandID) {
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn);
		List<Product> productsOfBrand = productDAO.getProductDefaultByBrand(name);

		JDBIConnectionPool.get().releaseConnection(conn);
		return productsOfBrand;
	}

}
