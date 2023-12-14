package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.jdbi.v3.core.Handle;

import database.JDBIConnectionPool;
import model.Category;
import model.Product;

public class ProductDAO {
	private Handle handle;
	
	public ProductDAO(Handle handle) {
		this.handle = handle;
	}

	// lấy ra tất cả sản phẩm
	public List<Product> getAll() throws SQLException {
		
		List<Product> products = new ArrayList<>();
		String qslStr = "SELECT p.id, p.name, b.id as bID, b.name as bName, p.description, c.id as cID, c.name as cName, p.price, p.discount, YEAR(p.lastUpdated) as year, MONTH(p.lastUpdated) as month, DAY(p.lastUpdated) as day, p.amountSold, s.id as sID, s.name as sName FROM "
				+ "products p JOIN brands b ON p.brandID = b.id " + "JOIN categories c ON p.categoryID = c.id "
				+ "JOIN product_status s ON p.statusID = s.id";
		
		PreparedStatement statement = handle.getConnection().prepareStatement(qslStr);
		
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			LocalDate lastUpdated = LocalDate.of(rs.getInt("year"), rs.getInt("month"), rs.getInt("day"));

			Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("bID"),
					rs.getString("bName"), rs.getString("description"), rs.getInt("cID"), rs.getString("cName"),
					rs.getInt("price"), rs.getInt("discount"), lastUpdated, rs.getInt("amountSold"), rs.getInt("sID"),
					rs.getString("cName"));
			products.add(product);
		}

		return products;
	}

	// thêm sản phẩm vào danh sách
	public List<Product> save(Product product) throws SQLException {
		BrandDAO brandDao = new BrandDAO(this.handle);
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
	 *  ẩn sản phẩm, truyền vào id sản phẩm muốn ẩn
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

		return product;
	}

	// tìm sản phẩm giống 1 phần tên, truyền vào tên sản phẩm và số lượng sản phẩm muốn lấy
	public List<Product> findProductByNameLimitN(String name, int num) {
		if (name.equals(""))
			return new ArrayList<>();

		List<Product> products = handle
				.select("SELECT id, name, price, discount FROM products where name like ? limit ?")
				.bind(0, "%" + name + "%").bind(1, num).mapToBean(Product.class).list();

		return products;
	}

	// lấy ra sản phẩm giảm giá cao nhất, truyền vào số sản phẩm muốn lấy
	// tính theo %
	public List<Product> getProductBestDiscount(int limit){
		List<Product> products = handle.select("SELECT id, name, price, discount FROM products ORDER BY discount/price DESC LIMIT ?")
				.bind(0, limit)
				.mapToBean(Product.class).list();
		
		return products;
	}
	
	// lấy ra sản phẩm random, truyền vào số sản phẩm muốn lấy
	public List<Product> getProductRecommend(int limit){
		List<Product> products = handle.select("SELECT * FROM products ORDER BY RAND() LIMIT ?")
				.bind(0, limit)
				.mapToBean(Product.class).list();
		
		return products;
	}

	// kiểm tra id của sản phẩm có tồn tại hay không
	private boolean isExistID(int id) {
		return findProductByID(id) != null;
	}

}