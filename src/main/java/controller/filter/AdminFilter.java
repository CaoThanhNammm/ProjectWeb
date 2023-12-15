package controller.filter;

import java.io.IOException;

import javax.management.relation.Role;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import model.Account;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/html/*")
public class AdminFilter extends HttpFilter implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		String url = ((HttpServletRequest) request).getRequestURI();
		if (url.contains("Admin")) {
			Account ac = (Account) ((HttpServletRequest) request).getSession().getAttribute("account");
			if (ac != null && ac.getRole().isAdmin()) {
				request.getRequestDispatcher("../html/overviewAdmin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("../html/login.jsp").forward(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}

	}

}
