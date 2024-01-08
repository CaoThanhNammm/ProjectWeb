package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Brand;
import model.Product;

public class ProductDAO {
	private Handle handle;
	private String pathImg;

	public ProductDAO(Handle handle, String pathImg) {
		this.handle = handle;
		this.pathImg = pathImg;
	}

	// lấy ra tất cả sản phẩm
	public List<Product> getAll() throws SQLException {
		List<Product> products = handle.select("SELECT id, name, price, discount FROM products")
				.mapToBean(Product.class).list();
		return products;
	}

	// thêm sản phẩm vào danh sách
	public List<Product> save(Product product) throws SQLException {
		BrandDAO brandDao = new BrandDAO(this.handle, pathImg);
		CategoriesDAO categoriesDAO = new CategoriesDAO(this.handle);
		StatusDAO statusDao = new StatusDAO(this.handle);

		if (brandDao.isExist(product.getBrand().getId()) || categoriesDAO.isExist(product.getBrand().getId())
				|| statusDao.isExist(product.getBrand().getId())) {
			handle.execute(
					"INSERT INTO product(name, brandID, description, categoryID, price, discount, statusID) values(?, ? ,? ,? ,? ,? ,? ,?)",
					product.getName(), product.getBrand().getId(), product.getDescription(),
					product.getCategory().getId(), product.getPrice(), product.getDiscount(),
					product.getStatus().getId());
		} else {
			System.out.println("có thể bandID hoặc categoryID hoặc statusID không tồn tại");
		}

		return getAll();
	}

	// cập nhập lại số lượng bán của sản phẩm, truyền vào id và số lượng bán mới
	public List<Product> updateAmountSold(int productID, int quantity) throws SQLException {
		if (isExistID(productID)) {
			handle.execute("UPDATE products set amoundSold = ? where id = ?", quantity, productID);
		} else {
			System.out.println("không tìm thấy id");
		}

		return getAll();
	}

	// cập nhập lại giá của sản phẩm, truyền vào id sản phẩm và giá mới
	public List<Product> updatePrice(int productID, int newPrice) throws SQLException {

		if (isExistID(productID)) {
			handle.execute("UPDATE products set price = ? where id = ?", newPrice, productID);
		} else {
			System.out.println("không tìm thấy id");
		}

		return getAll();
	}

	// cập nhập lại giá khuyến mãi của sản phẩm, truyền vào id sản phẩm và giá mới
	public List<Product> updateDiscount(int productID, int newDiscount) throws SQLException {

		if (isExistID(productID)) {
			handle.execute("UPDATE products set amoundSold = ? where id = ?", newDiscount, productID);
		} else {
			System.out.println("không tìm thấy id");
		}

		return getAll();
	}

	/*
	 * ẩn sản phẩm, truyền vào id sản phẩm muốn ẩn
	 */
	public List<Product> hide(int productID) throws SQLException {

		if (isExistID(productID)) {
			handle.execute("UPDATE products set status = ? where id = ?", productID, 1);
		} else {
			System.out.println("không tìm thấy id");
		}

		return getAll();
	}

	// tìm sản phẩm theo id
	public Product findProductByID(int productID) {
		if (productID < 0)
			return null;

		Product product = handle.select("SELECT id, name, price, discount FROM products where id = ?")
				.bind(0, productID).mapToBean(Product.class).first();

		product.setImgs(pathImg);

		return product;
	}

