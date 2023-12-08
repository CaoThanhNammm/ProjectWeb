package controller.filter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

@WebFilter({ "/html/*", "/index/*" })
public class ContentHomeFilter extends HttpFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		showSliderShow(request, response);
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String url = httpRequest.getServletPath();
		
		if(url.endsWith("index.jsp")) {
			getShowProductBestDiscount(request, response);
			getShowProductRecommend(request, response);
		}

		chain.doFilter(request, response);
	}

	private void getShowProductBestDiscount(ServletRequest request, ServletResponse response) {
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection);
		List<Product> products = productDAO.getProductBestDiscount(20);
		JDBIConnectionPool.get().releaseConnection(connection);
		
		request.setAttribute("getShowProductBestDiscount", products);
	}

	private void getShowProductRecommend(ServletRequest request, ServletResponse response) {
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection);
		List<Product> products = productDAO.getProductRecommend(20);
		JDBIConnectionPool.get().releaseConnection(connection);
		
		request.setAttribute("getShowProductRecommend", products);
	}

	private void showSliderShow(ServletRequest request, ServletResponse response) {
		File imgSliderShow = new File("Web/ProjectWeb/src/main/webapp/image/home/sliderShow");
		
		List<String> imgs = new ArrayList<>();
		int totalImg = 0;

		for (File child : imgSliderShow.listFiles()) {
			imgs.add(child.getName());
			totalImg++;
		}

		request.setAttribute("imgSliderShow", imgs);
		request.setAttribute("totalDot", totalImg);
	}
}
