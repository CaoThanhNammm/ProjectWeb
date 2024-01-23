package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.OrderDAO;
import database.JDBIConnectionPool;
import model.Account;
import model.Order;
import model.OrderDetail;
import model.ProductModel;
import model.Status;

@WebServlet("/html/complete-checkout")
public class CompleteCheckoutServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Account account = (Account) req.getSession().getAttribute("account");
		String username = req.getParameter("username");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		Order order = new Order(-1, account, LocalDate.now(), LocalDate.now(), phone, address, new Status(1, null), null);
		List<OrderDetail> details = new ArrayList<OrderDetail>();
		Map<ProductModel, Integer> models = (Map<ProductModel, Integer>) req.getSession().getAttribute("checkout");
		for(Map.Entry<ProductModel, Integer> entry : models.entrySet()) {
			ProductModel model = entry.getKey();
			OrderDetail detail = new OrderDetail(order, model, model.getProduct().getPrice(), model.getProduct().getDiscount(), entry.getValue());
			details.add(detail);
		}
		order.setDetails(details);
		Handle connection = JDBIConnectionPool.get().getConnection();
		OrderDAO orderDAO = new OrderDAO(connection);
		orderDAO.addOrder(order);
		JDBIConnectionPool.get().releaseConnection(connection);
		req.getRequestDispatcher("checkoutCompleted.jsp").forward(req, resp);
	}
}
