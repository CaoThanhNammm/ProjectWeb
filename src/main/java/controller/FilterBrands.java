package controller;

import java.util.List;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Brand;
import model.Product;

public class FilterBrands implements IFilterByBrand {
	private String name;
	private List<Brand> brandChoice;

	public FilterBrands(String name, List<Brand> brandChoice) {
		super();
		this.name = name;
		this.brandChoice = brandChoice;
	}

	@Override
	public List<Product> chooseBrands(String pathImg) {
		Handle conn = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(conn, pathImg);
		List<Product> productsOfBrand = productDAO.getProductByBrand(name, brandChoice);
		JDBIConnectionPool.get().releaseConnection(conn);

		return productsOfBrand;
	}

}
