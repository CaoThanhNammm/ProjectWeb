package model;

public class Attribute {
	private int id;
	private String name;
	private String value;

	/**
	 * 
	 */
	public Attribute() {
		super();
	}

	public Attribute(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Attribute(int id, String name, String value) {
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

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "Attribute [id=" + id + ", name=" + name + ", value=" + value + "]";
	}
}
