package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdbi.v3.core.Handle;

import dao.ProductDAO;
import database.JDBIConnectionPool;
import model.Product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/html/detail")
public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productID = Integer.valueOf(req.getParameter("id"));
        Handle connection = JDBIConnectionPool.get().getConnection();
        ProductDAO dao = new ProductDAO(connection, null);
        Product product = dao.findProductByID(productID);
        JDBIConnectionPool.get().releaseConnection(connection);
        boolean available = true;
        if(product.getStatus().getId() != 2) {
        	available = false;
        }
        List<String> imgs = new ArrayList<String>();
        String realPath = req.getServletContext().getRealPath("/image/product/" + productID);
        File productImagePath = new File(realPath);
        for(String imageName : productImagePath.list()) {
        	imgs.add(imageName);
        }
        req.setAttribute("product", product);
        req.setAttribute("images", imgs);
        req.setAttribute("available", available);
        RequestDispatcher dispatcher = req.getRequestDispatcher("detail.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
