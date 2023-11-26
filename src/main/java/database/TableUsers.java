package database;

/**
 * Create: Nguyễn Khải Nam Note: Map tên cột trong db Date: 25/11/2023
 */
public interface TableUsers {
	String NAME_TABLE = "users";

	String ID = "ID";
	String EMAIL = "email";
	String PHONE = "phone";
	String FULL_NAME = "fullName";
	String GENDER = "genderID";
	String DOB = "dob";
	String ROLE = "roleID";
	String ADDRESS = "address";
	String STATUS = "statusID";
	String PASSWORD = "encryptedPassword";
}
