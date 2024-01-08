package controller.filter;

import java.io.IOException;
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

import model.Account;

@WebFilter("/html/*")
public class AdminFilter extends HttpFilter implements Filter {
	private boolean check = false;

	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String url = ((HttpServletRequest) request).getRequestURI();
		if (url.contains("Admin")) {
			Account ac = (Account) ((HttpServletRequest) request).getSession().getAttribute("account");
			if (ac != null && ac.getRole().isAdmin()) {
				if (!check) {
					check = true;
					((HttpServletResponse) response).sendRedirect(url.substring(url.lastIndexOf("/") + 1));
				}
			} else {
				((HttpServletResponse) response).sendRedirect("../html/login.jsp");
			}
		}
		chain.doFilter(request, response);

	}

}
