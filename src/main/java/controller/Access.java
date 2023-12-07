package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import database.TableUsers;
import model.Account;
import model.AccountRole;
import model.AccountStatus;
import model.Encrypt;
import model.Gender;
import model.VerifyEmail;
import service.MailService;

/**
 * Create: Nguyễn Khải Nam Note: Xử lý các tác vụ từ client đến db Date:
 * 24/11/2023 Servlet implementation class access
 */
@WebServlet("/access")
public class Access extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static long exist = 60 * 3;

	private static String[] subject = { exist + " PHÚT - MÃ BẢO MẬT - ĐĂNG KÝ",
			exist + " PHÚT - MÃ BẢO MẬT - ĐẶT LẠI MẬT KHẨU", exist + " PHÚT - THIẾT LẬP MẬT KHẨU MỚI" };
	private static String[] mess = {
			"Xin chào,\nChúng tôi là n2q, rất cảm ơn bạn đã lựa chọn chúng tôi.\nĐây là mã bảo mật của bạn: ",
			"Chào mừng trở lại,\nCó vẻ như bạn gặp sự cố đăng nhập.\n Đây là mã bảo mật của bạn: ",
			"Xin chào, \nChúng tôi là n2q, đây là mật khẩu mới của bạn: " };

	// Dùng cho việc đăng ký
	private VerifyEmail verify;

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

		HttpSession session = request.getSession();
		switch (access) {
		case "login": {
			String name = request.getParameter("name");
			if (isPhoneNumber(name) || isEmail(name)) {
				String prefix = (isPhoneNumber(name) ? "phone" : "email") + "-";
				Account ac = AccountDAO.getAccount(prefix + name, request.getParameter("password"));
				if (ac != null) {
					if (ac.getStatus().isAction()) {
						session.setAttribute("account", ac);
						if (ac.getRole().isAdmin()) {
							response.sendRedirect("html/overviewAdmin.jsp");
						} else if (ac.getRole().isUser()) {
							response.sendRedirect("index/index.jsp");
						} else {
							response.sendRedirect("html/login.jsp?status=failed");
						}
					} else {
						response.sendRedirect("html/login.jsp?status=failed-0");
					}
				} else {
					response.sendRedirect("html/login.jsp?status=failed");
				}
			} else if (isNotNull(name)) {
				response.sendRedirect("html/login.jsp?status=failed");
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

			if (isNotNull(name, phone, email, pass, rePass, dob, gender)) {
				if (pass.equals(rePass) && isEmail(email) && isPhoneNumber(phone)) {
					if (AccountDAO.hasAccount("", email, phone)) {
						response.sendRedirect("html/register.jsp?status=failed-1");
					} else {
						String code = MailService.sendEmail(email, subject[0], mess[0], null);
						String id = AccountDAO.generateID(email, phone);
						Account ac = new Account(id, email, phone, pass, name, Gender.getGender(gender[0]),
								LocalDate.parse(dob), AccountRole.getRole(1), address, AccountStatus.getStatus(2));
						verify = new VerifyEmail(Encrypt.encrypt(code), ac, exist);

						if (code != null && !code.isBlank()) {
							request.getSession().setAttribute("status", "register");
							response.sendRedirect("html/confirm.jsp");
						}
					}
				} else {
					response.sendRedirect("html/register.jsp?status=failed-0");
				}
			}
		}
			break;
		case "confirm":
			if (verify == null) {
				response.sendRedirect("html/register.jsp?status=failed-0");
			} else {
				String input = Encrypt.encrypt(request.getParameter("verificationCode"));
				String status = (String) request.getSession().getAttribute("status");
				System.out.println(status);
				if (verify.isCode(input)) {
					if (status.equals("forget")) {
						String mainPass = Encrypt.generateCode(12);
						String pass = Encrypt.encrypt(mainPass);
						String email = (String) session.getAttribute("email");
						if (AccountDAO.updateAccount(email, TableUsers.PASSWORD, pass)) {
							if (MailService.sendEmail(email, subject[2], mess[2], mainPass) != null) {
								response.sendRedirect("html/login.jsp?status=success-1");
							} else {
								response.sendRedirect("html/forget.jsp?status=failed");
							}
						} else {
							response.sendRedirect("html/forget.jsp?status=failed");
						}
					} else {
						int count = AccountDAO.insertAccount(verify.getAc());
						if (count > 0) {
							response.sendRedirect("html/login.jsp?status=success");
						} else {
							response.sendRedirect("html/register.jsp?status=failed-1");
						}
					}
				} else if (status.equals("forget")) {
					response.sendRedirect("html/forget.jsp?status=failed");
				} else {
					response.sendRedirect("html/register.jsp?status=failed-1");
				}
				request.getSession().removeAttribute("email");
				request.getSession().removeAttribute("status");
			}
			break;
		case "forget":
			String email = request.getParameter("email");
			if (AccountDAO.hasAccount("", email, "")) {
				String code = MailService.sendEmail(email, subject[1], mess[1], null);
				Account ac = new Account(email);
				verify = new VerifyEmail(Encrypt.encrypt(code), ac, exist);
				if (code != null && !code.isBlank()) {
					request.getSession().setAttribute("status", "forget");
					request.getSession().setAttribute("email", email);
					response.sendRedirect("html/confirm.jsp");
				} else {
					response.sendRedirect("html/forget.jsp?status=failed-0");
				}
			} else {
				response.sendRedirect("html/forget.jsp?status=failed");
			}
			break;
		default:
			break;
		}
	}

	// Kiểm tra có trường null không
	public boolean isNotNull(Object... objs) {
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