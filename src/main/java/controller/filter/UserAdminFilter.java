package controller.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import dao.AccountDAO;
import model.Account;

@WebFilter({ "/html/userDecentralizationAdmin.jsp" })
public class UserAdminFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public UserAdminFilter() {
		super();
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		List<Account> accs = null;
		System.out.println("run");
		try {
			accs = AccountDAO.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		int totalUser = AccountDAO.totalUser();
		int userAvailable = AccountDAO.countUserAvailable();
		int userUnAvailable = AccountDAO.countUserUnAvailable();

		request.setAttribute("email", "");
		request.setAttribute("phone", "");
		request.setAttribute("name", "");
		request.setAttribute("totalUser", totalUser);
		request.setAttribute("userAvailable", userAvailable);
		request.setAttribute("userUnAvailable", userUnAvailable);
		request.setAttribute("accounts", accs);

		chain.doFilter(request, response);
	}

}
