package model;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

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
	private String imgs;
	private List<Attribute> attributes;
	private List<Rate> rates;

	public Product() {
	}

	public Product(int id, String name, Brand brand, String description, Category category, int price, int discount,
			LocalDate lastUpdated, int amountSold, Status status, List<ProductModel> models, String imgs,
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

	public Product(int id, String name, int brandID, String brandName, String description, int categoryID,
			String categoryName, int price, int discount, LocalDate lastUpdated, int amountSold, int statusID,
			String statusName) {
		super();
		this.id = id;
		this.name = name;
		this.brand = new Brand(statusID, statusName);
		this.description = description;
		this.category = new Category(categoryID, categoryName);
		this.price = price;
		this.discount = discount;
		this.lastUpdated = lastUpdated;
		this.amountSold = amountSold;
		this.status = new Status(statusID, statusName);
	}

	public Product(int id, String name, int price, int discount, Brand brand) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.brand = brand;
	}

	public List<String> getImgsProduct() throws IOException {
		File src = new File(imgs + "/image/product/" + id);
		List<String> res = new ArrayList<>();

		for (File file : src.listFiles()) {
			res.add("../image/product/" + id + "/" + file.getName());
		}

		return res;
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

	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
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

	@Override
	public int hashCode() {
		return Objects.hash(amountSold, attributes, brand, category, description, discount, id, imgs, lastUpdated,
				models, name, price, rates, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return this.id == other.id;
	}

	public String formatNumber(int nums) {
		Locale vietnameseLocale = new Locale("vi", "VN");
		NumberFormat vietnameseFormat = NumberFormat.getInstance(vietnameseLocale);
		String formattedNumberVietnamese = vietnameseFormat.format(nums);
		return formattedNumberVietnamese;
	}

	public String percentSale(double price, double discount) {
		double percent = (discount / price) * 100;
		// Định dạng số với hai chữ số thập phân
		DecimalFormat decimalFormat = new DecimalFormat("#.##");
		String roundedNumber = decimalFormat.format(percent);
		return roundedNumber;
	}

	@Override
	public String toString() {
		return id + "";
	}

}
