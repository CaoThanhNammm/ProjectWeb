package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Account;
import model.Product;
import model.Wishlist;

/**
 * Servlet implementation class wishlistProcess
 */
@WebServlet("/html/wishlist")
public class wishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Wishlist wishlist;
	private int quantityWishlist = 0;
	private int totalPrice = 0;
	private Product p;

	public wishlist() {
		super();
		wishlist = new Wishlist(new Account());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		HttpSession session = request.getSession();
		String isRemove = request.getParameter("remove");

		if (isRemove.equals("yes")) {
			removeAll();
		}

		List<Product> productsWishlist = wishlist.getProducts();
		session.setAttribute("productsWishlist", productsWishlist);
		session.setAttribute("quantityWishlist", quantityWishlist);
		session.setAttribute("totalPrice", p.formatNumber(totalPrice));
		response.sendRedirect("../html/wishlistDetail.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		int productId = Integer.parseInt(request.getParameter("id"));
		String isRemove = request.getParameter("remove");

		Handle connection = JDBIConnectionPool.get().getConnection();
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		p = productDAO.findProductByID(productId);
		JDBIConnectionPool.get().releaseConnection(connection);
		List<Product> productsWishlist = wishlist.getProducts();

		if (isRemove == null || isRemove.equals("yes")) {
			if (productsWishlist.contains(p)) {
				removeProduct(productsWishlist, p);
			} else {
				addProduct(productsWishlist, p);
			}
		}

		session.setAttribute("productsWishlist", productsWishlist);
		session.setAttribute("quantityWishlist", quantityWishlist);
		session.setAttribute("totalPrice", p.formatNumber(totalPrice));
		response.sendRedirect("../html/wishlistDetail.jsp");
	}

	/*
	 * xóa sản phẩm vào danh sách yêu thích 
	 * trừ đi giá tiền vào tổng giá 
	 * trừ số lượng đi 1
	 */
	private void removeProduct(List<Product> products, Product product) {
		products.remove(product);
		totalPrice -= product.getPrice() - product.getDiscount();
		quantityWishlist--;
	}

	/*
	 * thêm sản phẩm vào danh sách yêu thích 
	 * cộng thêm giá tiền vào tổng giá 
	 * cộng số lượng thêm 1
	 */
	private void addProduct(List<Product> products, Product product) {
		products.add(product);
		totalPrice += product.getPrice() - product.getDiscount();
		quantityWishlist++;
	}

	/*
	 * thực hiên xóa tất cả sản phẩm trong danh sách yêu thích 
	 * set list thành rỗng
	 * tổng giá tiền = 0 
	 * tổng sản phẩm = 0
	 */
	private void removeAll() {
		wishlist.setProducts(new ArrayList<>());
		totalPrice = 0;
		quantityWishlist = 0;
	}
}