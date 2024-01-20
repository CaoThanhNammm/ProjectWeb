<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriesDAO"%>
<%@page import="database.JDBIConnectionPool"%>
<%@page import="org.jdbi.v3.core.Handle"%>
<%@page import="model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
	<div class="modal_overlay_search_opacity"></div>
	<div class="header">
		<a href="../index/index.jsp" class="logo_page"><img
			src="../image/general/logo.png" alt=""></a>
		<!-- phần tìm kiếm sản phẩm của header -->
		<div class="header_search">
			<input type="text" name="nameProduct" class="search"
				placeholder="Tìm đồ gia dụng">
			<button class="search_logo">
				<i class="fa-solid fa-magnifying-glass searchIcon"
					style="font-size: 20px;"></i>
			</button>

			<!-- phần hiên thị ra danh sách sản phẩm đang tìm kiếm -->
			<div class="tab_suggestion_products"></div>
		</div>


		<!-- phần đăng nhập hoặc đăng ký của header -->
		<div class="header_login_signin">
			<%
			if (ac == null) {
			%>
			<a href='../html/login.jsp' class='log_in'>Đăng nhập</a>
			<div class='line'></div>
			<a href='../html/register.jsp' class='sign_in'>Đăng ký</a>
			<%
			} else {
			%>
			<a href='../html/infoUser' class='log_in'> Xin chào, <%=ac.getFullName()%></a>
			<a href='../html/access'><i
				class="fa-solid fa-right-from-bracket"></i></a>
			<%
			}
			%>
		</div>

		<div class="list_wishList">
			<%
			int quantityWishlist = 0;
			if (session.getAttribute("quantityWishlist") != null) {
				quantityWishlist = (int) session.getAttribute("quantityWishlist");
			}
			%>
			<i class="fa-regular fa-heart"></i> <span class="amount_wishlist"><%=quantityWishlist%></span>

		</div>

		<div class="header_login_signin_mobile">
			<a href="login.jsp"><img src="../image/home/user.png" alt=""></a>
		</div>

		<!-- phần giỏ hàng của header -->
		<div class="header_cart">
			<div class="header_cart_info">
				<a href="../html/cart.jsp"> <img src="../image/home/cart.png"
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
			<c:forEach items="${categoriesInNavigation}" var="c">
				<li class="navigtion-item">
					<form
						action="../html/FindProduct?nameProduct=${c.name}&currentPage=1"
						method="POST">
						<button>${c.name}</button>
					</form>
				</li>
			</c:forEach>
		</ul>

		<div class="list_wishList--mobile">
			<i class="fa-regular fa-heart"></i> <span class="amount_wishlist"><%=quantityWishlist%></span>
		</div>
	</div>

	<div class="modal_overlay"></div>
	<div class="modal_body">
		<i class="fa-solid fa-xmark modal_body_quit"></i>
		<ul class="category_all_list">
			<c:forEach items="${categoriesMore}" var="c">
				<li class="category_all_item">
					<form
						action="../html/FindProduct?nameProduct=${c.name}&currentPage=1"
						method="POST">
						<button>${c.name}</button>
					</form>
				</li>
			</c:forEach>
		</ul>
	</div>

	<div class="modal_body_wishList">
		<div class="wishlist_header">
			<i class="fa-solid fa-xmark modal_body_quit_wishlist"></i>
			<h3 class="wishlist_title"
				style="margin-bottom: 0; margin-left: 12px;">Wishlist</h3>
			<h3 class="wishlist_amount" style="margin-bottom: 0;"><%=quantityWishlist%></h3>
		</div>

		<%
		List<Product> productsWishlist = (List) session.getAttribute("productsWishlist");
		if (productsWishlist != null) {
			for (Product p : productsWishlist) {
		%>

		<div class="wishlist_product">
			<img src="<%=p.getImgsProduct().get(0)%>" alt="">
			<div class="wishlist_product_in4">
				<a class="wishlist_product_title"><%=p.getName()%></a>
				<div class="wishlist_product_right_under">
					<button class="modal_wishlist_trash remove_one" id="<%=p.getId()%>">
						<i class="fa-regular fa-trash-can"></i>
					</button>
					<div class="wishlist_product_sale">
						<div>
							<span class="wishlist_product_price" style="width: 100px"><%=p.formatNumber(p.getPrice())%>
								₫</span> <span style="margin-left: 10%; font-size: 13px;">-<%=p.percentSale(p.getPrice(), p.getDiscount())%>%
							</span>

						</div>
						<span class="wishlist_product_discount"><%=p.formatNumber(p.getPrice() - p.getDiscount())%>
							₫</span>
					</div>
				</div>
			</div>
		</div>

		<%
		}
		}
		%>

		<div class="modal_wishlist_footer">

			<div class="wishlist_product_footer">
				<%
				String totalPrice = "0";
				if (session.getAttribute("totalPrice") != null) {
					totalPrice = (String) session.getAttribute("totalPrice");
				}
				%>

				<span>Tổng cộng</span> <span class="wishlist_product_footer_total"><%=totalPrice%>
					₫</span>
			</div>

			<div class="modal_wishlist_trash_all">
				<button class="modal_wishlist_trash_all_btn">Xóa tất cả</button>
			</div>


			<div class="wishlist_product_detail">
				<a href="../html/wishlistDetail.jsp">XEM WISHLIST</a>
			</div>
		</div>
	</div>

	<div class="modal_confirm_before_delete_overlay">
		<div class="modal_confirm_before_delete">
			<div class="confirm_before_detele_top">
				<i class="fa-solid fa-triangle-exclamation"></i>
				<h5 style="margin: 0" class="text_remove_all">
					Có
					<%=quantityWishlist%>
					sản phẩm yêu thích. Chắc chắn xóa?
				</h5>

				<h5 style="margin: 0" class="text_remove_one">Chắc chắn xóa sản
					phẩm này?</h5>
			</div>

			<div class="confirm_before_detele_bottom">
				<button
					class="confirm_before_delete_btn confirm_before_delete_btn-success">Có</button>

				<button
					class="confirm_before_delete_btn confirm_before_delete_btn-fail">Không</button>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>
<script src="../js/header.js"></script>

</html>