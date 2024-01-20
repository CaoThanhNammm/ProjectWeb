<%@page import="java.util.Arrays"%>
<%@page import="model.Brand"%>
<%@page import="controller.FindProductBackup"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/indexRes.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Sản phẩm</title>
</head>

<!-- 
    Create: Cao Thành Nam
    Note: Trang product 
 -->
<%
List<Product> products = (List) request.getAttribute("products");
%>
<body>
	<div id="page">
		<%@include file="header.jsp"%>

		<%@include file="../html/sliderShow.jsp"%>

		<div class="modal_overlay_filter_opacity"></div>

		<!-- phần lọc -->
		<div class="category_product container">
			<div class="category_price">
				<span>Giá</span>

				<div class="category_price_option">
					<ul class="category_price_option_list category_option_list">
						<li class="category_price_option_item category_option_item">
							<p class="category_price_option_default"><%=request.getAttribute("priceSortText")%></p>
							<i class="fa-solid fa-chevron-down category_all_item_icon"></i>
							<ul>
								<li>
									<form
										action="../html/FilterProduct?nameProduct=<%=request.getAttribute("nameProduct")%>&currentPage=1&order=1"
										method="POST">
										<button class="filter_price_asc_btn">Từ thấp đến cao</button>
									</form>
								</li>

								<li>
									<form
										action="../html/FilterProduct?nameProduct=<%=request.getAttribute("nameProduct")%>&currentPage=1&order=0"
										method="POST">
										<button class="filter_price_desc_btn">Từ cao đến thấp</button>
									</form>
								</li>

								<li>
									<form
										action="../html/FilterProduct?nameProduct=<%=request.getAttribute("nameProduct")%>&currentPage=1&order=2"
										method="POST">
										<div class="price_input">
											<div class="price_input_left">
												<input type="number" class="price_input_left-min"
													value="<%=request.getAttribute("minPriceCurrent")%>"
													name="range_min">
											</div>

											<div class="price_input_right">
												<input type="number" class="price_input_right-max"
													value="<%=request.getAttribute("maxPriceCurrent")%>"
													name="range_max">
											</div>
										</div>

										<div style="padding: 0 10%">
											<div class="slider_price">
												<div class="slider_price_progress"></div>
											</div>
											<div class="range_input">
												<input type="range" class="range_min"
													min="<%=request.getAttribute("minPrice")%>"
													max="<%=request.getAttribute("maxPrice")%>"
													value="<%=request.getAttribute("minPriceCurrent")%>">
												<input type="range" class="range_max"
													min="<%=request.getAttribute("minPrice")%>"
													max="<%=request.getAttribute("maxPrice")%>"
													value="<%=request.getAttribute("maxPriceCurrent")%>">
											</div>
										</div>

										<div style="display: flex; justify-content: end">
											<button class="filter_range_btn">Lọc</button>
										</div>
									</form>
								</li>


							</ul>
						</li>
					</ul>
				</div>
			</div>


			<div class="category_brand">
				<span>Thương hiệu</span>

				<div class="category_price_option">
					<ul class="category_brand_option_list category_option_list">
						<li class="category_brand_option_item category_option_item">
							<p class="category_brand_option_default"><%=request.getAttribute("brandSortText")%></p>
							<i class="fa-solid fa-chevron-down category_all_item_icon"></i>

							<ul>
								<%
								List<Brand> brands = (List) request.getAttribute("brands");
								for (Brand brand : brands) {
								%>
								<li id="<%=brand.getName()%>">
									<form
										action="../html/FilterProduct?nameProduct=<%=request.getAttribute("nameProduct")%>&currentPage=1&brand=<%=brand.getId()%>"
										method="POST">
										<button>
											<img class="category_brand_option_item_img"
												src="<%=brand.getImgbrand()%>" id="<%=brand.getName()%>">
										</button>
									</form>
								</li>
								<%
								}
								%>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- danh sách các sản phẩm -->
		<div class="product_list container">
			<h2 style="margin-bottom: 20px; cursor: default;">Sản phẩm nổi
				bật</h2>

			<div class="row">
				<%
				for (Product p : products) {
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
								<span class="product_in4_price"><%=p.formatNumber(p.getPrice())%>₫
								</span> <span style="font-size: 5px; padding-left: 5px">-<%=p.percentSale(p.getPrice(), p.getDiscount())%>%
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


		<div class="new_page">
			<div class="row">
				<div class="col-lg-12">
					<%
					String notify = (String) request.getAttribute("notify");
					if (notify != null)
						out.println(request.getAttribute("notify"));
					%>

					<ul class="new_page_list">
						<%
						int currentPage = (int) request.getAttribute("currentPage");
						List<Integer> listPage = (List) request.getAttribute("createPages");
						for (Integer num : listPage) {
							if (num == currentPage) {
						%>
						<li class="new_page_item"><a class="choose_page_item"
							href="<%=request.getAttribute("uri")%>?nameProduct=<%=request.getAttribute("nameProduct")%>&currentPage=<%=num%>"><%=num%></a>
						</li>

						<%
						} else {
						%>
						<li class="new_page_item"><a
							href="<%=request.getAttribute("uri")%>?nameProduct=<%=request.getAttribute("nameProduct")%>&currentPage=<%=num%>"><%=num%></a>
						</li>
						<%
						}
						}
						%>
					</ul>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>

<script src="../js/product.js"></script>
<script src="../js/index.js"></script>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

</html>