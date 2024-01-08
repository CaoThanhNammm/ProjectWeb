package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;
import model.Encrypt;
import model.VerifyEmail;
import service.MailService;

import static database.TableUsers.*;

@WebServlet("/html/infoAdmin")
public class InfoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InfoAdmin() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Account ac = (Account) request.getSession().getAttribute("account");
		Account moreInfo = (Account) request.getSession().getAttribute("moreInfo");
		if (ac != null) {
			String access = request.getParameter("access");
			switch (access) {
			case "info":
				String email = request.getParameter("email");
				String tel = request.getParameter("tel");
				String name = request.getParameter("fullName");
				String address = request.getParameter("address");
				if (isNotNull(email, tel, name) && AccountDAO.isEmail(email) && AccountDAO.isPhoneNumber(tel)) {
					if (AccountDAO.updateAccount(ID, ac.getId(), EMAIL, email)
							&& AccountDAO.updateAccount(ID, ac.getId(), PHONE, tel)
							&& AccountDAO.updateAccount(ID, ac.getId(), FULL_NAME, name)
							&& AccountDAO.updateAccount(ID, ac.getId(), ADDRESS, address)) {
						moreInfo.setEmail(email);
						moreInfo.setPhone(tel);
						moreInfo.setFullName(name);
						moreInfo.setAddress(address);
						request.getSession().setAttribute("moreInfo", moreInfo);
						request.getRequestDispatcher("overviewAdmin.jsp?status=success").forward(request, response);
					}
				} else {
					request.getRequestDispatcher("overviewAdmin.jsp?status=failed").forward(request, response);
				}
				break;
			case "reset-pass":
				response.sendRedirect("access?access=admin");
				break;
			case "change-pass":
				String pass = request.getParameter("pass");
				String newPass = request.getParameter("newPass");
				String confirmPass = request.getParameter("confirmPass");
				if (isNotNull(pass, newPass, confirmPass) && newPass.equals(confirmPass)
						&& AccountDAO.getAccount("email-" + moreInfo.getEmail(), pass) != null
						&& AccountDAO.updateAccount(ID, ac.getId(), PASSWORD, Encrypt.encrypt(confirmPass))) {
					request.getRequestDispatcher("overviewAdmin.jsp?status=success").forward(request, response);
				} else {
					request.getRequestDispatcher("overviewAdmin.jsp?status=failed").forward(request, response);
				}
				break;
			default:
				break;
			}
		} else {
			response.sendRedirect("login.jsp");
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

}