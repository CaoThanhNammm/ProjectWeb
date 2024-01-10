package controller;

import java.util.List;

import model.Account;

public interface IUserAdminFindImpl {
	List<Account> find(String info);
}
