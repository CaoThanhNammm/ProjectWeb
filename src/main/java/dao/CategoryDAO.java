package dao;

import model.Category;
import org.jdbi.v3.core.Handle;

import java.util.List;

public class CategoryDAO extends AbstractDAO<Category>{

    public CategoryDAO(Handle connection) {
        super(connection);
    }

    public CategoryDAO() {
        super();
    }

    public Category getByObject(Category idWrapper){
        try{
            StringBuilder statement = new StringBuilder();
            statement.append("SELECT id, `name` ");
            statement.append("FROM categories ");
            statement.append("WHERE id = :id");
            Category category = connection.createQuery(statement)
                                        .bind("id", idWrapper.getId())
                                        .mapToBean(Category.class)
                                        .one();
            return category;
        }
        catch (IllegalStateException ise){
            return null; //Phương thức "one()" throw Exception nếu lượng dữ liệu trả về != 1
        }
    }

    public List<Category> getAll(){
        StringBuilder statement = new StringBuilder();
        statement.append("SELECT id, `name` ");
        statement.append("FROM categories");
        List<Category> categories = connection.createQuery(statement)
                                            .mapToBean(Category.class)
                                            .list();
        return categories;
    }

    public boolean insert(Category newCategory){
        StringBuilder statement = new StringBuilder();
        statement.append("INSERT INTO categories(id, `name`) ");
        statement.append("VALUES(:id, :name)");
        int affected = connection.createUpdate(statement)
                                .bind("id", newCategory.getId())
                                .bind("name", newCategory.getName())
                                .execute();
        return affected == 1; //Nếu insert thành công thì 1 dòng dữ liệu sẽ cập nhật
    }

    public boolean update(Category newCategory){
        StringBuilder statement = new StringBuilder();
        statement.append("UPDATE categories ");
        statement.append("SET `name` = :newName ");
        statement.append("WHERE id = :id");
        int affected = connection.createUpdate(statement)
                                .bind("id", newCategory.getId())
                                .bind("name", newCategory.getName())
                                .execute();
        return affected == 1;
    }
}
