package dao;

import java.util.ArrayList;
import java.util.List;

import database.JDBIConnector;
import model.Product;

public class ProductDAO {
	public List<Product> getAll() {
		List<Product> products = JDBIConnector.getConnection().withHandle(h -> h.createQuery(
				"SELECT id, name, brandID, description, categoryID, price, discount, lastUpdated, amountSold, statusID FROM products")
				.mapToBean(Product.class).list());
		return products;
	}

	public void save(Product product) {

	}

	public void update(Product product) {

	}

	public void hide(Product product) {

	}

	public void show(Product product) {

	}

	public List<Product> findProductByName(String name) {
		if (name.equals(""))
			return new ArrayList<>();

		List<Product> products = JDBIConnector.getConnection()
				.withHandle(h -> h.createQuery("SELECT name, price, discount FROM products where name like ?")
						.bind(0, "%" + name + "%").mapToBean(Product.class).list());
		
		return products;
	}
	
	public List<Product> findProductByNameLimitN(String name, int num) {
		if (name.equals(""))
			return new ArrayList<>();

		List<Product> products = JDBIConnector.getConnection()
				.withHandle(h -> h.createQuery("SELECT id, name, price, discount FROM products where name like ? limit ?")
						.bind(0, "%" + name + "%")
						.bind(1, num)
						.mapToBean(Product.class).list());
		
		return products;
	}
}