package model;

import java.util.HashMap;
import java.util.Map;

/**
 * Create: Nguyễn Khải Nam Date: 30/11/2023 Note: Vai trò của một tài khoản
 */
public class AccountRole {
	private int id;
	private String name;

	private static Map<Integer, AccountRole> roles = new HashMap<>();
	static {
		int i = 0;
		// Start 1
		roles.put(++i, new AccountRole(1, "User"));
		roles.put(++i, new AccountRole(2, "Admin"));
	}

	/**
	 * @param id
	 * @param name
	 */
	private AccountRole(int id, String name) {
		this.id = id;
		this.name = name;
	}

	// Lấy ra vai trò của tài khoản
	public static AccountRole getRole(int id) {
		return roles.get(id);
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

	public boolean isAdmin() {
		// TODO Auto-generated method stub
		return checkRole("Admin");
	}

	public boolean isUser() {
		// TODO Auto-generated method stub
		return checkRole("User");
	}

	// Kiểm tra vai trò hiện tại có phù hợp
	@SuppressWarnings("unlikely-arg-type")
	public boolean checkRole(String role) {
		return roles.get(this.id).getName().equals(role);
	}
}
