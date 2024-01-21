package controller.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

@WebFilter("/html/editProductsAdminFilter")
public class editProductsAdminFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public editProductsAdminFilter() {
		super();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Handle handle = JDBIConnectionPool.get().getConnection();
		ProductDAO dao = new ProductDAO(handle, request.getServletContext().getRealPath(""));
		List<Product> brandAllProduct = dao.getProductDefaultByBrand();
		JDBIConnectionPool.get().releaseConnection(handle);
		chain.doFilter(request, response);
	}
}
