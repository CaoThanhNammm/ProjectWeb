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

		<div class="introduce_product">
			<div class="row">
				<div class="col-lg-6 introduce_product_item">
					<img src="../image/home/introduce_product1.jpg" alt=""> <a
						href="../html/product.jsp" class="introduce_product_name">Máy
						lọc nước</a>
				</div>

				<div class="col-lg-6">
					<div class="row introduce_product_left">
						<div class="col-lg-6 introduce_product_item">
							<img src="../image/home/introduce_product2.jpg" alt=""> <a
								href="/html/product.jsp" class="introduce_product_name">Nồi
								chiên</a>
						</div>

						<div class="col-lg-6 introduce_product_item">
							<img src="../image/home/introduce_product3.jpg" alt=""> <a
								href="../html/product.jsp" class="introduce_product_name">Bếp
								điện</a>
						</div>

						<div class="col-lg-6 introduce_product_item">
							<img src="../image/home/introduce_product4.jpg" alt=""> <a
								href="../html/product.jsp" class="introduce_product_name">Máy
								ép trái cây</a>
						</div>

						<div class="col-lg-6 introduce_product_item">
							<img src="../image/home/introduce_product5.jpg" alt=""> <a
								href="../html/product.jsp" class="introduce_product_name">Nồi
								cơm điện</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="product_list" id="home">
			<h2 style="margin-bottom: 20px; cursor: default;">FLASH SALE</h2>
			<div class="row mb-3">
				<c:forEach items="${getShowProductBestDiscount}" var="product">
					<div class="col-lg-3 col-sm-6 col-md-4 product">
						<i class="fa-solid fa-bag-shopping fly_to_card"></i>

						<div class="product_in4">
							<a href="../html/detail.jsp" class="product_in4_name_product">${product.name}</a>
							<div class="product_in4_bottom">
								<div>
									<span class="product_in4_price">
										<fmt:formatNumber type="number" value="${product.price}" /> ₫
									</span>
									
									<span style="font-size: 14px; padding-left: 5px"> 
										<fmt:formatNumber var="roundedNumber" value="-${(product.discount/product.price) * 100}" type="number" pattern="#" />
									${roundedNumber}%
									</span>

									<p class="product_in4_sale_price">
										<fmt:formatNumber type="number"
											value="${product.price - product.discount}"/>
										₫
									</p>
								</div>
								<div class="product_in4_wishlist no_wishlist">
									<i class="fa-solid fa-heart"></i> <span class="hint_wishlist">yêu
										thích</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="product_list" id="home">
			<h2 style="margin-bottom: 20px; cursor: default;">SẢN PHẨM GỢI Ý</h2>
			<div class="row mb-3">
				<c:forEach items="${getShowProductRecommend}" var="product">
					<div class="col-lg-3 col-sm-6 col-md-4 product">
						<i class="fa-solid fa-bag-shopping fly_to_card"></i>

						<div class="product_in4">
							<a href="../html/detail.jsp" class="product_in4_name_product">${product.name}</a>
							<div class="product_in4_bottom">
								<div>
									<span class="product_in4_price">
										<fmt:formatNumber type="number" value="${product.price}" />
										₫
									</span>
									
									<span style="font-size: 14px; padding-left: 5px"> 
										<fmt:formatNumber var="roundedNumber" value="-${(product.discount/product.price) * 100}" type="number" pattern="#" />
									${roundedNumber}%
									</span>
									
									<p class="product_in4_sale_price">
										<fmt:formatNumber type="number"
											value="${product.price - product.discount}" />
										₫
									</p>
								</div>
								<div class="product_in4_wishlist no_wishlist">
									<i class="fa-solid fa-heart"></i> <span class="hint_wishlist">yêu
										thích</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>
	<%@include file="../html/footer.jsp"%>

	<script src="../js/index.js" type="text/javascript"></script>
	<script src="../js/product.js" type="text/javascript"></script>

</body>
</html>