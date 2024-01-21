package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
	private Account account;
	private List<ProductModel> cartItems;

	public Cart(Account account) {
		super();
		this.account = account;
		this.cartItems = new ArrayList<ProductModel>();
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<ProductModel> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<ProductModel> cartItems) {
		this.cartItems = cartItems;
	}
	
	public ProductModel getModel(int modelID) {
		for(ProductModel model : cartItems) {
			if(model.getId() == modelID) {
				return model;
			}
		}
		
		return null;
	}
	
	public void removeItem(int modelID) {
		for(int i = 0; i < cartItems.size(); i++) {
			if(cartItems.get(i).getId() == modelID) {
				cartItems.remove(i);
				return;
			}
		}
	}
}
