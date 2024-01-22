package controller.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import org.jdbi.v3.core.Handle;

import dao.BrandDAO;
import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Brand;
import model.Product;

@WebFilter({ "/html/*" })
public class editProductsAdminFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public editProductsAdminFilter() {
		super();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Handle handle = JDBIConnectionPool.get().getConnection();
		BrandDAO dao = new BrandDAO(handle, request.getServletContext().getRealPath(""));
		List<Brand> brandAllProduct = dao.getAll();
		JDBIConnectionPool.get().releaseConnection(handle);

		try {
			getAll(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("brands", brandAllProduct);
		request.setAttribute("sortText", "Tất cả");
		request.setAttribute("brandText", "Tất cả");
		request.setAttribute("nameProduct", "");
		chain.doFilter(request, response);
	}

	/*
	 * lấy ra tất cả sản phẩm
	 */
	private void getAll(ServletRequest request, ServletResponse response) throws SQLException {
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		List<Product> products = productDAO.getAll("2");
		JDBIConnectionPool.get().releaseConnection(connection);
		request.setAttribute("getAll", products);
	}
}
