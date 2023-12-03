package model;

import java.time.LocalDate;

public class Rate {
	private Account account;
	private Product product;
	private LocalDate lastUpdated;
	private int ratePoint;
	private String rateComment;

	public Rate(Account account, Product product, LocalDate lastUpdated, int ratePoint, String rateComment) {
		super();
		this.account = account;
		this.product = product;
		this.lastUpdated = lastUpdated;
		this.ratePoint = ratePoint;
		this.rateComment = rateComment;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public LocalDate getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(LocalDate lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public int getRatePoint() {
		return ratePoint;
	}

	public void setRatePoint(int ratePoint) {
		this.ratePoint = ratePoint;
	}

	public String getRateComment() {
		return rateComment;
	}

	public void setRateComment(String rateComment) {
		this.rateComment = rateComment;
	}

}
