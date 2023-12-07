package dao;

import org.jdbi.v3.core.Handle;

public class StatusDAO {
	private Handle handle;

	public StatusDAO(Handle handle) {
		super();
		this.handle = handle;
	}

	public boolean isExist(int id) {
		int exists = handle.select("SELECT EXISTS(SELECT id FROM status where id = ?) as id")
				.bind(0, id)
				.mapToBean(Integer.class).one();
		
		return exists == 1;
	}

}
