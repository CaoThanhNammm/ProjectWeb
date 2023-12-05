package dao;

import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Category;

public class BrandDAO {
	private Handle handle;

	public BrandDAO(Handle handle) {
		super();
		this.handle = handle;
	}

	public boolean isExist(int id) {
		int exists = handle.select("SELECT EXISTS(SELECT id FROM brands where id = ?) as id")
				.bind(0, id)
				.mapToBean(Integer.class).one();
		
		return exists == 1;
	}


}
