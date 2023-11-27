package database;

import java.util.List;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

public class test {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		List<Object> object = JDBIConnector.getConnection().withHandle(new HandleCallback<List<Object>, Exception>() {
			@Override
			public List<Object> withHandle(Handle o) throws Exception {
				return (List<Object>) o.createQuery("select * from users");
			}
		});
		System.out.println(object);
	}

}
