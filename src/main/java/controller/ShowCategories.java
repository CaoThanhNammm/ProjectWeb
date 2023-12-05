package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.CategoriesDAO;
import database.JDBIConnectionPool;
import model.Category;

@WebServlet("/html/ShowCategories")
public class ShowCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowCategories() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Handle connection = JDBIConnectionPool.get().getConnection();
		CategoriesDAO categoriesDAO = new CategoriesDAO(connection);
		List<Category> categories = categoriesDAO.getCategoryLimitN(8);
		JDBIConnectionPool.get().releaseConnection(connection);
		
		request.setAttribute("categories", categories);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
