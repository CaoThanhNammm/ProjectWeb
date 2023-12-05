package dao;

import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Category;

public class CategoriesDAO {
	private Handle handle;

	public CategoriesDAO(Handle handle) {
		super();
		this.handle = handle;
	}

	public List<Category> getAll() {
		List<Category> categories = handle.select("SELECT id, name FROM categories").mapToBean(Category.class).list();

		return categories;
	}

	public List<Category> getCategoryLimitN(int num) {
		List<Category> categories = handle.select("SELECT name FROM categories LIMIT ?").bind(0, num)
				.mapToBean(Category.class).list();

		return categories;
	}

	public boolean isExist(int id) {
		int exists = handle.select("SELECT EXISTS(SELECT id FROM categories where id = ?) as id").bind(0, id)
				.mapToBean(Integer.class).one();

		return exists == 1;
	}

}
