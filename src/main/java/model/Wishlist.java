package model;

import java.util.List;

public class Wishlist {
	private Account account;
	private List<Product> products;

	public Wishlist(Account account, List<Product> products) {
		super();
		this.account = account;
		this.products = products;
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
