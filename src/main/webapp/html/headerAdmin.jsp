<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/headAdmin.css">
<title>Menu của admin</title>
</head>

<body>
	<!-- 
        Create: Nguyễn Khải Nam
        Date: 30/10/2023
        Note: Thiết lập bố cục cho trang admin
     -->
	<div id="admin">
		<div class="navbar">
			<a href="#"> <img class="admin_logo"
				src="../image/general/logo.png" alt=""></a>
		</div>

		<div class="admin-menu">
			<ul class="navbar-nav mr-auto mt-2">
				<li class="nav-item">
					<div class="nav-link">
						<a href="overviewAdmin.jsp" id="nav-item_item_child-GENERAL">
							<i class="fa-solid fa-house icon_title"></i> Tổng quan
						</a>
					</div>
				</li>

				<li class="nav-item">
					<div class="nav-link">
						<a href="#"> <i class="fa-solid fa-user-tie icon_title"></i>
							Người dùng
						</a> <i class="fa-solid fa-caret-down icon_down"></i>
					</div>

					<ul class="nav-item_list_child" id="nav-item_list_child-user">
						<li class="nav-item_item_child" id="nav-item_item_child-PQ"><a
							href="userDecentralizationAdmin.jsp">Phân quyền người dùng</a></li>
						<li class="nav-item_item_child" id="nav-item_item_child-TKND"><a
							href="userStatisticsAdmin.jsp">Thống kê người dùng</a></li>
					</ul>
				</li>

				<li class="nav-item">
					<div class="nav-link">
						<a href="#"> <i class="fa-brands fa-product-hunt icon_title"></i>
							Sản phẩm
						</a> <i class="fa-solid fa-caret-down icon_down"></i>

					</div>

					<ul class="nav-item_list_child" id="nav-item_list_child-product">

						<li class="nav-item_item_child" id="nav-item_item_child-TKSP"><a
							href="statisticProducts">Thống kê sản phẩm</a></li>
						<li class="nav-item_item_child" id="nav-item_item_child-CS"><a
							href="editProductsAdmin.jsp">Chỉnh sửa sản phẩm</a></li>
						<li class="nav-item_item_child" id="nav-item_item_child-HIDDEN"><a
							href="editProductHidenAdmin.jsp">Sản phẩm bị ẩn</a></li>
					</ul>
				</li>

				<li class="nav-item">
					<div class="nav-link">
						<a href="#"> <i class="fa-solid fa-cart-shopping icon_title"></i>
							Đơn hàng
						</a> <i class="fa-solid fa-caret-down icon_down"></i>
					</div>

					<ul class="nav-item_list_child" id="nav-item_list_child-order">
						<li class="nav-item_item_child" id="nav-item_item_child-XDH"><a
							href="orderAdmin.jsp">Xem đơn hàng</a></li>
						<li class="nav-item_item_child" id="nav-item_item_child-TKDT"><a
							href="statisticOrderAdmin.jsp">Thống kê doanh thu</a></li>
					</ul>
				</li>

				<li class="nav-item">
					<div class="nav-link">
						<a href="#"> <i class="fa-solid fa-cart-shopping icon_title"></i>
							Voucher
						</a> <i class="fa-solid fa-caret-down icon_down"></i>
					</div>

					<ul class="nav-item_list_child" id="nav-item_list_child-voucher">
						<li class="nav-item_item_child" id="nav-item_item_child-QLVC"><a
							href="editVoucherAdmin.jsp">Quản lý voucher</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>

	<script src="../js/headerAdmin.js"></script>
</body>

</html>