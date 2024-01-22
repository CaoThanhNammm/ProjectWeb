<%@page import="model.Brand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/productAdmin.css">
<title>Các sản phẩm bị ẩn</title>
</head>
<!-- 
    Create: Nguyễn Khải Nam
    Date: 08/11/2023
    Note: Trang điều chỉnh, thêm, xóa sản phẩm 
-->
<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>
<%
List<Product> products = (List) request.getAttribute("getHiddenProduct");
if (products == null)
	products = new ArrayList<>();
%>
<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>
	<div id="product">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<span class="navbar-brand">Sản phẩm</span>
			</div>
		</nav>

		<nav class="navbar navbar-expand-sm bg-light">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="header_search">
							<form action="../html/FindProductHiddenAdmin" class="d-flex"
								method="GET">
								<input type="text"
									value="<%=request.getAttribute("nameProduct")%>" class="search"
									placeholder="Tìm đồ gia dụng" name="nameProduct">
								<button class="search_logo">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</form>
						</div>
					</li>
					<%
					String sortText = (String) request.getAttribute("sortText");
					%>

					<li class="nav-item"><select id="price_admin">
							<%
							if (sortText.equals("Tất cả")) {
							%>
							<option value="0" selected>Tất cả</option>
							<option value="1">Từ thấp đến cao</option>
							<option value="2">Từ cao đến thấp</option>
							<%
							} else if (sortText.equals("Từ thấp đến cao")) {
							%>
							<option value="1" selected>Từ thấp đến cao</option>
							<option value="2">Từ cao đến thấp</option>
							<option value="0">Tất cả</option>
							<%
							} else if (sortText.equals("Từ cao đến thấp")) {
							%>
							<option value="2" selected>Từ cao đến thấp</option>
							<option value="1">Từ thấp đến cao</option>
							<option value="0">Tất cả</option>
							<%
							}
							%>
					</select></li>

					<li class="nav-item"><select id="brands_admin">
							<option value="0" selected>Tất cả</option>
							<%
							List<Brand> brands = (List) request.getAttribute("brands");
							String nameBrand = (String) request.getAttribute("brandText");
							for (Brand brand : brands) {
								if (brand.getName().equals(nameBrand)) {
							%>
							<option value="<%=brand.getId()%>" selected><%=brand.getName()%></option>
							<%
							} else {
							%>
							<option value="<%=brand.getId()%>"><%=brand.getName()%></option>
							<%
							}
							}
							%>

					</select></li>
				</ul>

				<div></div>
			</div>
		</nav>

		<div class="mt-5 ">
			<div class="card-products ms-2 me-2">
				<div class="card-group">
					<%
					for (int i = 0; i < products.size(); ++i) {
					%>
					<div class="card" style="min-height: 550px;">
						<img class="card-img-top"
							src="<%=products.get(i).getImgsProduct().get(0)%>"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title"><%=products.get(i).getName()%></h5>
							<p class="card-text"><%=products.get(i).formatNumber(products.get(i).getPrice() - products.get(i).getDiscount())%>
								VND / đã bán:
								<%=products.get(i).getAmountSold()%>
								sản phẩm
							</p>
							<div class="d-flex">
								<button class="btn btn-secondary me-2"
									onclick="unhideP(<%=products.get(i).getId()%>)">
									<i class="fa-solid fa-eye"></i> Hiển thị
								</button>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="../js/editProductsHiddenAdmin.js"></script>
</html>