package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;
import model.Cart;

/**
 * Servlet implementation class Checkout
 */
/**
 * Create: Nguyễn Khải Nam Date: 03/12/2023 Note: Xử lý việc lấy info và thanh
 * toán
 */
@WebServlet("/checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Checkout() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkout = request.getParameter("checkout");
		if (checkout == null)
			checkout = "";
		Account ac = (Account) request.getSession().getAttribute("account");
		switch (checkout) {
		case "move":
			Account acInfo = AccountDAO.getMoreInfo(ac);
			request.getSession().setAttribute("accountInfo", acInfo);
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			if (cart == null) {
				cart = new Cart(ac);
				request.getSession().setAttribute("cart", cart);
			}
			response.sendRedirect("html/checkout.jsp");
			break;
		case "pay":

			break;
		default:
			break;
		}
	}

}
