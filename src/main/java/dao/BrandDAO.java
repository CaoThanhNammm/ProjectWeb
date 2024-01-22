package dao;

import java.util.List;

import org.jdbi.v3.core.Handle;

import database.JDBIConnectionPool;
import model.Brand;
import model.Product;

public class BrandDAO {
	private Handle handle;
	private String pathImgs;

	public BrandDAO(Handle handle, String pathImgs) {
		super();
		this.handle = handle;
		this.pathImgs = pathImgs;
	}

	public boolean isExist(int id) {
		int exists = handle.select("SELECT EXISTS(SELECT id FROM brands where id = ?) as id").bind(0, id)
				.mapToBean(Integer.class).one();

		return exists == 1;
	}

	/*
	 * lấy ra thương hiệu của sản phẩm
	 */
	public List<Brand> getBrandOfProduct(String nameProduct) {
		List<Brand> brands = handle.select(
				"SELECT DISTINCT b.id, b.name FROM brands b JOIN products p ON b.id = p.brandID WHERE p.id IN (SELECT id FROM products WHERE name LIKE ?)")
				.bind(0, "%" + nameProduct + "%").mapToBean(Brand.class).list();

		for (Brand brand : brands) {
			brand.setPathImg(pathImgs);
		}
		return brands;
	}

	public Brand getBrand(int id) {
		Brand brand = handle.select("SELECT id, name FROM brands WHERE id=?", id)
				.map((rs, a) -> new Brand(rs.getInt("id"), rs.getString("name"))).findFirst().orElse(null);
		brand.setPathImg(pathImgs);
		return brand;
	}

	/*
	 * lấy ra tất cả sản phẩm
	 */
	public List<Brand> getAll() {
		List<Brand> bs = handle.select("SELECT id, name FROM brands").mapToBean(Brand.class).list();
		bs.forEach(e -> {
			e.setPathImg(pathImgs);
		});
		return bs;
	}

}
