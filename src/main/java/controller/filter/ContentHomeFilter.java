package controller.filter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import org.jdbi.v3.core.Handle;

import com.mysql.cj.protocol.x.XProtocolRow;

import dao.CategoriesDAO;
import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Category;
import model.Product;
import model.Wishlist;

@WebFilter({ "/html/*", "/index/*" })
public class ContentHomeFilter extends HttpFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		showSliderShow(request, response);

		getShowProductBestDiscount(request, response);
		getShowProductRecommend(request, response);

		showSliderShow(request, response);
		showCategoryBanner(request, response);
		chain.doFilter(request, response);
	}

	/*
	 * lấy ra sản phẩm có sự giảm giá cao nhất
	 */
	private void getShowProductBestDiscount(ServletRequest request, ServletResponse response) {
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		List<Product> products = productDAO.getProductBestDiscount(20);
		JDBIConnectionPool.get().releaseConnection(connection);

		request.setAttribute("getShowProductBestDiscount", products);
	}

	/*
	 * lấy ra sản phẩm random
	 */
	private void getShowProductRecommend(ServletRequest request, ServletResponse response) {
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		List<Product> products = productDAO.getProductRecommend(20);
		JDBIConnectionPool.get().releaseConnection(connection);

		request.setAttribute("getShowProductRecommend", products);
	}

	/*
	 * phương thức hiện ra ảnh của slider show duyệt qua file chứa ảnh sau đó thêm
	 * vào list rồi truyền dữ liệu đi
	 */
	private void showSliderShow(ServletRequest request, ServletResponse response) {
		String realPath = request.getServletContext().getRealPath("/image/home/sliderShow");
		File imgSliderShow = new File(realPath);

		List<String> imgs = new ArrayList<>();
		int totalImg = 0;

		for (File child : imgSliderShow.listFiles()) {
			imgs.add(child.getName());
			totalImg++;
		}

		request.setAttribute("imgSliderShow", imgs);
		request.setAttribute("totalDot", totalImg);
	}

	public void showCategoryBanner(ServletRequest request, ServletResponse response) {
		Map<Category, String> elementProductBanner = new HashMap<Category, String>();
		Map<Category, String> elementProductBannerFirst = new HashMap<Category, String>();

		Handle connection = JDBIConnectionPool.get().getConnection();
		CategoriesDAO categoriesDAO = new CategoriesDAO(connection);

		List<Category> categories = categoriesDAO.getCategoryRandomLimitN(5);
		JDBIConnectionPool.get().releaseConnection(connection);

		for (int i = 1; i < categories.size(); i++) {
			File folderBanner = new File(
					request.getServletContext().getRealPath("") + "/image/home/banner/" + categories.get(i).getId());
			String[] name = folderBanner.list();

			elementProductBanner.put(categories.get(i),
					"../image/home/banner/" + categories.get(i).getId() + "/" + name[0]);
		}

		Category categoryFirst = categories.get(0);
		File folderBanner = new File(
				request.getServletContext().getRealPath("") + "/image/home/banner/" + categoryFirst.getId());
		String[] name = folderBanner.list();

		elementProductBannerFirst.put(categoryFirst, "../image/home/banner/" + categoryFirst.getId() + "/" + name[0]);

		request.setAttribute("elementProductBannerFirst", elementProductBannerFirst);
		request.setAttribute("elementProductBanner", elementProductBanner);
	}

}
