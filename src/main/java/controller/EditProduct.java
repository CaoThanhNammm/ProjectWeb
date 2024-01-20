package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.AttributeDAO;
import dao.BrandDAO;
import dao.CategoriesDAO;
import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Attribute;
import model.Brand;
import model.Category;
import model.Product;
import model.Status;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/html/editProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status = request.getParameter("status");
		Handle connection = JDBIConnectionPool.get().getConnection();
		int id = Integer.parseInt(request.getParameter("id-product"));
		ProductDAO dao = new ProductDAO(connection, request.getServletContext().getRealPath(""));
		BrandDAO brandDAO = new BrandDAO(connection, request.getServletContext().getRealPath(""));
		CategoriesDAO cateDAO = new CategoriesDAO(connection);
		AttributeDAO atDAO = new AttributeDAO(connection);
		Product p = null;
		List<Brand> bs = brandDAO.getAll();
		List<Category> cs = cateDAO.getAll();
		if (status.equals("edit")) {
			p = dao.findProductByID(id);
		} else if (status.equals("update")) {
			String[] paths = request.getParameterValues("e-img");
			imageDecoder(request.getServletContext().getRealPath("image/product"), id, paths);
			int price = Integer.parseInt(request.getParameter("p-price"));
			int discount = Integer.parseInt(request.getParameter("p-discount"));
			String name = request.getParameter("p-name");
			String des = request.getParameter("p-description");
			int brandID = Integer.parseInt(request.getParameter("p-brand"));
			int cateID = Integer.parseInt(request.getParameter("p-category"));
			int amount = Integer.parseInt(request.getParameter("p-amount"));
			int countAt = atDAO.getAll().size();

			// same size with pAtValue
			String[] pAtName = request.getParameterValues("p-at-name");
			String[] pAtValue = request.getParameterValues("p-at-value");
			List<Attribute> ats = new ArrayList<Attribute>();
			if (pAtName != null && pAtValue != null) {
				for (int i = 0; i < pAtName.length; i++) {
					Attribute at = atDAO.getAttributeByName(id, pAtName[i]);
					if (at == null) {
						at = new Attribute(++countAt, pAtName[i], pAtValue[i]);
					} else {
						at.setValue(pAtValue[i]);
					}
					ats.add(at);
				}
			}
			Product newP = new Product(id, name, brandDAO.getBrand(brandID), des, cateDAO.getCategory(cateID), price,
					discount, LocalDate.now(), amount,
					amount == 0 ? new Status(3, "Hết hàng") : new Status(2, "Khả dụng"), null, null, ats);
			try {
				p = dao.updateProduct(id, newP);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				p = dao.findProductByID(id);
				e.printStackTrace();
			}

		}
		request.setAttribute("product", p);
		JDBIConnectionPool.get().releaseConnection(connection);
		request.setAttribute("title", p.getName());
		request.setAttribute("list-brand", bs);
		request.setAttribute("list-category", cs);
		request.getRequestDispatcher("formProductAdmin.jsp").forward(request, response);
	}

	private void imageDecoder(String src, int pid, String[] paths) {
		// TODO Auto-generated method stub
		if (paths != null) {
			String pack = src + "\\" + pid + "\\";
			File realFolder = new File(src.substring(0, src.indexOf("java") + 4)
					+ "\\ProjectWeb\\src\\main\\webapp\\image\\product\\" + pid);
			File folder = new File(pack);
			if (!folder.exists()) {
				System.out.println("Chưa tồn tại thư mục!!!");
				return;
			}
			for (String path : paths) {
				if (path.contains(",")) {
					String[] parts = path.split(",");
					int num = Integer.parseInt(parts[0]);
					String base64Data = parts[2];
					byte[] imageBytes = Base64.getDecoder().decode(base64Data);
					try {
						BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageBytes));
						String fileName = folder.list()[num];
						String realFileName = realFolder.list()[num];
						Path targetPath = Paths.get(pack, fileName);
						Path realPath = Paths.get(realFolder.getAbsolutePath(), realFileName);
						ImageIO.write(image, "png", targetPath.toFile());
						ImageIO.write(image, "png", realPath.toFile());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
