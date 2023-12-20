<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/cart.css">
<link rel="stylesheet" href="../css/indexRes.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Sản phẩm yêu thích</title>

</head>

<body>
	<div id="page">
		<%@include file="header.jsp"%>
		<div class="product_list_wishlist container mt-5">
			<h2 style="margin-bottom: 20px; cursor: default;">Sản phẩm yêu
				thích</h2>
			<!-- danh sách sản phẩm yêu thích -->
			<div class="row mb-3">
				<%
				List<Product> products = (List) session.getAttribute("productsWishlist");
				if (products != null) {
					for (Product p : products) {
				%>
				<div class="col-lg-3 col-sm-6 col-md-4 product">
					<i class="fa-solid fa-bag-shopping fly_to_card"></i>
					<div class="product_img">
						<img src="../image/product/mayxaysinhto/mx10.jpg" alt="">
						<div class="product_img_hover">
							<img src="../image/product/mayxaysinhto/mx5.jpg" alt="">
						</div>
					</div>
					<div class="product_in4">
						<a href="../html/detail.jsp" class="product_in4_name_product"><%=p.getName()%></a>
						<div class="product_in4_bottom">
							<div>
								<span class="product_in4_price"><%=p.formatNumber(p.getPrice())%>
									₫ </span> <span style="font-size: 5px; padding-left: 5px"> -<%=p.percentSale(p.getPrice(), p.getDiscount())%>%
								</span>

								<p class="product_in4_sale_price">
									<%=p.formatNumber(p.getPrice() - p.getDiscount())%>
									₫
								</p>
							</div>


							<button class="product_in4_wishlist wishlisted"
								id="<%=p.getId()%>">
								<i class="fa-solid fa-heart"></i>
							</button>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>
			</div>

			<!-- tiếp tục mua hàng -->
			<div class="cart_body mb-5">
				<div class="cart_body-empty">
					<h3>Hiện danh mục yêu thích của bạn đang trống</h3>
					<a class="cart_body_btn btn" href="../index/index.jsp">Quay lại
						cửa hàng</a>
				</div>
			</div>
		</div>
		<%
		List<Product> productRecommend = (List) request.getAttribute("getShowProductRecommend");
		%>
		<!-- danh sách sản phẩm đề xuất -->
		<div class="product_list container">
			<h2 style="margin-bottom: 20px; cursor: default;">SẢN PHẨM GỢI Ý</h2>
			<div class="row mb-3">
				<%
				for (Product p : productRecommend) {
				%>
				<div class="col-lg-3 col-sm-6 col-md-4 product">
					<i class="fa-solid fa-bag-shopping fly_to_card"></i>

					<div class="product_in4">
						<a href="../html/detail.jsp" class="product_in4_name_product"><%=p.getName()%></a>
						<div class="product_in4_bottom">
							<div>
								<span class="product_in4_price"><%=p.formatNumber(p.getPrice())%>
									₫ </span> <span style="font-size: 5px; padding-left: 5px"> -<%=p.percentSale(p.getPrice(), p.getDiscount())%>%
								</span>

								<p class="product_in4_sale_price">
									<%=p.formatNumber(p.getPrice() - p.getDiscount())%>
									₫
								</p>
							</div>

							<form action="../html/wishlist?id=<%=p.getId()%>" method="POST">
								<button class="product_in4_wishlist no_wishlist"
									id="<%=p.getId()%>">
									<i class="fa-solid fa-heart"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>

		<%@include file="footer.jsp"%>
	</div>

</body>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

<script src="../js/wishlist.js"></script>
<script src="../js/product.js"></script>

</html>