	// tìm sản phẩm giống 1 phần tên, truyền vào tên sản phẩm và số lượng sản phẩm
	// muốn lấy
	public List<Product> findProductByNameLimitN(String name, int num) {
		if (name == null)
			return new ArrayList<>();

		List<Product> products = handle
				.select("SELECT id, name, price, discount FROM products WHERE name LIKE ? LIMIT ?")
				.bind(0, "%" + name + "%").bind(1, num).mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	// tìm sản phẩm giống 1 phần tên, truyền vào tên sản phẩm
	public List<Product> findProductByNameLimitN(String name) {
		String regex = ".*[!@#\\$%^&*()_+=<>?/.,;:'\"\\[\\]{}\\\\|`~].*";

		if (name.matches(regex))
			return new ArrayList<>();

		List<Product> products = handle.select("SELECT id, name, price, discount FROM products WHERE name LIKE ?")
				.bind(0, "%" + name + "%").mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	public List<Product> findProductByNameLimitN(int id) {
		if (id < 0)
			return new ArrayList<>();

		List<Product> products = handle.select("SELECT id, name, price, discount FROM products WHERE categoryID = ?")
				.bind(0, id).mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	// lấy ra sản phẩm giảm giá cao nhất, truyền vào số sản phẩm muốn lấy
	// tính theo %
	public List<Product> getProductBestDiscount(int limit) {
		List<Product> products = handle
				.select("SELECT id, name, price, discount FROM products ORDER BY discount/price DESC LIMIT ?")
				.bind(0, limit).mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	// lấy ra sản phẩm random, truyền vào số sản phẩm muốn lấy
	public List<Product> getProductRecommend(int limit) {
		List<Product> products = handle.select("SELECT * FROM products ORDER BY RAND() LIMIT ?").bind(0, limit)
				.mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	// kiểm tra id của sản phẩm có tồn tại hay không
	private boolean isExistID(int id) {
		return findProductByID(id) != null;
	}

	// sắp xếp giá từ cao đến thấp
	public List<Product> sortByDiscountDESC(String name) {
		if (name.equals(""))
			return new ArrayList<>();
		List<Product> products = handle.select(
				"SELECT id, name, price, discount FROM products where name like ? ORDER BY price - discount DESC")
				.bind(0, "%" + name + "%").mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	// sắp xếp giá từ thấp đến cao
	public List<Product> sortByDiscountASC(String name) {
		if (name.equals(""))
			return new ArrayList<>();
		List<Product> products = handle.select(
				"SELECT id, name, price, discount FROM products where name like ? ORDER BY price - discount ASC")
				.bind(0, "%" + name + "%").mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}
		return products;
	}

	// lấy ra sản phẩm có thương hiệu, tên thương hiệu là tham số

	public List<Product> getProductByBrand(String name, List<Brand> brands) {
		if (name.equals(""))
			return new ArrayList<>();
		List<Product> res = new ArrayList<>();

		for (Brand brand : brands) {
			List<Product> products = handle.select(
					"SELECT p.id, p.name, p.price, p.discount FROM products p JOIN brands b ON p.brandID = b.id where b.id = ? and p.name like ?")
					.bind(0, brand.getId()).bind(1, "%" + name + "%").mapToBean(Product.class).list();

			for (Product product : products) {
				res.add(product);
			}
		}

		return res;
	}

	// lấy tất cả thương hiệu của tất sản phẩm, tên sản phẩm là tham số
	public List<Product> getProductDefaultByBrand(String name) {
		String regex = ".*[!@#\\$%^&*()_+=<>?/.,;:'\"\\[\\]{}\\\\|`~].*";
		if (name.matches(regex) || name.equals(""))
			return new ArrayList<>();

		List<Product> products = handle.select(
				"SELECT DISTINCT p.id, p.name, p.price, p.discount FROM brands b JOIN products p ON b.id = p.brandID WHERE p.id IN (SELECT id FROM products WHERE name LIKE ?)")
				.bind(0, "%" + name + "%").mapToBean(Product.class).list();

		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	// lấy ra sản phẩm có giá trong khoảng giá cho phép
	public List<Product> getProductsInRangePrice(String name, int from, int to) {
		List<Product> products = handle.select(
				"SELECT id, name, price, discount FROM products WHERE name LIKE ? and (price - discount) >= ? and (price - discount) <= ?")
				.bind(0, "%" + name + "%").bind(1, from).bind(2, to).mapToBean(Product.class).list();
		for (Product product : products) {
			product.setImgs(pathImg);
		}

		return products;
	}

	public int getMinPrice(String name) throws SQLException {
		String sql = "SELECT MIN(price - discount) as price FROM products WHERE name LIKE ?";

		PreparedStatement statement = handle.getConnection().prepareStatement(sql);
		statement.setString(1, "%" + name + "%");
		int res = 0;
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			res = rs.getInt("price");
		}
		return res;
	}

	public int getMaxPrice(String name) throws SQLException {
		String sql = "SELECT MAX(price - discount) as price FROM products WHERE name LIKE ?";

		PreparedStatement statement = handle.getConnection().prepareStatement(sql);
		statement.setString(1, "%" + name + "%");
		int res = 0;
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			res = rs.getInt("price");
		}
		return res;
	}

}