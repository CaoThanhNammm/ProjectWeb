package model;

/**
 * Create: Nguyễn Khải Nam Date: 30/11/2023 Note: Dành cho các thương hiệu
 */
public class Category {
	private int id;
	private String name;

	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
