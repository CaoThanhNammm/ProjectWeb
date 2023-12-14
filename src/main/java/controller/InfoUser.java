package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;
import model.Encrypt;
import model.Gender;

import static database.TableUsers.*;

/**
 * Servlet implementation class InfoUser
 */
@WebServlet("/html/infoUser")
public class InfoUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfoUser() {
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

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String info = req.getParameter("info");
		Account ac = (Account) req.getSession().getAttribute("account");
		Account acInfo = AccountDAO.getMoreInfo(ac);
		if (ac != null) {
			if (info == null)
				info = "";
			switch (info) {
			case "info":
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				String gender = req.getParameter("gender");
				String dob = req.getParameter("dob");

				if (isNotNull(name, email, phone, gender, dob) && AccountDAO.isEmail(email)
						&& AccountDAO.isPhoneNumber(phone)) {
					if (AccountDAO.updateAccount(ID, ac.getId(), FULL_NAME, name)
							|| AccountDAO.updateAccount(ID, ac.getId(), EMAIL, email)
							|| AccountDAO.updateAccount(ID, ac.getId(), PHONE, phone)
							|| AccountDAO.updateAccount(ID, ac.getId(), ADDRESS, address)
							|| AccountDAO.updateAccount(ID, ac.getId(), GENDER, Gender.getGender(gender).getId() + "")
							|| AccountDAO.updateAccount(ID, ac.getId(), DOB, dob)) {
						acInfo.setFullName(name);
						acInfo.setEmail(email);
						acInfo.setPhone(phone);
						acInfo.setAddress(address);
						acInfo.setGender(Gender.getGender(gender));
						acInfo.setDob(LocalDate.parse(dob));
						req.getSession().setAttribute("accountInfo", acInfo);
						req.getRequestDispatcher("user.jsp?status=success&field=info").forward(req, resp);
					} else {
						req.getRequestDispatcher("user.jsp?status=failed-2&field=info").forward(req, resp);
					}
				} else {
					req.getRequestDispatcher("user.jsp?status=failed-0&field=info").forward(req, resp);
				}
				break;
			case "pass":
				// Xu ly
				String oldPass = req.getParameter("oldPassword");
				String newPass = req.getParameter("newPassword");
				String confirmPass = req.getParameter("confirmPassword");
				if (isNotNull(oldPass, newPass, confirmPass)) {
					if (newPass.equals(confirmPass) && AccountDAO.getAccount(acInfo.getEmail(), oldPass) != null) {
						if (AccountDAO.updateAccount(ID, ac.getId(), PASSWORD, Encrypt.encrypt(newPass))) {
							req.getRequestDispatcher("user.jsp?status=success&field=pass").forward(req, resp);
						} else {
							req.getRequestDispatcher("user.jsp?status=failed-2&field=pass");
						}
					} else {
						req.getRequestDispatcher("user.jsp?status=failed-1&field=pass");
					}
				} else {
					req.getRequestDispatcher("user.jsp?status=failed-0&field=pass");
				}
				break;
			default:
				req.getSession().setAttribute("accountInfo", acInfo);
				resp.sendRedirect("user.jsp");
				break;
			}
		} else {
			resp.sendRedirect("../index/index.jsp");
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
