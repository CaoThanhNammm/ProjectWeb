package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.ProductModelDAO;
import database.JDBIConnectionPool;
import model.Product;

/**
 * Servlet implementation class AnalysisProduct
 */
@WebServlet("/html/statisticProducts")
public class AnalysisProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AnalysisProduct() {
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
		Handle h = JDBIConnectionPool.get().getConnection();
		ProductDAO pDao = new ProductDAO(h, request.getServletContext().getRealPath(""));
		try {
			LocalDate date = LocalDate.now();
			List<Product> ps = pDao.getAll();
			long total = ps.size();
			long avai = 0;
			long newP = 0;
			for (Product p : ps) {
				if (p.getStatus().getId() == 1) {
					avai += 1;
				}

				if (p.getLastUpdated().isEqual(date)) {
					newP += 1;
				}
			}

			ProductModelDAO pmDao = new ProductModelDAO(h);
			OrderDAO orderDao = new OrderDAO(h);

			long[] countBuy = pmDao.getCountBuy();
			long[] giveAvai = orderDao.getGiveVai();
			long[] countApproach = orderDao.getApproach();

			request.setAttribute("count-total", total);
			request.setAttribute("count-avai", avai);
			request.setAttribute("count-new-product", newP);
			request.setAttribute("count-buy", countBuy);
			request.setAttribute("count-give-avai", giveAvai);
			request.setAttribute("count-approach", countApproach);

			JDBIConnectionPool.get().releaseConnection(h);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendError(500);
		}
		request.getRequestDispatcher("statisticProductsAdmin.jsp").forward(request, response);
	}

}
