<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="../image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/headerRes.css">
<title>Header</title>
</head>
<%@ page import="model.Account"%>
<%
Account ac = (Account) session.getAttribute("account");
%>

<body>
	<!-- 
        Create: Cao Thành Nam
        Date: 18/10/2023
        Note: header của trang web 
    -->
	<div class="header">
		<a href="../index/index.jsp" class="logo_page"><img
			src="../image/general/logo.png" alt=""></a>
		<!-- phần tìm kiếm sản phẩm của header -->
		<div class="header_search">
			<input type="text" class="search" placeholder="Tìm đồ gia dụng">
			<i class="fa-solid fa-magnifying-glass search_logo"></i>
		</div>

		<!-- phần đăng nhập hoặc đăng ký của header -->
		<div class="header_login_signin">
			<%
<<<<<<< HEAD
			if (ac == null) {
=======
			String name = (String) session.getAttribute("name");
			if (name == null) {
>>>>>>> master
			%>
			<a href='../html/login.jsp' class='log_in'>Đăng nhập</a>
			<div class='line'></div>
			<a href='../html/register.jsp' class='sign_in'>Đăng ký</a>
			<%
			} else {
			%>
<<<<<<< HEAD
			<a href='../hmtl/user.jsp' class='log_in'> Xin chào, <%=ac.getFullName()%></a>
=======
			<div class='log_in'><%=name%></div>
>>>>>>> master
			<%
			}
			%>

		</div>

		<div class="list_wishList">
			<i class="fa-regular fa-heart"></i> <span class="amount_wishlist">0</span>
		</div>

		<div class="header_login_signin_mobile">
			<a href="login.jsp"><img src="../image/home/user.png" alt=""></a>
		</div>

		<!-- phần giỏ hàng của header -->
		<div class="header_cart">
			<div class="header_cart_info">
				<a href="cart.jsp"> <img src="../image/home/cart.png"
					class="header_cart_logo" alt=""> <span
					class="header_cart_amount_product">0</span>
				</a>
			</div>
		</div>
	</div>
	<!-- phần danh mục sản phẩm của header -->
	<div class="navigation">
		<div class="all_list">
			<i class="fa-solid fa-list all_list_logo"></i> <span
				class="all_list_text">Tất cả danh mục</span>
		</div>

		<ul class="navigtion-list">
			<li class="navigtion-item"><a href="../html/product.jsp">Máy
					lọc nước</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Nồi
					chiên</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Bếp
					điện</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Nồi
					cơm</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Máy
					ép trái cây</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Máy
					xay sinh tố</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Bếp
					ga</a></li>
			<li class="navigtion-item"><a href="../html/product.jsp">Bình
					đun</a></li>
		</ul>

		<div class="list_wishList--mobile">
			<i class="fa-regular fa-heart"></i> <span class="amount_wishlist">0</span>
		</div>
	</div>

	<div class="modal_overlay"></div>
	<div class="modal_body">
		<i class="fa-solid fa-xmark modal_body_quit"></i>
		<ul class="category_all_list">
			<div>
				<li class="category_all_item">Nồi, Bếp Lò <i
					class="fa-solid fa-chevron-down category_all_item_icon"></i>
				</li>
				<ul class="category_all_item_child_list">
					<li><a href="../html/product.jsp">Nồi chiên không dầu</a></li>
					<li><a href="../html/product.jsp">Nồi cơm điện</a></li>
					<li><a href="../html/product.jsp">Nồi áp suất</a></li>
					<li><a href="../html/product.jsp">Nồi nấu chậm</a></li>
					<li><a href="../html/product.jsp">Nồi, bộ nồi</a></li>
					<li><a href="../html/product.jsp">Chảo chống dính</a></li>
					<li><a href="../html/product.jsp">Bếp từ</a></li>
					<li><a href="../html/product.jsp">Bếp gà</a></li>
					<li><a href="../html/product.jsp">Bếp hồng ngoại</a></li>
					<li><a href="../html/product.jsp">Lò vi sóng</a></li>
					<li><a href="../html/product.jsp">Lò nướng</a></li>
					<li><a href="../html/product.jsp">Lẩu điện</a></li>
				</ul>
			</div>

			<div>
				<li class="category_all_item">Xay ép pha chế <i
					class="fa-solid fa-chevron-down category_all_item_icon"></i>
				</li>
				<ul class="category_all_item_child_list">
					<li><a href="../html/product.jsp">Máy xay sinh tố</a></li>
					<li><a href="../html/product.jsp">Máy ép trái cây</a></li>
					<li><a href="../html/product.jsp">Máy ép chậm</a></li>
					<li><a href="../html/product.jsp">Máy pha cà phê</a></li>
					<li><a href="../html/product.jsp">Máy xay cà phê</a></li>
				</ul>
			</div>

			<div>
				<li class="category_all_item">Gia dụng nhà bếp <i
					class="fa-solid fa-chevron-down category_all_item_icon"></i>
				</li>
				<ul class="category_all_item_child_list">
					<li><a href="../html/product.jsp">Bình đun siêu tốc</a></li>
					<li><a href="../html/product.jsp">Bình thủy điện</a></li>
					<li><a href="../html/product.jsp">Chén bát</a></li>
					<li><a href="../html/product.jsp">dao, kéo</a></li>
					<li><a href="../html/product.jsp">thớt</a></li>
				</ul>
			</div>
		</ul>
	</div>

	<div class="modal_body_wishList">
		<div class="wishlist_header">
			<i class="fa-solid fa-xmark modal_body_quit_wishlist"></i>
			<h3 class="wishlist_title"
				style="margin-bottom: 0; margin-left: 12px;">Wishlist</h3>
			<h3 class="wishlist_amount" style="margin-bottom: 0;">3</h3>
		</div>

		<div class="wishlist_product">
			<img src="../image/product/mayxaysinhto/mx10.jpg" alt="">
			<div class="wishlist_product_in4">
				<a class="wishlist_product_title">Máy xay sinh tố Kangaroo
					KGBL1000X</a>
				<div class="wishlist_product_right_under">
					<i class="fa-regular fa-trash-can"></i> <span
						class="wishlist_product_price">1200000₫</span>
				</div>
			</div>
		</div>

		<div class="wishlist_product">
			<img src="../image/product/binhdun/bd11.jpg" alt="">
			<div class="wishlist_product_in4">
				<a class="wishlist_product_title">Bình đun siêu tốc Delites 1.8
					lít ST18S05</a>
				<div class="wishlist_product_right_under">
					<i class="fa-regular fa-trash-can"></i> <span
						class="wishlist_product_price">1204303₫</span>
				</div>
			</div>
		</div>
		<div class="wishlist_product">
			<img src="../image/product/bepga/bg12.jpg" alt="">
			<div class="wishlist_product_in4">
				<a class="wishlist_product_title">Bếp ga đôi Electrolux
					ETG7256GKR</a>
				<div class="wishlist_product_right_under">
					<i class="fa-regular fa-trash-can"></i> <span
						class="wishlist_product_price">2987532₫</span>
				</div>
			</div>
		</div>

		<div class="wishlist_product_footer">
			<span>Tổng cộng</span> <span class="wishlist_product_footer_total">5000000₫</span>
		</div>

		<div class="wishlist_product_detail">
			<a href="../html/wishlistDetail.jsp">XEM WISHLIST</a>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>
<script src="../js/header.js"></script>
</html>