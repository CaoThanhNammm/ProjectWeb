package controller;

import java.io.File;
import java.io.IOException;
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
import model.Product;

@WebServlet("/html/orderDetail")
public class OrderDetailServlet extends HttpServlet {
    public OrderDetailServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = (Account) request.getSession().getAttribute("account");
		int orderID = Integer.valueOf(request.getParameter("orderID"));
		Handle connection = JDBIConnectionPool.get().getConnection();
		Order order = new OrderDAO(connection).getOrderByID(orderID);
		JDBIConnectionPool.get().releaseConnection(connection);
		if(account == null || !order.getAccount().getId().equals(account.getId())) {
			order = null;
		}
		else {
			for(OrderDetail detail : order.getDetails()) {
				Product p = detail.getModel().getProduct();
				String realPath = request.getServletContext().getRealPath("/image/product/" + p.getId());
		        File productImagePath = new File(realPath);
		        p.setImgs(productImagePath.list()[0]);
			}
		}
		request.setAttribute("order1", order);
		request.getRequestDispatcher("orderDetail.jsp").forward(request, response);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
}
