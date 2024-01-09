<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
String title = (String) request.getAttribute("title");
%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/productAdmin.css">
<title><%=title%></title>
</head>
<%@ page import="model.Product"%>
<%@ page import="model.ProductModel"%>
<%@ page import="java.util.*"%>
<%
Product product = (Product) request.getAttribute("product");
List<String> imgs = null;
List<ProductModel> productModels = null;
if (product != null) {
	imgs = product.getImgsProduct();
	productModels = product.getModels();
}
%>
<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>
	<div id="form-product">
		<%
		if (product != null) {
		%>
		<input value="<%=product.getId()%>" type="hidden" name="id-product">
		<div class="col-5 mx-auto w-50">
			<div class="slider_main">
				<img src="<%=imgs.get(0)%>" alt="img1">
			</div>
			<div class="slider_images">
				<img class="slider_image active" src="<%=imgs.get(0)%>" alt="img1">
				<%
				for (int i = 1; i < imgs.size(); i++) {
				%>
				<img class="slider_image" src="<%=imgs.get(i)%>"
					alt="<%="img" + (i + 1)%>">
				<%
				}
				%>
			</div>
		</div>
		<div class="ms-4">
			<p>
				Lần cập nhật cuối:
				<%=product.getLastUpdated()%></p>
			<h2 class="e-info"><%=product.getName()%></h2>
			<div class="price">
				<h3 class="old_price">
					Giá: <span class="e-info text-md"><%=product.getPrice()%></span>
					VND
				</h3>
				<h3 class="final_price">
					Giảm giá: <span class="e-info text-md"><%=product.getDiscount()%></span>
					VND
				</h3>
			</div>
			<div id="describe" class="tabcontent active">
				<h2 class="title">Giới thiệu</h2>
				<p class="e-info " style="font-size: 16px;"><%=product.getDescription()%></p>
			</div>
			<div id="info" class="tabcontent w-100">
				<h2 class="title">Thông tin sản phẩm</h2>
				<table class="table_full w-100">
					<tr>
						<td class="table_title">Mã sản phẩm</td>
						<td><b class="e-info"><%=product.getId()%></b></td>
					</tr>
					<tr>
						<td class="table_title">Thương hiệu</td>
						<td><b class="e-info"><%=product.getBrand().getName()%></b></td>
					</tr>
					<tr>
						<td class="table_title">Màu</td>
						<td><b class="e-info">Trắng</b></td>
					</tr>
					<%
					for (int i = 0; i < product.getAttributes().size(); ++i) {
					%>
					<tr>
						<td class="table_title"><%=product.getAttributes().get(i).getName()%></td>
						<td><b class="e-info"><%=product.getAttributes().get(i).getValue()%></b></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
		<%
		}
		%>
		<div class="mt-3 mb-3 w-100">
			<!-- e mean edit -->
			<button onclick="edit()" name="edit"
				class="e-btn btn btn-warning w-100">Điều chỉnh sản phẩm</button>
		</div>
	</div>

	<script src="../js/detail.js"></script>
	<script src="../js/editProduct.js"></script>
</body>
</html>