package dao;

import database.JDBIConnectionPool;
import junit.framework.TestCase;
import model.Brand;
import org.jdbi.v3.core.Handle;
import system.ServerListener;

import java.util.List;

public class BrandDAOTest extends TestCase {
    @Override
    public void setUp(){
        //Khởi chạy kết nối server
        ServerListener serverListener = new ServerListener();
        serverListener.contextInitialized(null);
    }

    public void testGetByID1(){
        Brand idWrapper = new Brand(1,"");
        Handle connection = JDBIConnectionPool.get().getConnection();
        Brand result = new BrandDAO(connection).getByObject(idWrapper);
        JDBIConnectionPool.get().releaseConnection(connection);
        assertTrue(result.getId() == idWrapper.getId());
    }

    public void testGetByID2(){
        Brand idWrapper = new Brand(-1,""); //Brand not exsist
        Handle connection = JDBIConnectionPool.get().getConnection();
        Brand result = new BrandDAO(connection).getByObject(idWrapper);
        JDBIConnectionPool.get().releaseConnection(connection);
        assertTrue(result == null);
    }

    public void testGetAll(){
        Handle connection = JDBIConnectionPool.get().getConnection();
        List<Brand> result = new BrandDAO(connection).getAll();
        JDBIConnectionPool.get().releaseConnection(connection);
        assertTrue(!result.isEmpty());
    }
}
