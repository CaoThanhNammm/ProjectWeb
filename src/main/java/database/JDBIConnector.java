package database;

import static database.IInfoDatabase.DB_NAME;
import static database.IInfoDatabase.HOST;
import static database.IInfoDatabase.PASS;
import static database.IInfoDatabase.PORT;
import static database.IInfoDatabase.USER;

import java.sql.SQLException;

import org.jdbi.v3.core.Jdbi;

import com.mysql.cj.jdbc.MysqlDataSource;

public class JDBIConnector {
	private static Jdbi jdbi;

	private static void makeConnect() {
		MysqlDataSource dataSource = new MysqlDataSource();
		dataSource.setURL("jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME);

		dataSource.setUser(USER);
		dataSource.setPassword(PASS);
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
