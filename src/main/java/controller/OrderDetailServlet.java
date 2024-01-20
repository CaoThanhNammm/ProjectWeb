package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;

@WebServlet("/html/orderDetail")
public class OrderDetailServlet extends HttpServlet {
    public OrderDetailServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = (Account) request.getSession().getAttribute("account");
		int orderID = Integer.valueOf(request.getParameter("orderID"));
		
	}

}
