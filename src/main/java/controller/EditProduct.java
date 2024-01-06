package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/html/editProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Handle connection = JDBIConnectionPool.get().getConnection();
		int id = Integer.parseInt(request.getParameter("id-product"));
		ProductDAO dao = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		Product p = dao.findProductByID(id);
		request.setAttribute("product", p);
		JDBIConnectionPool.get().releaseConnection(connection);
		request.setAttribute("title", "?");
		request.getRequestDispatcher("formProductAdmin.jsp").forward(request, response);
	}

}
