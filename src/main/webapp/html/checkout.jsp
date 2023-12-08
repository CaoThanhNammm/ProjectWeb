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
<link rel="stylesheet" href="../css/indexRes.css">
<link rel="stylesheet" href="../css/checkout.css">
<title>Thanh toán</title>
</head>
<%@ page import="model.Cart"%>
<%@ page import="model.ProductModel"%>
<%@ page import="model.Account"%>
<%@ page import="java.util.Map"%>
<%
Cart cart = (Cart) session.getAttribute("cart");
Account acInfo = (Account) request.getSession().getAttribute("accountInfo");
%>

<body>
	<%@include file="header.jsp"%>
	<div id="page">
		<%
		if (ac != null) {
		%>
		<div class="checkout">
			<form class="checkout-form" action="../checkout">
				<input type="hidden" name="checkout" value="pay">
				<h2>Thông tin khách hàng</h2>
				<label>Tên khách hàng:</label> <input type="text" name="username"
					placeholder="Nhập tên" value="<%=acInfo.getFullName()%>" required>
				<label>Email:</label> <input type="email" name="email"
					placeholder="Nhập email..." value="<%=acInfo.getEmail()%>" readonly>
				<label>Số điện thoại:</label> <input type="text" name="phone"
					placeholder="Số điện thoại..." value="<%=acInfo.getPhone()%>"
					required> <label for="shipping">Địa chỉ:</label> <input
					type="text" name="address" placeholder="Địa chỉ..."
					value="<%=acInfo.getAddress()%>" required>
				<div style="display: flex; justify-content: space-between;">
					<a href="../html/cart.jsp" class="button">Trở về giỏ hàng</a>
					<button>Đặt hàng</button>
				</div>
			</form>

			<div class="summary">
				<h2>Tóm tắt đơn hàng</h2>
				<%
				Map<ProductModel, Integer> map = cart.getCartItems();
				long total = 0;
				long voucher = 0;
				%>
				<%
				for (Map.Entry<ProductModel, Integer> entry : map.entrySet()) {
				%>
				<%
				ProductModel model = entry.getKey();
				Integer amount = entry.getValue();
				if (amount > 0) {
				%>
				<div class="summary-item">
					<span><%=model.getProduct().getName() + " x" + amount%></span> <span><strong><%=model.getProduct().getPrice() * amount%>đ</strong></span>
					<%
					total += model.getProduct().getPrice() * amount;
					%>
				</div>
				<%
				}
				%>
				<%
				}
				%>
				<hr>
				<div class="summary-item">
					<span>Giảm giá từ voucher:</span> <span><strong>- <%=voucher%>đ
					</strong></span>
				</div>
				<hr>
				<div class="summary-item">
					<span>Phí vận chuyển:</span> <span><strong><%=total * 0.1%>đ</strong></span>
				</div>
				<hr>
				<div class="summary-item">
					<span>Tổng</span> <span><strong><%=(total - voucher)%>đ</strong></span>
				</div>
				<div class="summary-item">
					<span>Phương pháp thanh toán</span> <span><strong>Trả
							tiền mặt (COD)</strong></span>
				</div>
			</div>
		</div>
		<%
		} else {
		%>
		<div class="container d-flex flex-column">
			<h3 class="text-center">Vui lòng đăng nhập trước khi thanh toán</h3>
			<a href="login.jsp" class="btn checkout-btn">Đăng nhập</a>
		</div>
		<%
		}
		%>
	</div>
	<%@include file="footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous">
		
	</script>

	<script>
		function redirect(page) {
			window.location.href = 'https://www.example.com';
		}
	</script>

	<script src="../js/index.js"></script>
</body>

</html>