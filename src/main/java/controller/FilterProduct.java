package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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

@WebServlet("/html/FilterProduct")
public class FilterProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int PER_PAGE = 20;
	private static int PAGES_PER_GROUP = 5;
	private List<Brand> brandsDefault;
	private List<Brand> brandChoice;
	private List<Integer> createPages;
	private String brandSortText;
	private String priceSortText;
	private List<Product> products;
	private List<Product> perProduct;
	private IFilterByPrice iFilterByPrice;
	private IFilterByBrand iFilterByBrand;
	private int minPriceCurrent;
	private int maxPriceCurrent;
	private int minPrice;
	private int maxPrice;
	private String nameProduct;
	private int typeOfOrder;
	private int currentPage;
	private int fromPrice;
	private int toPrice;
	private String temp;

	public FilterProduct() {
		super();
		brandChoice = new ArrayList<>();
		typeOfOrder = -1;
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
		// dùng để hiển thị những thương hiệu mặc định của tất cả sản phẩm
		request.setAttribute("nameProduct", nameProduct);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("createPages", createPages);
		request.setAttribute("typeOfSort", typeOfOrder);
		request.setAttribute("chooseBrands", brandSortText);
		request.setAttribute("uri", request.getRequestURI());
		request.setAttribute("brands", brandsDefault);
		request.setAttribute("priceSortText", priceSortText);
		request.setAttribute("brandSortText", brandSortText);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);
		request.setAttribute("minPriceCurrent", minPriceCurrent);
		request.setAttribute("maxPriceCurrent", maxPriceCurrent);
		request.setAttribute("products", perProduct);

		// đẩy dữ liệu qua trang jsp và chuyển trang
		request.getRequestDispatcher("/html/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		nameProduct = request.getParameter("nameProduct").trim();
		if (temp != null && !temp.equals(nameProduct)) {
			brandChoice = new ArrayList<>();
			typeOfOrder = -1;
		}
		temp = nameProduct;

		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		if (request.getParameter("order") != null) {
			typeOfOrder = Integer.parseInt(request.getParameter("order"));
		}

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

		// nếu chọn filter theo khoảng giá thì lấy ra giá trị từ đâu dến đâu
		if (request.getParameter("range_min") != null) {
			fromPrice = Integer.parseInt(request.getParameter("range_min"));
			toPrice = Integer.parseInt(request.getParameter("range_max"));
		}

		minPriceCurrent = minPrice;
		maxPriceCurrent = maxPrice;

		priceSortText = "Theo mức giá";
		if (typeOfOrder == -1) {
			iFilterByPrice = new FilterEmptyPrice(nameProduct);
		}

		if (typeOfOrder == 0) {
			iFilterByPrice = new FilterPriceDESC(nameProduct);
			priceSortText = "Từ cao đến thấp";
		} else if (typeOfOrder == 1) {
			iFilterByPrice = new FilterPriceASC(nameProduct);
			priceSortText = "Từ thấp đến cao";
		} else if (typeOfOrder == 2) {
			try {
				minPrice = productDAO.getMinPrice(nameProduct);
				maxPrice = productDAO.getMaxPrice(nameProduct);
			} catch (SQLException e) {
				e.printStackTrace();
			}

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

			priceSortText = "Từ " + formatNumber(minPriceCurrent) + "₫ đến " + formatNumber(maxPriceCurrent) + "₫";
		}

		if (brandChoice.size() == 0) {
			iFilterByBrand = new FilterEmptyBrands(nameProduct);
		}

		if (request.getParameter("brand") != null) {
			int brandID = Integer.parseInt(request.getParameter("brand"));
			brandID = Integer.parseInt(request.getParameter("brand"));
			Brand brand = getBrandChoice(brandID);
			if (brandChoice.contains(brand)) {
				brandChoice.remove(brand);
			} else {
				brandChoice.add(brand);
			}
			iFilterByBrand = new FilterBrands(nameProduct, brandChoice);

			brandSortText = brandsOnDefault(brandChoice);
		}

		if (brandChoice.size() == 0) {
			brandSortText = "Theo thương hiệu";
			brandChoice = new ArrayList<>();
		}

		FilterStrategy strategy = new FilterStrategy(iFilterByPrice, iFilterByBrand);
		products = strategy.filter(request.getServletContext().getRealPath(""));
		JDBIConnectionPool.get().releaseConnection(connection);

		perProduct = renderProduct(currentPage, PER_PAGE, products);
		doGet(request, response);
	}

	private Brand getBrandChoice(int id) {
		for (Brand brand : brandsDefault) {
			if (brand.getId() == id) {
				return brand;
			}
		}
		return null;
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

	public String formatNumber(int nums) {
		Locale vietnameseLocale = new Locale("vi", "VN");
		NumberFormat vietnameseFormat = NumberFormat.getInstance(vietnameseLocale);
		String formattedNumberVietnamese = vietnameseFormat.format(nums);
		return formattedNumberVietnamese;
	}

}
