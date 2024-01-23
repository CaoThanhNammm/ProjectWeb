<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/cart.css">
<link rel="stylesheet" href="../css/indexRes.css">
<title>Chi tiết đơn hàng</title>
</head>
<%@ page import="model.Account"%>
<%@ page import="model.Order"%>
<%@ page import="model.Product"%>
<%@ page import="model.OrderDetail"%>
<%
	Object orderObject = request.getAttribute("order");
	Account acInfo = (Account) request.getAttribute("acInfo");
	Order order = null;
	Account account = null;
	if(orderObject != null){
		order = (Order) orderObject;
		account = order.getAccount();
	}
	int sumPrice = 0;
%>
<body>
	<div id="page">

		<!-- 
            Create: Nguyễn Khải Nam
            Date: 23/10/2023
            Note: Trang giỏ hàng
         -->
		<div id="cart" class="container mt-5">
			<div class="cart_body container mt-5">
				<!-- Nếu không có sản phẩm -->
				<% if(order == null){ %>
				<div >
					<h3>Đơn hàng không tồn tại</h3>
				</div>
				<%} else {%>
				<!-- Nếu có sản phẩm -->
				<div class="cart_body-item row">	
					<div class="cart_body_list col-lg-8">
						<form id="checkoutForm" action="checkout" method="POST">
							<input type="hidden" name="cart" value="true">
							<% for(OrderDetail detail : order.getDetails()){ %>
							<% Product product = detail.getModel().getProduct();
								int finalPrice = product.getPrice() - product.getDiscount();
								sumPrice += finalPrice * detail.getQuantity();
							%>
							<div class="card">
								<img class="card-img-top" src="../image/product/<%=product.getId()%>/<%=product.getImgs()%>">
								<div class="card-body">
									<h3 class="card-title"><%=product.getName()%></h3>
									<p class="card-text">Mã sản phẩm: <%=product.getId()%></p>
									<p class="card-text">Mã lựa chọn: <%=detail.getModel().getId()%></p>
									<p class="card-text">Lựa chọn: <%=detail.getModel().getOptionValue()%></p>
									<p class="card-text">Giá: <%=product.formatNumber(finalPrice)%>đ</p>
									<p class="card-text">Số lượng: <%=detail.getQuantity()%></p>
								</div>
							</div>
							<%} %>
						</form>
					</div>

					<div class="cart_body_bill col-lg-4">
						<h2 class="mt-3 text-start">Thông tin đơn hàng</h2>
						<div class="cart_body_bill_group">
							<h6>Mã khách hàng: </h6>
							<h6><%=account.getId() %></h6>
						</div>
						<div class="cart_body_bill_group">
							<h6>Email: </h6>
							<h6><%=acInfo.getEmail() %></h6>
						</div>
						<div class="cart_body_bill_group">
							<h6>Số điện thoại: </h6>
							<h6><%=acInfo.getPhone() %></h6>
						</div>
						<div class="cart_body_bill_group">
							<h6>Địa chỉ: </h6>
							<h6><%=acInfo.getAddress() %></h6>
						</div>
						<div class="cart_body_bill_group cart_body_bill-line">
							<h6>Tên: </h6>
							<h6><%=acInfo.getFullName() %></h6>
						</div>
						<div class="cart_body_bill_group cart_body_bill-line">
							<h6>Thành tiền</h6>
							<h6><%= new Product().formatNumber(sumPrice) %>đ</h6>
						</div>
						<div class="cart_body_bill_group cart_body_bill-line">
							<h6>Vận chuyển</h6>
							<h6>Giao hàng cấp tốc</h6>
						</div>
						<div class="cart_body_bill_group">
							<h6>Giảm giá từ voucher</h6>
							<h6>0đ</h6>
						</div>
						<div class="cart_body_bill_group cart_body_bill-line">
							<h6>Tổng cộng</h6>
							<h6><%= new Product().formatNumber(sumPrice) %>đ</h6>
						</div>
						<div class="cart_body_bill_group">
							<h6>Trạng thái</h6>
							<h6><%=order.getStatus().getName() %></h6>
						</div>
						<form action="adminOrderDetail?id=<%=order.getId() %>" method="POST">
                        <div class="cart_body_bill_group">
	                        	<select name="statusID">
		                            <option value="1">Chờ xử lý</option>
		                            <option value="2">Đang giao</option>
		                            <option value="3">Bị hủy</option>
		                            <option value="4">Hoàn thành</option>
		                        </select>
	                            <button type="submit">Thay đổi</button>
                        </div>
                        </form>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous">
		
	</script>

	<script src="../js/index.js"></script>
	<!-- Tạo bởi: Nguyễn Khải Nam
    Ngày: 20/10/2023
    Tác dụng: Xử lý cho phần sản phẩm -->
	<script src="../js/cart.js"></script>
</body>

</html>