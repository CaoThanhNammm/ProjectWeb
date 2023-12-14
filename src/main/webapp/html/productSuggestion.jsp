<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Product Suggestion</title>
</head>
<body>
	<%
	List<Product> productRecommend = (List) request.getAttribute("getShowProductRecommend");
	%>
	<div class="product_list" id="home">
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
</body>
<script src="../js/product.js" type="text/javascript"></script>
</html>