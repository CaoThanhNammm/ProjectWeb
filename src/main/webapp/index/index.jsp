<%@page import="java.util.Map"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="../image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/indexRes.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../font/Roboto/Roboto-Medium.ttf">
<title>Home</title>
</head>

<body>
	<%@include file="../html/header.jsp"%>
	<!-- 

         Create: Cao Thành Nam
         Date: 18/10/2023
         Note: phần body của trang
    -->
	<%@include file="../html/sliderShow.jsp"%>

	<div class="content container">
		<div class="content_event_product">
			<a href="../../html/product.jsp" class="product_event"> <img
				src="../image/home/img_event_1.png" alt="">
				<p>Cao Cấp Bao giá freeship</p>
			</a> <a href="../html/product.jsp" class="product_event"> <img
				src="../image/home/img_event_2.png" alt="">
				<p>Bếp ga trưng bày giảm đến 30%</p>
			</a> <a href="../html/product.jsp" class="product_event"> <img
				src="../image/home/img_event_3.png" alt="">
				<p>Máy xay sinh tố 1x.xxx</p>
			</a> <a href="../html/product.jsp" class="product_event"> <img
				src="../image/home/img_event_4.png" alt="">
				<p>Bếp điện đôi từ 1.xxx</p>
			</a>
		</div>

		<%
		Map<Category, String> categoryBanner = (Map<Category, String>) request.getAttribute("elementProductBanner");
		Map<Category, String> categoryBannerFirst = (Map<Category, String>) request.getAttribute("elementProductBannerFirst");
		%>

		<div class="introduce_product">
			<div class="row">
				<%
				for (Map.Entry<Category, String> entry : categoryBannerFirst.entrySet()) {
				%>
				<div class="col-lg-6 introduce_product_item">
					<img src="<%=entry.getValue()%>" alt="">
					<form
						action="../html/FindProduct?nameProduct=<%=entry.getKey().getName()%>&currentPage=1"
						method="POST">

						<button class="introduce_product_name"><%=entry.getKey().getName()%></button>
					</form>
				</div>

				<%
				break;
				}
				%>

				<div class="col-lg-6">
					<div class="row introduce_product_left">
						<%
						for (Map.Entry<Category, String> entry : categoryBanner.entrySet()) {
						%>
						<div class="col-lg-6 introduce_product_item">
							<img src="<%=entry.getValue()%>" alt="">
							<form
								action="../html/FindProduct?nameProduct=<%=entry.getKey().getName()%>&currentPage=1"
								method="POST">
								<button class="introduce_product_name"><%=entry.getKey().getName()%></button>
							</form>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>

		<%
		List<Product> productBestDiscount = (List) request.getAttribute("getShowProductBestDiscount");
		%>
		<div class="product_list" id="home">
			<h2 style="margin-bottom: 20px; cursor: default;">FLASH SALE</h2>
			<div class="row mb-3">
				<%
				for (Product p : productBestDiscount) {
				%>
				<div class="col-lg-3 col-sm-6 col-md-4 product">
					<div class="product_img">
						<img src="<%=p.getImgsProduct().get(0)%>" alt="">

						<div class="product_img_hover">
							<img src="<%=p.getImgsProduct().get(1)%>" alt="">
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

		<%@include file="../html/productSuggestion.jsp"%>
	</div>
	<%@include file="../html/footer.jsp"%>

	<script src="../js/index.js" type="text/javascript"></script>
	<script src="../js/product.js" type="text/javascript"></script>

</body>
</html>