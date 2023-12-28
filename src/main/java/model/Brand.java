package model;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * Create: Nguyễn Khải Nam Date: 30/11/2023 Note: Dành cho các nhãn hàng
 */
public class Brand {
	private int id;
	private String name;

	public Brand(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Brand() {
	}

	public String getImgbrand(String parent) throws IOException {
		File folder = new File(parent + "\\image\\product\\filter\\" + this.id);
		
		File[] files = folder.listFiles();

		return files[files.length - 1].getName();
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

	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Brand other = (Brand) obj;
		return id == other.id && Objects.equals(name, other.name);
	}

}