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

import dao.BrandDAO;
import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Brand;
import model.Product;

@WebServlet("/html/FindProductAdmin")
public class FindProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String brandID;
	private String orderID;
	private String nameProduct;
	private List<Product> products;
	private String sortText;
	private String brandText;

	public FindProductAdmin() {
		super();
		products = new ArrayList<>();
		sortText = "Tất cả";
		brandText = "Tất cả";
		nameProduct = "";
		brandID = "0";
		orderID = "0";
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Handle connection = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		BrandDAO brandDAO = new BrandDAO(connection, request.getServletContext().getRealPath(""));
		if (request.getParameter("nameProduct") != null) {
			nameProduct = request.getParameter("nameProduct");
		}

		if (request.getParameter("brand") != null) {
			brandID = request.getParameter("brand");
			if (brandID.equals("0")) {
				brandText = "Tất cả";
			} else {
				Brand brand = brandDAO.getBrand(Integer.parseInt(brandID));
				brandText = brand.getName();
			}
		}

		if (request.getParameter("order") != null) {
			orderID = request.getParameter("order");
			if (orderID.equals("1")) {
				sortText = "Từ thấp đến cao";
			} else if (orderID.equals("2")) {
				sortText = "Từ cao đến thấp";
			} else if (orderID.equals("0")) {
				sortText = "Tất cả";
			}
		}

		try {
			products = productDAO.filterAdmin(nameProduct, orderID, brandID, "2");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBIConnectionPool.get().releaseConnection(connection);
		List<Brand> brandAllProduct = brandDAO.getAll();

		request.setAttribute("brandText", brandText);
		request.setAttribute("sortText", sortText);
		request.setAttribute("brandID", brandID);
		request.setAttribute("orderID", orderID);
		request.setAttribute("getAll", products);
		request.setAttribute("nameProduct", nameProduct);
		request.setAttribute("brands", brandAllProduct);

		request.getRequestDispatcher("/html/editProductsAdmin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
