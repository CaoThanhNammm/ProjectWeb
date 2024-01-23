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

import org.jdbi.v3.core.Handle;

import model.Account;
import model.Order;
import dao.AccountDAO;
import dao.OrderDAO;
import database.JDBIConnectionPool;

@WebServlet("/html/orderAdmin")
public class OrderAdminServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderID = req.getParameter("orderID");
		String email = req.getParameter("email");
		String statusID = req.getParameter("statusID");
		List<Order> result = new ArrayList<Order>();
		if(orderID != null && !orderID.equals("")) {
			Handle connection = JDBIConnectionPool.get().getConnection();
			Order order = new OrderDAO(connection).getOrderByID(Integer.valueOf(orderID));
			order.setAccount(AccountDAO.getMoreInfo(order.getAccount()));
			JDBIConnectionPool.get().releaseConnection(connection);
			result.add(order);
		}
		else if(email != null && !email.equals("")){
			try {
				List<Account> accounts = AccountDAO.findUserByEmail(email);
				if(accounts != null && accounts.size() == 1) {
					Account account = accounts.get(0);
					Handle connection = JDBIConnectionPool.get().getConnection();
					List<Order> orders = new OrderDAO(connection).getAccountOrders(account);
					JDBIConnectionPool.get().releaseConnection(connection);
					result = orders;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(statusID != null && !statusID.equals("") && !statusID.equals("-1")){
			Handle connection = JDBIConnectionPool.get().getConnection();
			List<Order> orders = new OrderDAO(connection).getByStatus(Integer.valueOf(statusID));
			JDBIConnectionPool.get().releaseConnection(connection);
			result = orders;
		}
		else {
			Handle connection = JDBIConnectionPool.get().getConnection();
			List<Order> orders = new OrderDAO(connection).getAll();
			JDBIConnectionPool.get().releaseConnection(connection);
			result = orders;
		}
		req.setAttribute("orders", result);
		req.getRequestDispatcher("orderAdmin.jsp").forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
