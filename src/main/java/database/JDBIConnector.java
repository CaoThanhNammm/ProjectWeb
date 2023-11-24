package database;

import java.sql.SQLException;

import org.jdbi.v3.core.Jdbi;

import com.mysql.cj.jdbc.MysqlDataSource;

public class JDBIConnector {
	private static Jdbi jdbi;

	private static void makeConnect() {
		MysqlDataSource dataSource = new MysqlDataSource();
		dataSource.setURL("jdbc:mysql://localhost:3306/login");

		dataSource.setUser("root");
		dataSource.setPassword("");
		try {
			dataSource.setUseCompression(true);
			dataSource.setAutoReconnect(true);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
			throw new RuntimeException(throwables);
		}
		jdbi = Jdbi.create(dataSource);
	}

	private JDBIConnector() {
	}

	public static Jdbi getConnection() {
		if (jdbi == null)
			makeConnect();
		return jdbi;
	}
}
