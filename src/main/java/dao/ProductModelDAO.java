package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Product;
import model.ProductModel;
import model.Status;

public class ProductModelDAO {
	private Handle handle;

	/**
	 * @param handle
	 */
	public ProductModelDAO(Handle handle) {
		this.handle = handle;
	}

	public List<ProductModel> getModels(Product product) {
		StatusDAO statusDAO = new StatusDAO(handle);
		if(product == null)
			return null;
		List<ProductModel> ps = handle
				.createQuery("SELECT id, productID, optionValue, statusID FROM product_models WHERE productID=?")
				.bind(0, product.getId()).map((rs, a) -> new ProductModel(rs.getInt("id"), product,
						rs.getString("optionValue"), statusDAO.getStatus(rs.getInt("statusID"))))
				.list();
		return ps;
	}

	public ProductModel getModelByID(int modelID) {
		try {
			StringBuilder sql1 = new StringBuilder();
			sql1.append("SELECT productID, optionValue, statusID ");
			sql1.append("FROM product_models ");
			sql1.append("WHERE id = ?");
			PreparedStatement statement = handle.getConnection().prepareStatement(sql1.toString());
			statement.setInt(1, modelID);
			ResultSet rs = statement.executeQuery();
			if (!rs.next()) {
				return null;
			}
			int productID = rs.getInt(1);
			String optionValue = rs.getString(2);
			StatusDAO statusDAO = new StatusDAO(handle);
			Status status = statusDAO.getStatus(rs.getInt(3));

			StringBuilder sql2 = new StringBuilder();
			sql2.append("SELECT name, price, discount, statusID ");
			sql2.append("FROM products ");
			sql2.append("WHERE id = ?");
			statement = handle.getConnection().prepareStatement(sql2.toString());
			statement.setInt(1, productID);
			rs = statement.executeQuery();
			if (!rs.next()) {
				return null;
			}
			String name = rs.getString(1);
			int price = rs.getInt(2);
			int discount = rs.getInt(3);
			Status productStatus = statusDAO.getStatus(rs.getInt(4));
			Product product = new Product(productID, name, null, null, null, price, discount, null, 0, productStatus,
					null);
			return new ProductModel(modelID, product, optionValue, status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
