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
 * Create: Cao Thành Nam 
 * Note: Xử lý tìm kiếm sản phẩm, phân trang, lọc
 *
 */
@WebServlet("/html/FindProductBackup")
public class FindProductBackup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private BrandDAO brandDAO;
	private int currentPage;
	private int perPage = 20;
	private int totalProduct;
	private int totalPage;
	private int pagesPerGroup = 5;
	private List<Integer> createPages;
	private String nameProduct;
	private List<Product> products;
	private List<Product> perProduct;
	private List<Brand> brandsDefault;
	private FilterStrategy strategy;
	private String priceSortText;
	private String typeOfSort;
	private String brandSortText;
	private List<Brand> brands;
	private IFilterByPrice iFilterByPrice;
	private IFilterByBrand iFilterByBrand;
	private int brandID;
	private int fromPrice;
	private int toPrice;
	private int minPrice;
	private int maxPrice;
	private int minPriceCurrent;
	private int maxPriceCurrent;

	public FindProductBackup() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// xuất ra sản phẩm dựa vào số trang hiện tại đang đứng
		String getCurrentPageOnUrl = request.getParameter("currentPage");
		currentPage = Integer.parseInt(getCurrentPageOnUrl);

		perProduct = renderProduct(currentPage, perPage, products);
		createPages = generatePagination(currentPage, pagesPerGroup);

		// gán dữ liệu qua trang jsp
		// dùng để load sản phẩm
		request.setAttribute("products", perProduct);
		// dùng để hiển thị tổng số trang
		request.setAttribute("totalPage", totalPage);
		// dùng để hiển thị những thương hiệu mặc định của tất cả sản phẩm
		request.setAttribute("brands", brandsDefault);
		// dùng để hiển thị những thương hiệu mặc định của tất cả sản phẩm
		request.setAttribute("nameProduct", nameProduct);
		request.setAttribute("typeOfSort", typeOfSort);
		request.setAttribute("chooseBrands", brandSortText);
		request.setAttribute("uri", request.getRequestURI());
		request.setAttribute("priceSortText", priceSortText);
		request.setAttribute("brandSortText", brandSortText);
		request.setAttribute("createPages", createPages);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);
		request.setAttribute("minPriceCurrent", minPriceCurrent);
		request.setAttribute("maxPriceCurrent", maxPriceCurrent);

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
		response.setContentType("text/html");

		// lấy ra tên sản phẩm mà người dùng nhập và xóa khoảng cách dư ở đầu cuối
		nameProduct = request.getParameter("nameProduct").trim();

		Handle connection = JDBIConnectionPool.get().getConnection();
		// khởi tạo dao product
		productDAO = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		brandDAO = new BrandDAO(connection, request.getServletContext().getRealPath(""));

		// lấy ra tất cả thương hiệu của sản phẩm
		brandsDefault = brandDAO.getBrandOfProduct(nameProduct);

		try {
			// lấy ra giá tiền thấp nhất của sản phẩm
			minPrice = productDAO.getMinPrice(nameProduct);
			// lấy ra giá cao thấp nhất của sản phẩm
			maxPrice = productDAO.getMaxPrice(nameProduct);
			/*
			 * giá hiện tại của sản phẩm mặc định là giá thấp nhất và giá cao nhất biến này
			 * dùng để giữ giá trị khi chọn
			 */
			minPriceCurrent = minPrice;
			maxPriceCurrent = maxPrice;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBIConnectionPool.get().releaseConnection(connection);

		// nếu chọn filter theo khoảng giá thì lấy ra giá trị từ đâu dến đâu
		if (request.getParameter("range_min") != null) {
			fromPrice = Integer.parseInt(request.getParameter("range_min"));
			toPrice = Integer.parseInt(request.getParameter("range_max"));
		}

		priceSortText = "Theo mức giá";

		// lấy ra loại lọc theo giá, từ thấp đến cao là 1, từ cao đến thấp là 0, khoảng
		// giá là 2
		typeOfSort = request.getParameter("order");

		if (typeOfSort == null && request.getParameter("brands") == null && request.getParameter("range_min") == null) {
			brands = new ArrayList<>();
			iFilterByPrice = new FilterEmptyPrice(nameProduct);
			iFilterByBrand = new FilterEmptyBrands(nameProduct);
		} else if (typeOfSort.equals("0")) {
			iFilterByPrice = new FilterPriceDESC(nameProduct);
			priceSortText = "Từ cao đến thấp";
		} else if (typeOfSort.equals("1")) {
			iFilterByPrice = new FilterPriceASC(nameProduct);
			priceSortText = "Từ thấp đến cao";
		} else if (typeOfSort.equals("2")) {
			iFilterByPrice = new FilterPriceInRange(nameProduct, fromPrice, toPrice);

			if (fromPrice < minPrice) {
				// nếu giá trị từ đâu thấp hơn giá thấp nhất thì sẽ set giá hiện tại là thấp
				// nhất
				minPriceCurrent = minPrice;
			} else if (toPrice > maxPrice) {
				// nếu giá trị đến đâu cao hơn giá cao nhất thì sẽ set giá hiện tại là cao
				// nhất
				maxPriceCurrent = maxPrice;
			} else {
				minPriceCurrent = fromPrice;
				maxPriceCurrent = toPrice;
			}
		}

		if (request.getParameter("brands") != null) {
			brandID = Integer.parseInt(request.getParameter("brands"));
			Brand brand = getBrandChoice(brandID);
			if (brands.contains(brand)) {
				brands.remove(brand);
			} else {
				brands.add(brand);
			}
			iFilterByBrand = new FilterBrands(nameProduct, brands);

			brandSortText = brandsOnDefault(brands);
		}

		if (brands.size() == 0) {
			brandSortText = "Theo thương hiệu";
		}

		strategy = new FilterStrategy(iFilterByPrice, iFilterByBrand);

		products = strategy.filter(request.getServletContext().getRealPath(""));

		// lấy trang hiện tại thông qua tham số currentPage trên url, mặc định là trang
		// đầu tiên
		String getCurrentPageOnUrl = request.getParameter("currentPage");
		currentPage = Integer.parseInt(getCurrentPageOnUrl);

		// lấy ra số sản phẩm
		totalProduct = products.size();

		totalPage = totalPage(totalProduct, perPage);

		// nếu có sản phẩm thì mới bắt đầu hiện sản phẩm

		// lấy ra danh sách sản phẩm từ trang hiện tại
		/*
		 * vd: trang hiện tại là 1 thì lấy từ 0 đến 19 trang 2 thì lấy từ 20 đến 39
		 */
		perProduct = renderProduct(currentPage, perPage, products);

		// sau khi lấy tất cả dữ liệu cần thiết thì dùng method doGet để xử lý dữ liệu
		doGet(request, response);

	}

	// trả về object brand đã được chọn để filter
	private Brand getBrandChoice(int id) {
		for (Brand brand : brandsDefault) {
			if (brand.getId() == id) {
				return brand;
			}
		}
		return null;
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

	// biến danh sách thương hiệu thành chuỗi tên các thương hiệu
	private String brandsOnDefault(List<Brand> brands) {
		String res = "";

		for (int i = 0; i < brands.size(); i++) {
			if (i == brands.size() - 1) {
				res += brands.get(i).getName();
				break;
			}

			res += brands.get(i).getName() + ", ";
		}
		return res;
	}

	// trả về danh sách chứa các trang mà hiển thị lên màn hình
	// tham số là trang hiện tại và 1 lần hiển thị bao nhiêu trang
	// ví dụ: trang hiện tại là 3 thì hiển thị là 1 2 3 4 5 6
	// từ trang số 4 trở đi sẽ k hiện trang số 1 cho nên từ trang 4 trở đi thì có
	// thêm trang số 1

	public List<Integer> generatePagination(int currentPage, int pagesPerGroup) {
		List<Integer> res = new ArrayList<>();

		if (currentPage > 3) {
			res.add(1);
		}

		pagesPerGroup = (pagesPerGroup - 1) / 2;
		for (int i = currentPage - pagesPerGroup; i <= currentPage + pagesPerGroup; i++) {
			if (i > 0 && i <= totalPage) {
				res.add(i);
			}
		}
		return res;
	}
}