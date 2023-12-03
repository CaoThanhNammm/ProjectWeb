package model;

public class OrderDetail {
	private Order order;
	private ProductModel model;
	private int price;
	private int discount;
	private int quantity;

	public OrderDetail(Order order, ProductModel model, int price, int discount, int quantity) {
		super();
		this.order = order;
		this.model = model;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public ProductModel getModel() {
		return model;
	}

	public void setModel(ProductModel model) {
		this.model = model;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
