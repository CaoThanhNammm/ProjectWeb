package dao;

import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Product;
import model.ProductModel;

public class ProductModelDAO {
	private Handle handle;

	/**
	 * @param handle
	 */
	public ProductModelDAO(Handle handle) {
		super();
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
}
