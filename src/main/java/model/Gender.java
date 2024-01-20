package model;

import java.util.HashMap;
import java.util.Map;

/**
 * Create: Nguyễn Khải Nam Date: 30/11/2023 Note: Định nghĩa giới tính cho một
 * người
 */
public class Gender {
	private int id;
	private String sex;

	private static Map<Integer, Gender> sexs = new HashMap<>();
	// Thêm các giá trị
	static {
		int i = 0;
		// Start 1
		sexs.put(++i, new Gender(1, "Nam"));
		sexs.put(++i, new Gender(2, "Nữ"));
		sexs.put(++i, new Gender(3, "Khác"));
	}

	// Chỉ là hàm khởi tạo
	public Gender(int id, String sex) {
		this.id = id;
		this.sex = sex;
	}

	// Lấy ra thuộc tính gender cụ thể
	public static Gender getGender(int id) {
		return sexs.get(id);
	}

	public static Gender getGender(String gender) {
		int count = 1;
		switch (gender) {
		case "freeMale":
			count = 2;
			break;
		case "other":
			count = 3;
			break;
		default:
			count = 1;
			break;
		}
		return getGender(count);
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

}
