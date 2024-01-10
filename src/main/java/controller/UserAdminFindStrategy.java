package controller;

import java.util.List;

import model.Account;

public class UserAdminFindStrategy {
	private IUserAdminFindImpl byEmail;
	private IUserAdminFindImpl byPhone;
	private IUserAdminFindImpl byName;

	public UserAdminFindStrategy(IUserAdminFindImpl byEmail, IUserAdminFindImpl byPhone, IUserAdminFindImpl byName) {
		super();
		this.byEmail = byEmail;
		this.byPhone = byPhone;
		this.byName = byName;
	}

	public List<Account> findAll(String email, String phone, String name) {
		List<Account> accsByEmail = findByEmail(email);
		List<Account> accsByPhone = findByPhone(phone);
		List<Account> accsByName = findByName(name);
		
		if(accsByEmail.isEmpty()) {
			
		}
		else {}
		return null;
	}

	public List<Account> findByEmail(String email) {
		return byEmail.find(email);
	}

	public List<Account> findByPhone(String phone) {
		return byPhone.find(phone);
	}

	public List<Account> findByName(String name) {
		return byName.find(name);
	}

}
