package controller.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

@WebFilter("/html/editProductHidenAdmin.jsp")
public class ProductHidden extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		List<Product> products = null;
		try {
			products = productDAO.getAll("1");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBIConnectionPool.get().releaseConnection(connection);

		request.setAttribute("getHiddenProduct", products);
		chain.doFilter(request, response);
	}

}
