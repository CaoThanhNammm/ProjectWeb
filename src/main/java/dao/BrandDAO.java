package dao;

import java.util.List;

import org.jdbi.v3.core.Handle;

import database.JDBIConnectionPool;
import model.Brand;
import model.Product;

public class BrandDAO {
	private Handle handle;

	public BrandDAO(Handle handle) {
		super();
		this.handle = handle;
	}

	public boolean isExist(int id) {
		int exists = handle.select("SELECT EXISTS(SELECT id FROM brands where id = ?) as id").bind(0, id)
				.mapToBean(Integer.class).one();

		return exists == 1;
	}

	public List<Brand> getBrandOfProduct(String findNameProduct) {

		List<Brand> brands = handle.select(
				"SELECT DISTINCT b.id, b.name FROM brands b JOIN products p ON b.id = p.brandID WHERE p.id IN (SELECT id FROM products WHERE name LIKE ?)")
				.bind(0, "%" + findNameProduct + "%").mapToBean(Brand.class).list();

		return brands;
	}


}
