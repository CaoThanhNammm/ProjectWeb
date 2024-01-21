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

/**
 * Create: Cao Thành Nam Note: Xử lý tìm kiếm sản phẩm, load sản phẩm khi ấn qua
 * trang mới
 * 
 */
@WebServlet("/html/FindProduct")
public class FindProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int PER_PAGE = 20;
	private static int PAGES_PER_GROUP = 5;
	private List<Product> products;
	private List<Product> perProduct;
	private int currentPage;
	private String priceSortTextDefault;
	private String brandSortTextDefault;
	private List<Integer> createPages;
	private List<Brand> brandsDefault;
	private String nameProduct;
	private int minPrice;
	private int maxPrice;
	private int minPriceCurrent;
	private int maxPriceCurrent;

	public FindProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// xuất ra sản phẩm dựa vào số trang hiện tại đang đứng
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		perProduct = renderProduct(currentPage, PER_PAGE, products);
		createPages = generatePagination(currentPage, PAGES_PER_GROUP);

		// gán dữ liệu qua trang jsp
		// dùng để load sản phẩm
		request.setAttribute("products", perProduct);
		// dùng để hiển thị tổng số trang
		request.setAttribute("currentPage", currentPage);
		// dùng để hiển thị những thương hiệu mặc định của tất cả sản phẩm
		request.setAttribute("brands", brandsDefault);
		// dùng để hiển thị những thương hiệu mặc định của tất cả sản phẩm
		request.setAttribute("nameProduct", nameProduct);
		request.setAttribute("createPages", createPages);
		request.setAttribute("uri", request.getRequestURI());
		request.setAttribute("priceSortText", priceSortTextDefault);
		request.setAttribute("brandSortText", brandSortTextDefault);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);
		request.setAttribute("minPriceCurrent", minPriceCurrent);
		request.setAttribute("maxPriceCurrent", maxPriceCurrent);

		int totalProduct = products.size();
		if (totalProduct == 0) {
			String name = "Rất tiếc, N2Q không tìm thấy kết quả nào phù hợp với từ khóa " + "\"" + nameProduct + "\"";
			request.setAttribute("notify", name);
			request.setAttribute("totalPage", 0);
		}

		// đẩy dữ liệu qua trang jsp và chuyển trang
		request.getRequestDispatcher("/html/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		currentPage = 1;
		nameProduct = request.getParameter("nameProduct").trim();
		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		ProductDAO productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		BrandDAO brandDAO = new BrandDAO(connection, request.getServletContext().getRealPath(""));
		brandsDefault = brandDAO.getBrandOfProduct(nameProduct);
		try {
			minPrice = productDAO.getMinPrice(nameProduct);
			maxPrice = productDAO.getMaxPrice(nameProduct);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		minPriceCurrent = minPrice;
		maxPriceCurrent = maxPrice;
		priceSortTextDefault = "Theo mức giá";
		brandSortTextDefault = "Theo thương hiệu";

		IFilterByPrice iFilterByPrice = new FilterEmptyPrice(nameProduct);
		IFilterByBrand iFilterByBrand = new FilterEmptyBrands(nameProduct);

		FilterStrategy strategy = new FilterStrategy(iFilterByPrice, iFilterByBrand);

		products = strategy.filter(request.getServletContext().getRealPath(""));
		JDBIConnectionPool.get().releaseConnection(connection);

		perProduct = renderProduct(currentPage, PER_PAGE, products);

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

	private List<Product> renderProduct(int currentPage, int perPage, List<Product> products) {
		List<Product> perProduct = new ArrayList<>();

		for (int i = (currentPage - 1) * perPage; i < (currentPage - 1) * perPage + perPage; i++) {
			if (i == products.size())
				return perProduct;

			perProduct.add(products.get(i));
		}

		return perProduct;
	}

	public List<Integer> generatePagination(int currentPage, int pagesPerGroup) {
		List<Integer> res = new ArrayList<>();

		if (currentPage > 3) {
			res.add(1);
		}

		pagesPerGroup = (pagesPerGroup - 1) / 2;
		for (int i = currentPage - pagesPerGroup; i <= currentPage + pagesPerGroup; i++) {
			if (i > 0 && i <= totalPage(products.size(), PER_PAGE)) {
				res.add(i);
			}
		}
		return res;
	}

}
