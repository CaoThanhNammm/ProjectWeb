package model;

import java.util.List;
import java.util.stream.Collectors;

import database.JDBIConnector;

public class Product {
	private int id;
	private String name;
	private int brandID;
	private String description;
	private int categoryID;
	private int price;
	private int discount;
	private String lastUpdated;
	private int amountSold;
	private int statusID;

	public Product(int id, String name, int brandID, String description, int categoryID, int price, int discount,
			String lastUpdated, int amountSold, int statusID) {
		super();
		this.id = id;
		this.name = name;
		this.brandID = brandID;
		this.description = description;
		this.categoryID = categoryID;
		this.price = price;
		this.discount = discount;
		this.lastUpdated = lastUpdated;
		this.amountSold = amountSold;
		this.statusID = statusID;
	}

	public void a() {
		List<Product> products = JDBIConnector.getConnection()
				.withHandle(h -> h.createQuery("SELECT * FROM products").mapToBean(Product.class).list());
	}

	public Product() {

	}

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

	public int getBrandID() {
		return brandID;
	}

	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public int getAmountSold() {
		return amountSold;
	}

	public void setAmountSold(int amountSold) {
		this.amountSold = amountSold;
	}

	public int getStatusID() {
		return statusID;
	}

	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", brandID=" + brandID + ", description=" + description
				+ ", categoryID=" + categoryID + ", price=" + price + ", discount=" + discount + ", lastUpdated="
				+ lastUpdated + ", amountSold=" + amountSold + ", statusID=" + statusID + "]";
	}

}