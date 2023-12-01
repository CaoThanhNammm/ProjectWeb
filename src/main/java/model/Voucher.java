package model;

import java.time.LocalDate;
/**
 * Create: Nguyễn Khải Nam
 * Date: 30/11/2023
 * Note: Dành cho các phiếu giảm giá
 */
public class Voucher {
	private int id;
	private String voucherCode;
	private LocalDate dateStart;
	private LocalDate dateEnd;
	private long discount;
	private VoucherType type;
	private VoucherScope scope;
	private VoucherStatus status;
}
