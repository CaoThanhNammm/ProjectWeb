package model;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class Product {
	private int id;
	private String name;
	private Brand brand;
	private String description;
	private Category category;
	private int price;
	private int discount;
	private LocalDate lastUpdated;
	private int amountSold;
	private Status status;
	private List<ProductModel> models;
	private List<String> imgs;
	private List<Attribute> attributes;
	private List<Rate> rates;

	public Product() {
	}

	public Product(int id, String name, Brand brand, String description, Category category, int price, int discount,
			LocalDate lastUpdated, int amountSold, Status status, List<ProductModel> models, List<String> imgs,
			List<Attribute> attributes, List<Rate> rates) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.description = description;
		this.category = category;
		this.price = price;
		this.discount = discount;
		this.lastUpdated = lastUpdated;
		this.amountSold = amountSold;
		this.status = status;
		this.models = models;
		this.imgs = imgs;
		this.attributes = attributes;
		this.rates = rates;
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

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
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

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public List<ProductModel> getModels() {
		return models;
	}

	public void setModels(List<ProductModel> models) {
		this.models = models;
	}

	public List<String> getImgs() {
		return imgs;
	}

	public void setImgs(List<String> imgs) {
		this.imgs = imgs;
	}

	public List<Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(List<Attribute> attributes) {
		this.attributes = attributes;
	}

	public List<Rate> getRates() {
		return rates;
	}

	public void setRates(List<Rate> rates) {
		this.rates = rates;
	}

}
