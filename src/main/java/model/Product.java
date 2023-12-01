package model;

import java.time.LocalDate;
/**
 * Create: Nguyễn Khải Nam
 * Date: 30/11/2023
 * Note: Dành cho các sản phẩm
 */
public class Product {
	private int id;
	private String name; 
	private Brand brand;
	private String decription;
	private Category category;
	private long price; 
	private long discount;
	private LocalDate lastUpdated;
	private int amountSold;
	private ProductStatus status;
}
