package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
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
				"SELECT id, name, value FROM attributes JOIN  product_details ON id = attributeID AND productID=?",
				idProduct).mapToBean(Attribute.class).list();
		return ats;
	}

	public List<Attribute> getAll() {
		List<Attribute> ats = handle.select("SELECT id, name FROM attributes").mapToBean(Attribute.class).list();
		return ats;
	}

	public Attribute getAttributeByName(int pid, String name) {
		Attribute at = handle.select(
				"SELECT id, name, value FROM attributes JOIN product_details ON id = attributeID AND productID=? AND name LIKE ?",
				pid, name + "%").mapToBean(Attribute.class).findFirst().orElse(null);
		return at;
	}

	public boolean haveId(int id) {
		return handle.select("SELECT id, name FROM attributes WHERE id=?", id).mapToBean(Attribute.class).findFirst()
				.orElse(null) != null;
	}

	public boolean insertAttribute(int pid, Attribute at) throws SQLException {
		// TODO Auto-generated method stub
		boolean re = false;
		if (haveId(at.getId())) {
			String sql = "UPDATE product_details SET value=? WHERE attributeID=?";
			PreparedStatement ps = handle.getConnection().prepareStatement(sql);
			ps.setString(1, at.getValue());
			ps.setInt(2, at.getId());
			re = ps.executeUpdate() > 0;
			ps.close();
		} else {
			String sql = "INSERT INTO attributes (id, name) VALUES (?, ?)";
			PreparedStatement ps1 = handle.getConnection().prepareStatement(sql);
			ps1.setInt(1, at.getId());
			ps1.setString(2, at.getName());
			re = ps1.executeUpdate() > 0;
			ps1.close();
			if (!re)
				return false;
			sql = "INSERT INTO product_details VALUES (?, ?, ?)";
			PreparedStatement ps2 = handle.getConnection().prepareStatement(sql);
			ps2.setInt(1, pid);
			ps2.setInt(2, at.getId());
			ps2.setString(3, at.getValue());
			re &= ps2.executeUpdate() > 0;
			ps2.close();
		}
		return re;
	}
}
