<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/general/logo.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/headAdmin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/productAdmin.css">
    <link rel="stylesheet" href="../css/orderAdmin.css">
    <title>Quản lý đơn hàng</title>
</head>
<%@ page import="java.util.List"%>
<%@ page import="model.Order"%>
<%@ page import="model.Product"%>
<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<body style="display: flex;">
    <%@include file="headerAdmin.jsp"%>

    <div id="product">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark container">
            <div class="container-fluid">
                <span class="navbar-brand">Đơn hàng</span>
            </div>
        </nav>

        <nav class="navbar navbar-expand-sm bg-light">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <form action="orderAdmin" method="POST">
                        <div class="header_search">
                            <input name="orderID" type="text" class="search" placeholder="Tìm theo mã đơn hàng">
                            <button type="submit" class="fa-solid fa-magnifying-glass search_logo"></button>
                        </div>
                        </form>
                    </li>

                    <li class="nav-item">
                    	<form action="orderAdmin" method="POST"">
                        <div class="header_search">
                            <input name="email" type="text" class="search" placeholder="Tìm theo email">
                            <button type="submit" class="fa-solid fa-magnifying-glass search_logo"></button>
                        </div>
                        </form>
                        
                    </li>

                    <li class="nav-item">
                    	<form action="orderAdmin" method="GET">
                        <div class="header_search">
	                        	<select name="statusID">
		                            <option value="-1">Tất cả</option>
		                            <option value="1">Chờ xử lý</option>
		                            <option value="2">Đang giao</option>
		                            <option value="3">Bị hủy</option>
		                            <option value="4">Hoàn thành</option>
		                        </select>
	                            <button type="submit" class="fa-solid fa-magnifying-glass search_logo"></button>
                        </div>
                        </form>
                    </li>
                </ul>
            </div>
        </nav>

        <table>
            <thead>
                <tr>
                    <th>Mã đơn</th>
                    <th>Email</th>
                    <th>Tên KH</th>
                    <th>Tổng giá</th>
                    <th>Ngày tạo</th>
                    <th>Lần cập nhật cuối</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            	<%for(Order order : orders){ %>
            	<tr>
            		<td><%=order.getId() %></td>
                    <td><%=order.getAccount().getEmail() %></td>
                    <td><%=order.getAccount().getFullName() %></td>
                    <td><%=new Product().formatNumber(order.getTotalPrice())%>đ</td>
                    <td><%=order.getDateCreated().toString() %></td>
                    <td><%=order.getLastUpdated().toString() %></td>
                    <td>
                    <% int statusID = order.getStatus().getId(); %>
                    <% if(statusID == 1){ %>
                    	<span class="status-box waiting">Chờ xử lý</span>
                    <%} else if(statusID == 2){%>
                    	<span class="status-box shipping">Đang giao</span>
                    <%} else if(statusID == 3){%>
                    	<span class="status-box canceled">Đã hủy đơn</span>
                    <%} else if(statusID == 4){%>
                    	<span class="status-box completed">Hoàn tất</span>
                    <%} %>
                    </td>
                    <td>
						<form action="adminOrderDetail" method="get">
							<input type="hidden" name="orderID" value="<%=order.getId()%>">
							<button class="details-btn">Chi tiết</button>
						</form>
                    </td>
                </tr>    
            	<%} %>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
        </script>

</body>

</html>