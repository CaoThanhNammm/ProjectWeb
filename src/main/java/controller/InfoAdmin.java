package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;

import static database.TableUsers.*;

/**
 * Servlet implementation class InfoAdmin
 */
@WebServlet("/html/infoAdmin")
public class InfoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfoAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String name = request.getParameter("fullName");
		String address = request.getParameter("address");

		Account ac = (Account) request.getSession().getAttribute("account");

		if (AccountDAO.updateAccount(ID, ac.getId(), EMAIL, email)
				&& AccountDAO.updateAccount(ID, ac.getId(), PHONE, tel)
				&& AccountDAO.updateAccount(ID, ac.getId(), FULL_NAME, name)
				&& AccountDAO.updateAccount(ID, ac.getId(), ADDRESS, address)) {

		}
	}

}
