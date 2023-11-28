package database;

import database.JDBIConnectionPool;
import org.jdbi.v3.core.Handle;

public class StressTest {
    public static void main(String[] args) throws InterruptedException {
        //Test 100 user truy cập đồng thời lên DB
        JDBIConnectionPool.get();
        for(int i = 0; i < 100; i++){
            Thread thread = new Thread(new Runnable() {
                private String name;
                @Override
                public void run() {
                    for(int i = 0; i < 10; i++){
                        System.out.println(name);
                        //Bước 1: Lấy connection
                        Handle connection = JDBIConnectionPool.get().getConnection();
                        //Bước 2: Query gì gì đó
                        System.out.println(connection.select("SELECT 1").mapTo(Integer.class).first());
                        //Bước 3: Trả connection
                        JDBIConnectionPool.get().releaseConnection(connection);
                    }
                }

                public Runnable init(String name){
                    this.name = name;
                    return this;
                }
            }.init("Thread " + i));
            thread.start();
        }

    }
}
