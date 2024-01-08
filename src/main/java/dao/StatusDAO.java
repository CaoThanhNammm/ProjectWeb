package dao;

import org.jdbi.v3.core.Handle;

import model.Status;

public class StatusDAO {
	private Handle handle;

	public StatusDAO(Handle handle) {
		super();
		this.handle = handle;
	}

	public boolean isExist(int id) {
		int exists = handle.select("SELECT EXISTS(SELECT id FROM status where id = ?) as id").bind(0, id)
				.mapToBean(Integer.class).one();

		return exists == 1;
	}

	public Status getStatus(int id) {
		Status status = handle.select("SELECT id, name FROM product_status WHERE id=?", id).mapToBean(Status.class).one();
		return status;
	}

}
