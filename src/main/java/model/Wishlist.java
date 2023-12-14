package model;

import java.util.ArrayList;
import java.util.List;

public class Wishlist {
	private Account account;
	private List<Product> products;

	public Wishlist(Account account) {
		super();
		this.account = account;
		products = new ArrayList<>();
	}
	public void add(Product p) {
		products.add(p);
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
