package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.AccountDAO;
import dao.OrderDAO;
import database.JDBIConnectionPool;
import model.Account;
import model.Order;
import model.OrderDetail;
import model.Product;

@WebServlet("/html/adminOrderDetail")
public class AdminOrderDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderID = Integer.valueOf(req.getParameter("orderID"));
		
		Handle connection = JDBIConnectionPool.get().getConnection();
		Order order = new OrderDAO(connection).getOrderByID(orderID);
		JDBIConnectionPool.get().releaseConnection(connection);
		for(OrderDetail detail : order.getDetails()) {
			Product p = detail.getModel().getProduct();
			String realPath = req.getServletContext().getRealPath("/image/product/" + p.getId());
	        File productImagePath = new File(realPath);
	        p.setImgs(productImagePath.list()[0]);
		}
		req.setAttribute("order", order);
		req.setAttribute("acInfo", AccountDAO.getMoreInfo(order.getAccount()));
		req.getRequestDispatcher("orderAdminDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int statusID = Integer.valueOf(req.getParameter("statusID"));
		int orderID = Integer.valueOf(req.getParameter("id"));
		Handle connection = JDBIConnectionPool.get().getConnection();
		new OrderDAO(connection).changeStatus(orderID, statusID);
		JDBIConnectionPool.get().releaseConnection(connection);
		resp.sendRedirect("orderAdmin");
	}
}
