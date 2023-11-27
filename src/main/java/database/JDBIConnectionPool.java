package database;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Queue;

import static database.IInfoDatabase.*;

/**
 * Hiện thực tính năng quản lý connection xuống Database.
 * <br>
 * Mặc định lượng connection truy cập đồng thời sẽ là 20.
 * <br>
 * Cách sử dụng:
 * <ul>
 *     <li>Bước 1: Sử dụng <code>JDBIConnectionPool.get()</code> để lấy ConnectionPool
 *     </li>
 *     <li>Bước 2: Lấy Connection "Handle" để thực hiện gửi lệnh xuống SQL
 *          <code>pool.getHandle()</code>
 *     </li>
 *     <li>Bước 3: Sau khi thực hiện xong công việc, trả Connection "Handle"
 *          <code>pool.release(handle)</code>
 *     </li>
 * </ul>
 * Lưu ý rằng nếu hết connection tại thời điểm cần lấy thì sẽ trả về null nếu đợi quá thời gian quy định.
 */
public class JDBIConnectionPool{
    private static JDBIConnectionPool connectionPool; //Áp mẫu Singleton
    private DataSource dataSource;
    private Jdbi jdbi;
    private Queue<Handle> connections; //Các connection được lưu ở đây
    private int numConnections; //Số lượng kết nối tối đa
    private int numDebtConnections; //Số lượng kết nối "nợ" (Biến này liên quan tới các công việc tăng giảm maxConnection)
    private int waitingTimeMilis; //Thời gian chờ connection khả dụng, quá thời gian này thì không lấy được kết nối

    //Block khởi tạo ban đầu
    static {
        try {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setURL("jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME);
            dataSource.setUser(USER);
            dataSource.setPassword(PASS);
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
            //Mặc định 10 connection đồng thời, chờ kết nối tối đa 3 giây
            connectionPool = new JDBIConnectionPool(dataSource, 10, 3000);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
    }

    private JDBIConnectionPool(DataSource dataSource, int numConnections, int waitingTimeMilis){
        this.dataSource = dataSource;
        this.numConnections = numConnections;
        this.waitingTimeMilis = waitingTimeMilis;
        this.connections = new ArrayDeque<>(numConnections);
        this.jdbi = Jdbi.create(dataSource);
        for(int i = 0; i < numConnections; i++){
            connections.add(jdbi.open());
        }
    }

    /**
     * Phương thức này trả về instance Connection Pool
     */
    public static JDBIConnectionPool get(){
        return connectionPool;
    }

    /**
     * Lấy ra một connection đang rảnh rỗi, nếu tất cả Connection đều bận thì trả về null. <br>
     * Sau khi sử dụng xong vui lòng trả lại Connection thông qua phương thức
     * <code>releaseConnection()</code> <br>
     * Đừng đóng Connection trong quá trình sử dụng và sau khi sử dụng.
     */
    public synchronized Handle getConnection(){
        try{
            if(connections.isEmpty()){
                //Khi không có kết nối khả dụng thì đợi
                System.out.println("Waiting connection");
                wait(waitingTimeMilis);
            }
            if(!connections.isEmpty()){
                Handle handle = connections.poll();
                if(handle.isClosed()){
                    //Phòng hờ trường hợp connection bị ngắt
                    System.out.println("Connection Reset");
                    return jdbi.open();
                }
                else{
                    //Trả về kết nối sử dụng được
                    return handle;
                }
            }
            else{
                //Trường hợp này chỉ xảy ra khi đã đợi quá thời gian quy định
                //Buộc lòng trả về null
                System.out.println("Ran out connection");
                return null;
            }
        }
        catch (InterruptedException ie){
            ie.printStackTrace();
            return null;
        }
    }

    /**
     * Phương thức này dùng để trả lại Connection cho Pool, chỉ cần gọi một lần và đừng sử dụng tiếp sau khi trả lại
     */
    public synchronized void releaseConnection(Handle handle){
        if(numDebtConnections == 0){
            connections.add(handle);
            notify(); //Báo thức cho một Thread bất kỳ đang đợi để thread đó lấy connection
        }
        else{
            numDebtConnections--;
        }
    }

    public void setNumConnections(int numConnections){
        if(numConnections > 0){
            if(numConnections <= this.numConnections){
                //Trong trường hợp muốn giảm connection, thì các connection dư thừa sẽ là connection "nợ"
                //Các connection "nợ" này khi sử dụng xong sẽ không thêm vào lại pool mà được "trả nợ"
                numDebtConnections = this.numConnections - numConnections;
            }
            else{
                //Nếu tăng connection thì add thêm thôi
                int numNewConnections = numConnections - this.numConnections;
                for(int i = 0; i < numConnections; i++){
                    connections.add(jdbi.open());
                }
                notify();
            }
            this.numConnections = numConnections;
        }
    }

    public void setWaitingTimeMilis(int waitingTimeMilis){
        if(waitingTimeMilis > 0){
            this.waitingTimeMilis = waitingTimeMilis;
        }
    }

    public static void main(String[] args) {
        for(int i = 0; i < 1000; i++){
            //Bước 1: Lấy connection
            Handle connection = JDBIConnectionPool.get().getConnection();
            //Bước 2: Query gì gì đó
            System.out.println(connection.select("SELECT 1").mapTo(Integer.class).first());
            //Bước 3: Trả connection
            JDBIConnectionPool.get().releaseConnection(connection);
        }
    }
}
