<%@page import="model.Category"%>
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
<%@ page import="model.Brand"%>
<%@ page import="model.ProductModel"%>
<%@ page import="model.Category"%>
<%@ page import="java.util.*"%>
<%
Product product = (Product) request.getAttribute("product");
List<Brand> bs = (List) request.getAttribute("list-brand");
List<Category> cs = (List) request.getAttribute("list-category");

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
				<img src="<%=imgs.get(0)%>" id='e-img-active' alt="img1">
			</div>
			<div class="slider_images">
				<input type='hidden' name='e-img' value='<%=imgs.get(0)%>'
					class='e-inp-0'> <img class="slider_image active"
					src="<%=imgs.get(0)%>" id='e-img-0' alt="img1">
				<%
				for (int i = 1; i < imgs.size(); i++) {
				%>
				<input type='hidden' name='e-img' value='<%=imgs.get(i)%>'
					class='e-inp-<%=i%>'> <img class="slider_image"
					src="<%=imgs.get(i)%>" alt="<%="img - " + (i + 1)%>"
					id='e-img-<%=i%>'>
				<%
				}
				%>
			</div>
			<div id="e-img" class='d-flex'></div>
		</div>
		<div class="ms-4">
			<p>
				Lần cập nhật cuối:
				<%=product.getLastUpdated()%></p>
			<span> <input type="hidden" name="p-name"
				value="<%=product.getName()%>" />
				<h2 class="e-info"><%=product.getName()%></h2>
			</span>
			<div class="price">
				<span> <input type="hidden" name="p-price"
					value="<%=product.getPrice()%>" />
					<h3 class="old_price">
						Giá: <span class="e-info text-md"><%=product.getPrice()%></span>
						VND
					</h3>
				</span> <span> <input type="hidden" name="p-discount"
					value="<%=product.getDiscount()%>" />
					<h3 class="final_price">
						Giảm giá: <span class="e-info text-md"><%=product.getDiscount()%></span>
						VND
					</h3>
				</span>
			</div>
			<div id="describe" class="tabcontent active">
				<input type="hidden" name="p-description"
					value="<%=product.getDescription()%>" />
				<h2 class="title">Giới thiệu</h2>
				<p class="e-info " style="font-size: 16px;"><%=product.getDescription()%></p>
			</div>
			<div id="info" class="tabcontent w-100">
				<h2 class="title">Thông tin sản phẩm</h2>
				<hr />
				<table class="table_full w-100" id="e-table">
					<tr>
						<td class="table_title">Mã sản phẩm</td>
						<td><b><%=product.getId()%></b></td>
					</tr>
					<tr>
						<td class="table_title">Số lượng sản phẩm</td>
						<td><input type="hidden" name="p-amount"
							value="<%=product.getAmountSold()%>" /><b class="e-info"><%=product.getAmountSold()%></b></td>
					</tr>
					<tr>
						<input type="hidden" name="p-brand"
							value="<%=product.getBrand().getId()%>" />
						<td class="table_title">Thương hiệu</td>
						<td><span> <select class="e-select e-select-brand">
									<%
									for (Brand b : bs) {
									%>
									<option
										<%=b.getId() == product.getBrand().getId() ? "selected" : ""%>
										class="e-option <%=b.getId() == product.getBrand().getId() ? "d-block" : "d-none"%>"
										value="<%=b.getId()%>"><%=b.getName()%></option>
									<%
									}
									%>
							</select>
						</span></td>
					</tr>
					<tr>
						<input type="hidden" name="p-category"
							value="<%=product.getCategory().getId()%>" />
						<td class="table_title">Loại sản phẩm</td>
						<td><span> <select class="e-select e-select-category">
									<%
									for (Category c : cs) {
									%>
									<option
										<%=c.getId() == product.getCategory().getId() ? "selected" : ""%>
										class="e-option <%=c.getId() == product.getCategory().getId() ? "d-block" : "d-none"%>"
										value="<%=c.getId()%>"><%=c.getName()%></option>
									<%
									}
									%>
							</select>
						</span></td>
					</tr>
					<tr>
						<td><hr /></td>
						<td><hr /></td>
					</tr>
					<tr>
						<td></td>
						<td id="e-add" class="text-end"></td>
					</tr>
					<%
					for (int i = 0; i < product.getAttributes().size(); ++i) {
					%>
					<tr>
						<td class="table_title"><input type="hidden" name="p-at-name"
							value="<%=product.getAttributes().get(i).getName()%>" /><span
							class="e-old-empty"><span class="e-info"><%=product.getAttributes().get(i).getName()%></span>
						</span></td>
						<td><input type="hidden" name="p-at-value"
							value="<%=product.getAttributes().get(i).getValue()%>" /><span
							class="e-old-btn"><b class="e-info"><%=product.getAttributes().get(i).getValue()%></b>
						</span></td>
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
		<div class="mt-3 mb-3 w-100" id="e-function">
			<!-- "e" mean edit -->
			<button onclick="edit(<%=product.getId()%>, 'update')" name="edit"
				class="e-btn btn btn-warning w-100">Điều chỉnh sản phẩm</button>
		</div>
	</div>

	<script src="../js/detail.js"></script>
	<script src="../js/editProduct.js"></script>
</body>
</html>