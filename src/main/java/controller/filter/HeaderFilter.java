package controller.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.jdbi.v3.core.Handle;

import dao.CategoriesDAO;
import database.JDBIConnectionPool;
import model.Category;

@WebFilter({ "/html/*", "/index/*" })
public class HeaderFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Handle connection = JDBIConnectionPool.get().getConnection();
		CategoriesDAO categoriesDAO = new CategoriesDAO(connection);
		List<Category> categories = categoriesDAO.getCategoryLimitN(8);
		JDBIConnectionPool.get().releaseConnection(connection);

		request.setAttribute("categories", categories);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
