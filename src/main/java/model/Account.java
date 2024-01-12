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

	public Account(String id, String fullName, AccountRole role, AccountStatus status) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.role = role;
		this.status = status;
	}

	public Account(String id, String email, String phone, String fullName, String address, Gender gender,
			AccountRole role, AccountStatus status) {
		super();
		this.id = id;
		this.email = email;
		this.phone = phone;
		this.fullName = fullName;
		this.address = address;
		this.gender = gender;
		this.role = role;
		this.status = status;
	}

	public Account(String email) {
		super();
		this.email = email;
	}

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

	public Account(String email, String phone, String fullName, Gender gender, LocalDate dob, String address) {
		super();
		this.email = email;
		this.phone = phone;
		this.fullName = fullName;
		this.gender = gender;
		this.dob = dob;
		this.address = address;
	}

	public Account() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public AccountRole getRole() {
		return role;
	}

	public void setRole(AccountRole role) {
		this.role = role;
	}

	public AccountStatus getStatus() {
		return status;
	}

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