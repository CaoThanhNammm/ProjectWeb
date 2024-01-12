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
	private String pathImg;

	public Brand(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Brand(int id, String name, String pathImg) {
		super();
		this.id = id;
		this.name = name;
		this.pathImg = pathImg;
	}
	
	public Brand() {
	}
	
	public String getImgbrand() throws IOException {
		File folder = new File(pathImg + "/image/product/filter/" + this.id);

		File[] files = folder.listFiles();

		return "../image/product/filter/" + id + "/" + files[files.length - 1].getName();
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

	public String getPathImg() {
		return pathImg;
	}

	public void setPathImg(String pathImg) {
		this.pathImg = pathImg;
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