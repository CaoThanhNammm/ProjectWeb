package dao;

import model.Brand;
import org.jdbi.v3.core.Handle;

import java.util.List;

public class BrandDAO extends AbstractDAO<Brand>{
    public BrandDAO(Handle connection) {
        super(connection);
    }

    public BrandDAO() {
        super();
    }

    @Override
    public Brand getByObject(Brand idWrapper){
        try{
            StringBuilder statement = new StringBuilder();
            statement.append("SELECT id, `name` ");
            statement.append("FROM brands ");
            statement.append("WHERE id = :id");
            Brand brand = connection.createQuery(statement)
                                    .bind("id", idWrapper.getId())
                                    .mapToBean(Brand.class)
                                    .one();
            return brand;
        }
        catch (IllegalStateException ise){
            return null; //Phương thức "one()" throw Exception nếu lượng dữ liệu trả về != 1
        }
    }

    public List<Brand> getAll(){
        StringBuilder statement = new StringBuilder();
        statement.append("SELECT id, `name` ");
        statement.append("FROM brands");
        List<Brand> brands = connection.createQuery(statement)
                                        .mapToBean(Brand.class)
                                        .list();
        return brands;
    }

    public boolean insert(Brand newBrand){
        StringBuilder statement = new StringBuilder();
        statement.append("INSERT INTO brands(id, `name`) ");
        statement.append("VALUES(:id, :name)");
        int affected = connection.createUpdate(statement)
                                .bind("id", newBrand.getId())
                                .bind("name", newBrand.getName())
                                .execute();
        return affected == 1; //Nếu insert thành công thì 1 dòng dữ liệu sẽ cập nhật
    }

    public boolean update(Brand newBrand){
        StringBuilder statement = new StringBuilder();
        statement.append("UPDATE brands ");
        statement.append("SET `name` = :newName ");
        statement.append("WHERE id = :id");
        int affected = connection.createUpdate(statement)
                                .bind("id", newBrand.getId())
                                .bind("newName", newBrand.getName())
                                .execute();
        return affected == 1;
    }
}
