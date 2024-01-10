package controller;

import java.sql.SQLException;
import java.util.List;

import dao.AccountDAO;
import model.Account;

public class UserAdminFindByEmail implements IUserAdminFindImpl {

	@Override
	public List<Account> find(String info) {
		try {
			return AccountDAO.findUserByEmail(info);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
