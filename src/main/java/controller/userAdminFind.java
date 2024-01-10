package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;

/**
 * Create: Cao Thành Nam Note: Xử lý các thao tác tìm kiếm người dùng
 */
@WebServlet("/html/userAdminFind")
public class userAdminFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Account> accs;
	private String email;
	private String phone;
	private String name;

	public userAdminFind() {
		super();
		accs = new ArrayList<>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		email = "";
		phone = "";
		name = "";

		String email = request.getParameter("userAdmin_findByEmail");
		String phone = request.getParameter("userAdmin_findByPhone");
		String name = request.getParameter("userAdmin_findByName");
		this.email = email;
		this.phone = phone;
		this.name = name;

		System.out.println("email:" + email);
		System.out.println("phone: " + phone);
		System.out.println("name: " + name);

		try {
			accs = AccountDAO.find(email, phone, name);
		} catch (SQLException e) {
			e.printStackTrace();
		}

//		if (email != null) {
//			this.email = email;
//			try {
//				accs = AccountDAO.findUserByEmail(email);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		if (phone != null) {
//			this.phone = phone;
//			try {
//				accs = AccountDAO.findUserByPhone(phone);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		if (name != null) {
//			this.name = name;
//			try {
//				accs = AccountDAO.findUserByName(name);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}

		request.setAttribute("accounts", accs);
		request.setAttribute("email", this.email);
		request.setAttribute("phone", this.phone);
		request.setAttribute("name", this.name);
		// xử lý tìm theo nhiều tiêu chí

		request.getRequestDispatcher("/html/userDecentralizationAdmin.jsp").forward(request, response);
	}

}
