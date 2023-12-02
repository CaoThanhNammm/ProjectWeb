package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Account account;
	private Map<ProductModel, Integer> cartItems;
	private Voucher voucher;

	public Cart(Account account) {
		super();
		this.account = account;
		this.cartItems = new HashMap<ProductModel, Integer>();
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Map<ProductModel, Integer> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<ProductModel, Integer> cartItems) {
		this.cartItems = cartItems;
	}

}
