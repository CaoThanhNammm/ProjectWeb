package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import model.Account;
import model.Cart;
import model.ProductModel;

import dao.ProductModelDAO;
import database.JDBIConnectionPool;

@WebServlet("/html/cart")
public class CartServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Account account = (Account) req.getSession().getAttribute("account");
		Cart cart = (Cart) req.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart(account);
			req.getSession().setAttribute("cart", cart);
		}
		String command = req.getParameter("method");
		int modelID = Integer.valueOf(req.getParameter("modelID"));
		if(command.equals("add")) {
			ProductModel model = cart.getModel(modelID);
			if(model == null) {
				Handle connection = JDBIConnectionPool.get().getConnection();
				ProductModelDAO dao = new ProductModelDAO(connection);
				model = dao.getModelByID(modelID);
				if (model != null) {
					int productID = model.getProduct().getId();
					String realPath = req.getServletContext().getRealPath("/image/product/" + productID);
			        File productImagePath = new File(realPath);
			        model.getProduct().setImgs(productImagePath.list()[0]);
					cart.getCartItems().add(model);
				}
				JDBIConnectionPool.get().releaseConnection(connection);
			}
		}
		else if(command.equals("remove")) {
			cart.removeItem(modelID);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
		req.setAttribute("cart", cart);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Account account = (Account) req.getSession().getAttribute("account");
		Cart cart = (Cart) req.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart(account);
			req.getSession().setAttribute("cart", cart);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
		req.setAttribute("cart", cart);
		dispatcher.forward(req, resp);
	}
}
