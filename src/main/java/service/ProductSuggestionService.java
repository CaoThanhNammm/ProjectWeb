package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.ProductDAO;
import model.Product;

@WebServlet("/ProductSuggestionService")
public class ProductSuggestionService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductSuggestionService() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
	
		PrintWriter out = response.getWriter();
		
		String nameProduct = request.getParameter("nameProduct");
		ProductDAO dao = new ProductDAO();
		List<Product> products = dao.findProductByNameLimitN(nameProduct, 10);
		request.setAttribute("products", products);
		JsonArray jsonArray = new JsonArray();
		
		
		for (Product product : products) {
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("id", product.getId());
			jsonObject.addProperty("name", product.getName());
			jsonArray.add(jsonObject);
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(jsonArray);
		out.print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	
	

}