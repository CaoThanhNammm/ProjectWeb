package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.jdbi.v3.core.Handle;

import model.Account;
import model.Order;
import model.OrderDetail;
import model.Status;

public class OrderDAO {
	private Handle connection;
	
	public OrderDAO(Handle connection) {
		this.connection = connection;
	}
	
	public List<Order> getAll(){
		return null;
	}
	
	public List<Order> getAccountOrders(Account account){
		List<Order> orders = new ArrayList<Order>();
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT o.id, o.dateCreated, o.lastUpdated, s.name AS statusName, SUM((d.price - d.discount)*d.quantity) AS totalPrice");
			sql.append("FROM orders o ");
			sql.append("JOIN order_details d ON o.id = d.orderID ");
			sql.append("JOIN order_status s ON o.statusID = s.id ");
			sql.append("WHERE o.userID = ? ");
			sql.append("GROUP BY o.id, o.dateCreated, o.lastUpdated, s.name");
			PreparedStatement statement = connection.getConnection().prepareStatement(sql.toString());
			statement.setString(1, account.getId());
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				int orderID = rs.getInt(1);
				LocalDate dateCreated = rs.getDate(2).toLocalDate();
				LocalDate lastUpdated = rs.getDate(3).toLocalDate();
				Status status = new Status(-1, rs.getString(4));
				int totalPrice = rs.getInt(5);
				Order order = new Order(orderID, account, dateCreated, lastUpdated, null, null, status, null);
				orders.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return orders;
	}
	
	public Order getOrderByID(int orderID) {
		Order order = new Order(orderID, null, null, null, null, null, null, null);
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT o.dateCreated, o.lastUpdated, s.name AS statusName ");
			sql.append("d.modelID, d.price, d.discount, d.quantity ");
			sql.append("FROM orders o ");
			sql.append("JOIN order_details d ON o.id = d.orderID ");
			sql.append("JOIN order_status s ON o.statusID = s.id ");
			sql.append("WHERE o.id = ? ");
			PreparedStatement statement = connection.getConnection().prepareStatement(sql.toString());
			statement.setInt(1, orderID);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				LocalDate dateCreated = rs.getDate(1).toLocalDate();
				LocalDate lastUpdated = rs.getDate(2).toLocalDate();
				Status status = new Status(-1, rs.getString(3));
				int modelID = rs.getInt(4);
				int price = rs.getInt(5);
				int discount = rs.getInt(6);
				int quantity = rs.getInt(7);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}
}
