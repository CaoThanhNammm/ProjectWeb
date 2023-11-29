package database;

import database.JDBIConnectionPool;
import org.jdbi.v3.core.Handle;
import system.ServerListener;

public class StressTest {
    public static void main(String[] args) throws InterruptedException {
        ServerListener serverListener = new ServerListener();
        serverListener.contextInitialized(null);
        //Test 100 user truy cập đồng thời lên DB
        JDBIConnectionPool.get();
        databaseAttack(100, 2000);
    }

    //numberUser là số User truy cập đồng thời
    //queryWeight là độ phức tạp của query, weight càng cao thì càng mất nhiều thời gian để query
    public static void databaseAttack(int numberUser, int queryWeight) throws InterruptedException {
        System.out.println("Bắt đầu test");
        for(int i = 0; i < numberUser; i++){
            Thread thread = new Thread(() -> {
                Handle connection = JDBIConnectionPool.get().getConnection();
                for(int j = 0; j < queryWeight; j++){
                    connection.select("SELECT 1").mapTo(Integer.class).first();
                }
                JDBIConnectionPool.get().releaseConnection(connection);
            });
            thread.start();
        }

        System.out.println("Đã xong, vui lòng chờ xử lý kết quả");
        Thread.sleep(2000);
        long timeStart = System.currentTimeMillis();
        Handle connection = JDBIConnectionPool.get().getConnection();
        for(int i = 0; i < queryWeight; i++){
            connection.select("SELECT 1").mapTo(Integer.class).first();
        }
        JDBIConnectionPool.get().releaseConnection(connection);
        System.out.println("Thời gian sử dụng connection tốn: " + (System.currentTimeMillis() - timeStart) + " Milisec");
        System.out.println("Số lượng connection cuối: " + JDBIConnectionPool.get().getNumConnections());

    }
}
