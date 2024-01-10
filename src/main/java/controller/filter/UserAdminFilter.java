package controller.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;

@WebFilter({ "/html/userDecentralizationAdmin.jsp", "/html/userStatisticsAdmin.jsp" })
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
		try {
			accs = AccountDAO.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("email", "");
		request.setAttribute("phone", "");
		request.setAttribute("name", "");
		request.setAttribute("accounts", accs);

		chain.doFilter(request, response);
	}

}
