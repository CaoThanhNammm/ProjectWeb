package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.AccountDAO;
import dao.ProductModelDAO;
import database.JDBIConnectionPool;
import model.Account;
import model.Cart;
import model.ProductModel;

/**
 * Servlet implementation class Checkout
 */
/**
 * Create: Nguyễn Khải Nam Date: 03/12/2023 Note: Xử lý việc lấy info và thanh
 * toán
 */
@WebServlet("/html/checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Checkout() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean usingCart = Boolean.valueOf(request.getParameter("cart"));
		Map<ProductModel, Integer> checkout = new HashMap<ProductModel, Integer>();
		Handle connection = JDBIConnectionPool.get().getConnection();
		ProductModelDAO dao = new ProductModelDAO(connection);
		int modelID = -1;
		int quantity = 1;
		if(!usingCart) {
			modelID = Integer.valueOf(request.getParameter("modelID"));
			ProductModel model = dao.getModelByID(modelID);
			checkout.put(model, quantity);
		}
		else {
			String[] arrModels = request.getParameterValues("modelID");
			String[] arrQuantities = request.getParameterValues("quantity");
			for(int i = 0; i < arrModels.length; i++) {
				modelID = Integer.valueOf(arrModels[i]);
				quantity = Integer.valueOf(arrQuantities[i]);
				ProductModel model = dao.getModelByID(modelID);
				checkout.put(model, quantity);
			}
		}
		JDBIConnectionPool.get().releaseConnection(connection);
		
		request.getSession().setAttribute("checkout", checkout);
		request.setAttribute("checkout", checkout);
		request.setAttribute("acInfo", AccountDAO.getMoreInfo((Account) request.getSession().getAttribute("account")));
		request.getRequestDispatcher("checkout.jsp").forward(request, response);
	}

}
