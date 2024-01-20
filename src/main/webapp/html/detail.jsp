<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/product.css">

<link rel="stylesheet" href="../css/detail.css">
<link rel="stylesheet" href="../css/tab.css">
<link rel="stylesheet" href="../css/indexRes.css">
<title>Chi tiết</title>
</head>
<%@ page import="model.ProductModel" %>
<%@ page import="model.Attribute" %>
<% 
	Product product = (Product) request.getAttribute("product");
	List<ProductModel> models = product.getModels();
	List<Attribute> attributes = product.getAttributes();
	int productID = product.getId();
	String productName = product.getName();
	int brandID = product.getBrand().getId();
	String brandName = product.getBrand().getName();
	String originalPrice = product.formatNumber(product.getPrice());
	String discountPrice = product.formatNumber(product.getPrice() - product.getDiscount());
	String description = product.getDescription();
	List<String> imgs = (List<String>) request.getAttribute("images");
	boolean available = (boolean) request.getAttribute("available");
%>
<body>
	<div id="page">

		<%@include file="header.jsp"%>
		<!-- 
            Tạo bởi: Trần Minh Quân
            Ngày: 24-10-2023
            Chức năng: Chức năng detail
         -->
		<div class="detail container">
			<div class="row detail_part">
				<div class="col-5">
					<div class="slider_main">
						<img src="../image/product/<%=productID%>/<%=imgs.get(0)%>" alt="img1">
					</div>
					<div class="slider_images">
						<img class="slider_image active" src="../image/product/<%=productID%>/<%=imgs.get(0)%>">
						<%for(int i = 1; i < imgs.size(); i++) { %>
							<img class="slider_image" src="../image/product/<%=productID%>/<%=imgs.get(i)%>">
						<%} %>
					</div>
				</div>
				<div class="col-7">
					<h2><%=productName%></h2>
					<a href="../html/FindProduct?nameProduct= &currentPage=1&order=null&brands=<%=brandID%>" class="brand">Thương hiệu: <%=brandName %></a>
					<div class="rate">
						<p class="starrate">5.0</p>
						<img class="star" src="../image/detail/star.png" alt="star">
						<img class="star" src="../image/detail/star.png" alt="star">
						<img class="star" src="../image/detail/star.png" alt="star">
						<img class="star" src="../image/detail/star.png" alt="star">
						<img class="star" src="../image/detail/star.png" alt="star">
					</div>
					<div class="line"></div>
					<div class="price">
						<h3 class="final_price"><%=discountPrice%>đ</h3>
						<h3 class="old_price"><%=originalPrice%>đ</h3>
					</div>
					<table class="quickview">
						<%for(int i = 0; i < Math.min(4, attributes.size()); i++){ %>
						<tr>
							<td class="quickview_title"><%=attributes.get(i).getName() %></td>
							<td><%=attributes.get(i).getValue() %></td>
						</tr>
						<%}%>
					</table>
					<div class="choices">
						<button class="choice actived" id="<%=models.get(0).getId()%>"><%=models.get(0).getOptionValue()%></button>
					 	<%for(int i = 1; i < models.size(); i++){ %>
					 		<button class="choice" id="<%=models.get(i).getId()%>"><%=models.get(i).getOptionValue()%></button>
					 	<%}%>
					</div>
					<div class="checkout">
						<% if(available){ %>
						<form action="<%=models.get(0).getId()%>" style="display: inline;">
							<button class="buy_button">Mua ngay!</button>
						</form>
						<form method="POST" action="cart?method=add&id=<%=models.get(0).getId()%>" style="display: inline;">
							<button class="addcart_button">Thêm vào giỏ</button>
						</form>
						<%} else{%>
						<h2 style="color: red;">Sản phẩm hiện chưa khả dụng</h2>
						<%} %>
					</div>
				</div>
			</div>
			<div class="row detail_part" style="margin-top: 30px;">
				<div class="tab">
					<button class="tablinks active"
						onclick="_switchTab(event, 'describe')">Giới thiệu</button>
					<button class="tablinks" onclick="_switchTab(event, 'info')">Thông
						tin sản phẩm</button>
					<button class="tablinks" onclick="_switchTab(event, 'rates')">Đánh
						giá</button>
				</div>
				<div id="describe" class="tabcontent active">
					<h2 class="title">Giới thiệu</h2>
					<p style="white-space: pre-line; font-size: 16px;"><%=description %></p>
				</div>
				<div id="info" class="tabcontent">
					<h2 class="title">Thông tin sản phẩm</h2>
					<table class="table_full">
						<%for(Attribute a : attributes){ %>
						<tr>
							<td class="table_title"><%=a.getName() %></td>
							<td><%=a.getValue()%></td>
						</tr>
						<%}%>
					</table>
				</div>
				<div id="rates" class="tabcontent">
					<div class="row">
						<div class="col-6">
							<div class="user_review">
								<div class="user_info">
									<h4 class="name">Trần Minh Quân</h4>
									<small class="date">Ngày: 30/10/2023</small>
								</div>
								<div class="rate">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
								</div>
								<div class="review">
									<p>Good</p>
								</div>
							</div>
							<div class="user_review">
								<div class="user_info">
									<h4 class="name">Cao Thành Nam</h4>
									<small class="date">Ngày: 29/10/2023</small>
								</div>
								<div class="rate">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
									<img class="star" src="../image/detail/star.png" alt="star">
								</div>
								<div class="review">
									<p>Gạo nấu ghè tan, cực ngây, êm.</p>
								</div>
							</div>
							<div class="user_review">
								<div class="user_info">
									<h4 class="name">Nguyễn Khải Nam</h4>
									<small class="date">Ngày: 28/10/2023</small>
								</div>
								<div class="rate">
									<img class="star" src="../image/detail/star.png" alt="star">
								</div>
								<div class="review">
									<p>1 sao cho giống cờ Việt Nam.</p>
								</div>
							</div>
						</div>
						<div class="col-6">
							<h2 class="title">Để lại đánh giá</h2>
							<br>
							<p style="color: gray; text-align: center;">Hãy đăng nhập để
								gửi đánh giá</p>
						</div>
					</div>
				</div>
			</div>

			<%@include file="../html/productSuggestion.jsp"%>
		</div>

		<%@include file="footer.jsp"%>
	</div>

	<script src="../js/detail.js"></script>
	<script src="../js/index.js"></script>
	<script src="../js/tab.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous">
		
	</script>

</body>

</html>