package model;

import java.util.HashMap;
import java.util.Map;

/**
 * Create: Nguyễn Khải Nam 
 * Date: 30/11/2023 
 * Note: Trạng thái của một tài khoản
 */
public class AccountStatus {
	private int id;
	private String name;

	private static Map<Integer, AccountStatus> status = new HashMap<>();
	static {
		// Cần tuân theo luật viết hoa chữ đầu 
		// không thì khi thêm mới phải có hàm check
		int i = 0;
		// Start 1
		status.put(++i, new AccountStatus(1, "Khóa tài khoản"));
		status.put(++i, new AccountStatus(2, "Hoạt động"));
	}

	private AccountStatus(int id, String name) {
		this.id = id;
		this.name = name;
	}

	// Lấy ra trạng thái của tài khoản
	public static AccountStatus getStatus(int id) {
		return status.get(id);
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	public boolean  isAction(){
		// TODO Auto-generated method stub
		return status.get(this.id).getName().equals("Hoạt động");
	}

}
