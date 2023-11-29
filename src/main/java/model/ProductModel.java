package model;

public class ProductModel {
    private int id;
    private Product product;
    private String optionValue;
    private ProductStatus status;

    public ProductModel(int id, Product product, String optionValue, ProductStatus status) {
        this.id = id;
        this.product = product;
        this.optionValue = optionValue;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getOptionValue() {
        return optionValue;
    }

    public void setOptionValue(String optionValue) {
        this.optionValue = optionValue;
    }

    public ProductStatus getStatus() {
        return status;
    }

    public void setStatus(ProductStatus status) {
        this.status = status;
    }
}
