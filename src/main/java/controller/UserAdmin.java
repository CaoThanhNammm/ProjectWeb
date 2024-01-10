package controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;

/**
 * Create: Cao Thành Nam Note: Xử lý phần người dùng của admin, phân quyền, kiểm
 * soát, xem thông tin
 */
@WebServlet("/html/UserAdmin")
public class UserAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserAdmin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// phân quyền trạng thái
		String statusId = request.getParameter("status");

		// phân quyền vai trò
		String roleId = request.getParameter("role");
		String userId = request.getParameter("id");

		// thay thế space thành "+" vì cơ chế mã hóa tham số từ URL đổi từ "+" sang
		// space dẫn đến sai dữ liệu
		userId = userId.replaceAll(" ", "+");

		// nếu status = null thì phân quyền vai trò
		if (statusId == null) {
			AccountDAO.updateAccount("id", userId, "roleID", roleId);
		} else {
			// ngược lại thì phân quyền trạng thái
			AccountDAO.updateAccount("id", userId, "statusID", statusId);
		}

		List<Account> accs = null;
		try {
			accs = AccountDAO.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("accounts", accs);
		response.sendRedirect("../html/userDecentralizationAdmin.jsp");
	}

}
