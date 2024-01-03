package dao;

import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Attribute;

public class AttributeDAO {
	private Handle handle;

	/**
	 * @param handle
	 */
	public AttributeDAO(Handle handle) {
		super();
		this.handle = handle;
	}

	public List<Attribute> getAttributes(int idProduct) {
		List<Attribute> ats = handle.select(
				"SELECT id, name FROM attributes WHERE id IN (SELECT attributeID FROM product_details WHERE productID=?)",
				idProduct).mapToBean(Attribute.class).list();
		return ats;
	}
}
