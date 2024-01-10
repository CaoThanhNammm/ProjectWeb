package controller;

import java.util.List;

import model.Account;

public interface IUserAdminFindStrategy {
	List<Account> find(String info);
}
