package system;

import com.mysql.cj.jdbc.MysqlDataSource;
import database.JDBIConnectionPool;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 * Lớp này dùng để chạy một vài thứ khi khởi động Server
 */
public class ServerListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setURL("jdbc:mysql://localhost:3306/N2Q");
            dataSource.setUser("root");
            dataSource.setPassword("");
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
            JDBIConnectionPool.init(dataSource, 10, 2000);
        } catch (SQLException e) {
            System.out.println("[system.ServerListener]: Chạy DB xem còn lỗi nữa không");
            throw new RuntimeException(e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //Chưa có gì
    }
}
