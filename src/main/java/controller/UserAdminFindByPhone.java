package controller;

import java.sql.SQLException;
import java.util.List;

import dao.AccountDAO;
import model.Account;

public class UserAdminFindByPhone implements IUserAdminFindImpl {
	@Override
	public List<Account> find(String info) {
		try {
			return AccountDAO.findUserByPhone(info);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
