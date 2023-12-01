package controller;

import static database.TableUsers.ADDRESS;
import static database.TableUsers.DOB;
import static database.TableUsers.EMAIL;
import static database.TableUsers.FULL_NAME;
import static database.TableUsers.GENDER;
import static database.TableUsers.NAME_TABLE;
import static database.TableUsers.PASSWORD;
import static database.TableUsers.PHONE;
import static database.TableUsers.ROLE;
import static database.TableUsers.STATUS;

import java.io.IOException;
import java.time.LocalDate;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;
import org.jdbi.v3.core.Jdbi;

import model.Account;
import dao.AccountDAO;
import model.Encrypt;
import model.IRoleUser;

/**
 * Create: Nguyễn Khải Nam Note: Xử lý các tác vụ từ client đến db Date:
 * 24/11/2023 Servlet implementation class access
 */
@WebServlet("/access")
public class Access extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Access() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String access = request.getParameter("access");

		switch (access) {
		case "login": {
			String name = request.getParameter("name");
			HttpSession session = request.getSession();
			if (isPhoneNumber(name) || isEmail(name)) {
				String prefix = (isPhoneNumber(name) ? "phone" : "email") + "-";
				Account ac = AccountDAO.getAccount(prefix + name, request.getParameter("password"));
				if (ac != null) {
					session.setAttribute("account", ac);
					session.setAttribute("status", "success");
					switch (ac.getRole()) {
					case IRoleUser.ADMIN:
						response.sendRedirect("html/overviewAdmin.jsp");
						break;
					case IRoleUser.USER:
						response.sendRedirect("index/index.jsp");
						break;
					default:
						break;
					}
				} else {
					session.setAttribute("status", "failed");
					response.sendRedirect("html/login.jsp");
				}
			} else if (isNull(name)) {
				session.setAttribute("status", "failed");
				response.sendRedirect("html/login.jsp");
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

			HttpSession session = request.getSession();
			if (isNull(name, phone, email, pass, rePass, dob, gender)) {
				if (pass.equals(rePass) && isEmail(email) && isPhoneNumber(phone)) {
					if (AccountDAO.hasAccount("",email, phone)) {
						session.setAttribute("status", "failed-1");
						response.sendRedirect("html/register.jsp");
					} else {
						String id = AccountDAO.generateID(email, phone);
						Account ac = new Account(id, email, phone, pass, name, AccountDAO.isGender(gender[0]),
								LocalDate.parse(dob), IRoleUser.USER, address, 1);
						int count = AccountDAO.insertAccount(ac);
						if (count > 0) {
							session.setAttribute("status", "success");
							response.sendRedirect("html/login.jsp");
						} else {
							session.setAttribute("status", "failed-1");
							response.sendRedirect("html/register.jsp");
						}
					}
				} else {
					session.setAttribute("status", "failed-0");
					response.sendRedirect("html/register.jsp");
				}
			}
		}
			break;

		default:
			break;
		}
	}

	// Kiểm tra có trường null không
	public boolean isNull(Object... objs) {
		for (Object obj : objs) {
			if (obj == null)
				return false;
		}
		return true;
	}

	// Kiểm tra có là số điện thoại
	public boolean isPhoneNumber(String phone) {
		return Pattern.compile("^\\d{10}$").matcher(phone).matches();
	}

	// Kiểm tra có là email
	public boolean isEmail(String email) {
		return Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
				.matcher(email).matches();
	}

}