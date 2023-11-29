package dao;

import database.JDBIConnectionPool;
import junit.framework.TestCase;
import model.Category;
import org.jdbi.v3.core.Handle;
import system.ServerListener;

import java.util.List;

public class CategoryDAOTest extends TestCase {
    public void testGetByID1(){
        Category idWrapper = new Category(1,"");
        Handle connection = JDBIConnectionPool.get().getConnection();
        Category result = new CategoryDAO(connection).getByObject(idWrapper);
        JDBIConnectionPool.get().releaseConnection(connection);
        assertTrue(result.getId() == idWrapper.getId());
    }

    public void testGetByID2(){
        Category idWrapper = new Category(-1,""); //Brand not exsist
        Handle connection = JDBIConnectionPool.get().getConnection();
        Category result = new CategoryDAO(connection).getByObject(idWrapper);
        JDBIConnectionPool.get().releaseConnection(connection);
        assertTrue(result == null);
    }

    public void testGetAll(){
        Handle connection = JDBIConnectionPool.get().getConnection();
        List<Category> result = new CategoryDAO(connection).getAll();
        JDBIConnectionPool.get().releaseConnection(connection);
        assertTrue(!result.isEmpty());
    }
}
