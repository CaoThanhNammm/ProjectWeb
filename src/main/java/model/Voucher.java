package model;

import java.time.LocalDate;

/**
 * Create: Nguyễn Khải Nam Date: 30/11/2023 Note: Dành cho các phiếu giảm giá
 */
public class Voucher {
	private int id;
	private String voucherCode;
	private LocalDate dateStart;
	private LocalDate dateEnd;
	private int discount;
	private VoucherTypeStrategy voucherTypeStrategy;
	private VoucherScopeStrategy voucherScopeStrategy;
	private Status status;

	public Voucher(int id, String voucherCode, LocalDate dateStart, LocalDate dateEnd, int discount,
			VoucherTypeStrategy voucherTypeStrategy, VoucherScopeStrategy voucherScopeStrategy, Status status) {
		super();
		this.id = id;
		this.voucherCode = voucherCode;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.discount = discount;
		this.voucherTypeStrategy = voucherTypeStrategy;
		this.voucherScopeStrategy = voucherScopeStrategy;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVoucherCode() {
		return voucherCode;
	}

	public void setVoucherCode(String voucherCode) {
		this.voucherCode = voucherCode;
	}

	public LocalDate getDateStart() {
		return dateStart;
	}

	public void setDateStart(LocalDate dateStart) {
		this.dateStart = dateStart;
	}

	public LocalDate getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(LocalDate dateEnd) {
		this.dateEnd = dateEnd;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public VoucherTypeStrategy getVoucherTypeStrategy() {
		return voucherTypeStrategy;
	}

	public void setVoucherTypeStrategy(VoucherTypeStrategy voucherTypeStrategy) {
		this.voucherTypeStrategy = voucherTypeStrategy;
	}

	public VoucherScopeStrategy getVoucherScopeStrategy() {
		return voucherScopeStrategy;
	}

	public void setVoucherScopeStrategy(VoucherScopeStrategy voucherScopeStrategy) {
		this.voucherScopeStrategy = voucherScopeStrategy;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

}
