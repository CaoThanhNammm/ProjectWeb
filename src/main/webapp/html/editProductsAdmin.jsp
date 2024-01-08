<%@page import="model.Product"%>
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
<link rel="stylesheet" href="../css/headAdmin.css">
<link rel="stylesheet" href="../css/productAdmin.css">
<link rel="stylesheet" href="../css/index.css">
<title>Sửa sản phẩm</title>
</head>
<!-- 
    Create: Nguyễn Khải Nam
    Date: 08/11/2023
    Note: Trang điều chỉnh, thêm, xóa sản phẩm
-->
<%@ page import="java.util.*"%>

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
							<input type="text" class="search" placeholder="Tìm đồ gia dụng">
							<i class="fa-solid fa-magnifying-glass search_logo"></i>
						</div>
					</li>

					<li class="nav-item"><select>
							<option value="">Từ thấp đến cao</option>
							<option value="">Từ cao đến thấp</option>
					</select></li>

					<li class="nav-item"><select>
							<option value="">LG</option>
							<option value="">Samsung</option>
							<option value="">Kanguroo</option>
							<option value="">Xiaomi</option>
					</select></li>
				</ul>

				<div>
					<label class="btn btn-warning"><input type="file"
						accept=".xlsx, .xls">+ Tải file lên</label>
					<button class="btn btn-warning" onclick="addProduct()">+
						Thêm sản phẩm</button>
				</div>
			</div>
		</nav>

		<%
		List<Product> products = (List) request.getAttribute("getShowProductRecommend");
		out.println(products);
		%>

		<div class="mt-5 ">
			<div class="card-products ms-2 me-2">
				<div class="card-group"></div>
			</div>
		</div>
	</div>

	<script src="../js/productAdmin.js"></script>

</body>

</html>
