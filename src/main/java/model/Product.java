package model;

import java.time.LocalDate;
import java.util.List;

public class Product {
    private int id;
    private String name;
    private List<String> sourceImages;
    private Brand brand;
    private Category category;
    private List<ProductModel> productModels;
    private List<ProductAttribute> attributes;
    private String description;
    private long price;
    private long discount;
    private LocalDate lastUpdated;
    private int amountSold;
    private int averageRatePoint;
    private ProductStatus status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getSourceImages() {
        return sourceImages;
    }

    public void setSourceImages(List<String> sourceImages) {
        this.sourceImages = sourceImages;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<ProductModel> getProductModels() {
        return productModels;
    }

    public void setProductModels(List<ProductModel> productModels) {
        this.productModels = productModels;
    }

    public List<ProductAttribute> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<ProductAttribute> attributes) {
        this.attributes = attributes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getDiscount() {
        return discount;
    }

    public void setDiscount(long discount) {
        this.discount = discount;
    }

    public LocalDate getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(LocalDate lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public int getAmountSold() {
        return amountSold;
    }

    public void setAmountSold(int amountSold) {
        this.amountSold = amountSold;
    }

    public ProductStatus getStatus() {
        return status;
    }

    public void setStatus(ProductStatus status) {
        this.status = status;
    }
}
