package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

@WebServlet("/html/FindProduct")
public class FindProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int currentPage;
	private int perPage = 20;
	private int totalProduct;
	private int totalPage;
	private String nameProduct;
	private List<Product> products;

	public FindProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("get");

		// xuất ra sản phẩm dựa vào số trang hiện tại đang đứng
		List<Product> perProduct = renderProduct(currentPage, perPage, products);

		// gán dữ liệu qua trang jsp
		request.setAttribute("products", perProduct);
		request.setAttribute("totalPage", totalPage);

		// đẩy dữ liệu qua trang jsp và chuyển trang
		request.getRequestDispatcher("/html/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("post");
		
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection);

		// lấy ra tên sản phẩm mà người dùng nhập và xóa khoảng cách dư ở đầu cuối
		nameProduct = request.getParameter("nameProduct").trim();

		// lấy query ra những sản phẩm giống tên
		products = productDAO.findProductByName(nameProduct);
		JDBIConnectionPool.get().releaseConnection(connection);

		// lấy trang hiện tại thông qua tham số currentPage trên url, mặc định là trang
		// đầu tiên
		String getCurrentPageOnUrl = request.getParameter("currentPage");
		currentPage = Integer.parseInt(getCurrentPageOnUrl);

		// lấy ra số sản phẩm
		totalProduct = products.size();

		// lấy ra tổng số trang bằng cách lấy (tổng số sản phẩm / số sản phẩm trên 1
		// trang)
		totalPage = totalPage(totalProduct, perPage);
		// nếu có sản phẩm thì mới bắt đầu hiện sản phẩm
		if (totalProduct > 0) {
			// lấy ra danh sách sản phẩm từ trang hiện tại
			/*
			 * vd: trang hiện tại là 1 thì lấy từ 0 đến 19 trang 2 thì lấy từ 20 đến 39
			 */
			List<Product> perProduct = renderProduct(currentPage, perPage, products);

			// gán dữ liệu qua cho trang jsp
			request.setAttribute("products", perProduct);
			request.setAttribute("totalPage", totalPage);

		} else {
			String name = "Rất tiếc, N2Q không tìm thấy kết quả nào phù hợp với từ khóa " + "\"" + nameProduct + "\"";
			request.setAttribute("notify", name);
			request.setAttribute("totalPage", 0);
		}

		// sau khi lấy tất cả dữ liệu cần thiết thì dùng method doGet để xử lý dữ liệu
		doGet(request, response);
	}

	// lấy ra tổng số trang, 2 tham số là tổng số sản phẩm và số sản phẩm trên 1
	// trang
	private int totalPage(int totalProduct, int perPage) {
		int phanNguyenTrang = totalProduct / perPage;
		int phanDuTrang = totalProduct % perPage;

		int totalPage = phanNguyenTrang;

		if (phanDuTrang > 0) {
			totalPage += 1;
		}
		return totalPage;
	}

	// xuất ra sản phẩm dựa vào trang hiện tại
	private List<Product> renderProduct(int currentPage, int perPage, List<Product> products) {
		List<Product> perProduct = new ArrayList<>();

		for (int i = (currentPage - 1) * perPage; i < (currentPage - 1) * perPage + perPage; i++) {
			if (i == products.size())
				return perProduct;

			perProduct.add(products.get(i));
		}

		return perProduct;
	}

}