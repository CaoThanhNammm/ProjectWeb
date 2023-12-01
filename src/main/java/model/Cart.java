package model;

import java.awt.Point;
import java.util.Map;
/**
 * Create: Nguyễn Khải Nam
 * Date: 30/11/2023
 * Note: Dành cho các giỏ hàng
 */
public class Cart {
	private Account account;
	private Map<ProductModel, Integer> products;
	private Voucher voucher;
}
