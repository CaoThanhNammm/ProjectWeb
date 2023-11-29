package dao;

import database.JDBIConnectionPool;
import org.jdbi.v3.core.Handle;

import java.util.List;

public abstract class AbstractDAO<T> {
    protected Handle connection;

    public AbstractDAO(Handle connection){
        this.connection = connection;
    }

    public AbstractDAO(){
        this.connection = JDBIConnectionPool.get().getConnection();
    }

    /**
     * Trả về một đối tượng có dữ liệu đầy đủ trong Database bằng cách tạo đối tượng chỉ có ID.
     * Tham số đầu vào phải là đối tượng bao bọc ID, các dữ liệu khác không quan trọng.
     */
    public abstract T getByObject(T idWrapper);

    /**
     * Trả về danh sách các đối tượng trong Database.
     * Các đối tượng quá nhiều dữ liệu không nên implement phương thức này
     */
    public abstract List<T> getAll();

    /**
     * Thêm một đối tượng vào Database.
     * Đối tượng NÊN có đầy đủ dữ liệu để dễ dàng thêm vào.
     */
    public abstract boolean insert(T newObject);

    /**
     * Cập nhật dữ liệu mới vào Database.
     * Trong đối tượng đầu vào, thuộc tính nào khác NULL sẽ được cập nhật vào và ngược lại.
     */
    public abstract boolean update(T newObject);
}
