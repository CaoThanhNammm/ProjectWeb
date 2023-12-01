package model;

import static database.TableUsers.ADDRESS;
import static database.TableUsers.DOB;
import static database.TableUsers.EMAIL;
import static database.TableUsers.FULL_NAME;
import static database.TableUsers.GENDER;
import static database.TableUsers.ID;
import static database.TableUsers.PASSWORD;
import static database.TableUsers.PHONE;
import static database.TableUsers.ROLE;
import static database.TableUsers.STATUS;

import java.time.LocalDate;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Account {
	@ColumnName(ID)
	private String id;

	@ColumnName(EMAIL)
	private String email;

	@ColumnName(PHONE)
	private String phone;

	@ColumnName(PASSWORD)
	private String pass;

	@ColumnName(FULL_NAME)
	private String fullName;

	@ColumnName(GENDER)
	private Gender gender;

	@ColumnName(DOB)
	private LocalDate dob;

	@ColumnName(ROLE)
	private AccountRole role;

	@ColumnName(ADDRESS)
	private String address;

	@ColumnName(STATUS)
	private AccountStatus status;

	/**
	 * @param id
	 * @param fullName
	 * @param role
	 * @param status
	 */
	public Account(String id, String fullName, AccountRole role, AccountStatus status) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.role = role;
		this.status = status;
	}

	/**
	 * @param email
	 */
	public Account(String email) {
		super();
		this.email = email;
	}

	/**
	 * @param id
	 * @param email
	 * @param phone
	 * @param pass
	 * @param fullName
	 * @param gender
	 * @param dob
	 * @param role
	 * @param address
	 * @param status
	 */
	public Account(String id, String email, String phone, String pass, String fullName, Gender gender, LocalDate dob,
			AccountRole role, String address, AccountStatus status) {
		super();
		this.id = id;
		this.email = email;
		this.phone = phone;
		this.pass = pass;
		this.fullName = fullName;
		this.gender = gender;
		this.dob = dob;
		this.role = role;
		this.address = address;
		this.status = status;
	}

	/**
	 * 
	 */
	public Account() {
		super();
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the pass
	 */
	public String getPass() {
		return pass;
	}

	/**
	 * @param pass the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the dob
	 */
	public LocalDate getDob() {
		return dob;
	}

	/**
	 * @param dob the dob to set
	 */
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the gender
	 */
	public Gender getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(Gender gender) {
		this.gender = gender;
	}

	/**
	 * @return the role
	 */
	public AccountRole getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(AccountRole role) {
		this.role = role;
	}

	/**
	 * @return the status
	 */
	public AccountStatus getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(AccountStatus status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", phone=" + phone + ", pass=" + pass + ", fullName="
				+ fullName + ", gender=" + gender + ", dob=" + dob + ", role=" + role + ", address=" + address
				+ ", status=" + status + "]";
	}

}
