package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

import model.Encrypt;

@WebFilter(urlPatterns = { "/access" })
public class filterAccess implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		try {
			String access = request.getParameter("access");

			switch (access) {
			case "login": {
				String name = request.getParameter("name");
				if (isPhoneNumber(name) || isEmail(name)) {
					String pass = Encrypt.encrypt(request.getParameter("password"));
					request.setAttribute("name", name);
					request.setAttribute("password", pass);
					chain.doFilter(request, response);
				} else {
					((HttpServletResponse) response).sendRedirect("html/login.jsp");
				}
			}
				break;
			case "register": {
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				String dob = request.getParameter("date");
				String[] gender = request.getParameterValues("gender");
				String pass = request.getParameter("pass");
				String rePass = request.getParameter("rePass");

			}
				break;

			default:
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public boolean isPhoneNumber(String phone) {
		return Pattern.compile("^\\d{10}$").matcher(phone).matches();
	}

	public boolean isEmail(String email) {
		return Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
				.matcher(email).matches();
	}

}
