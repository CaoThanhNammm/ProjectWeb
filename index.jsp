<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="src/main/webapp/image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="src/main/webapp/css/index.css">
<link rel="stylesheet" href="src/main/webapp/css/product.css">
<link rel="stylesheet" href="src/main/webapp/css/indexRes.css">
<link rel="stylesheet" href="src/main/webapp/font/Roboto/Roboto-Medium.ttf">
<title>Home</title>
</head>

<body>
	<%@include file="src/main/webapp/html/header.jsp"%>
	<!-- 
            Create: Cao Thành Nam
            Date: 18/10/2023
            Note: phần body của trang
        -->
	<div class="slider container">
		<div class="slider_img_list">
			<img class="slider_img_item" src="src/main/webapp/image/home/trian2011.jpg" alt="">
			<img class="slider_img_item" src="src/main/webapp/image/home/content_introduce1.png"
				alt=""> <img class="slider_img_item"
							 src="src/main/webapp/image/home/content_introduce.jpg" alt=""> <img
				class="slider_img_item" src="src/main/webapp/image/home/lọakeokeo.jpg" alt="">
		</div>

		<div class="slider_dot_list">
			<div class="slider_dot_item background_dot_slider-active"></div>
			<div class="slider_dot_item"></div>
			<div class="slider_dot_item"></div>
			<div class="slider_dot_item"></div>
		</div>

		<i class="fa-solid fa-angle-left left"></i> <i
			class="fa-solid fa-angle-right right"></i>
	</div>

	<div class="content container">
		<div class="content_event_product">
			<a href="src/main/webapp/html/product.jsp" class="product_event"> <img
					src="src/main/webapp/image/home/img_event_1.png" alt="">
				<p>Cao Cấp Bao giá freeship</p>
			</a> <a href="src/main/webapp/html/product.jsp" class="product_event"> <img
				src="src/main/webapp/image/home/img_event_2.png" alt="">
				<p>Bếp ga trưng bày giảm đến 30%</p>
			</a> <a href="src/main/webapp/html/product.jsp" class="product_event"> <img
				src="src/main/webapp/image/home/img_event_3.png" alt="">
				<p>Máy xay sinh tố 1x.xxx</p>
			</a> <a href="src/main/webapp/html/product.jsp" class="product_event"> <img
				src="src/main/webapp/image/home/img_event_4.png" alt="">
				<p>Bếp điện đôi từ 1.xxx</p>
			</a>
		</div>

		<div class="introduce_product">
			<div class="row">
				<div class="col-lg-6 introduce_product_item">
					<img src="src/main/webapp/image/home/introduce_product1.jpg" alt=""> <a
						href="src/main/webapp/html/product.jsp" class="introduce_product_name">Máy
						lọc nước</a>
				</div>

				<div class="col-lg-6">
					<div class="row introduce_product_left">
						<div class="col-lg-6 introduce_product_item">
							<img src="src/main/webapp/image/home/introduce_product2.jpg" alt=""> <a
								href="src/main/webapp/html/product.jsp" class="introduce_product_name">Nồi
								chiên</a>
						</div>

						<div class="col-lg-6 introduce_product_item">
							<img src="src/main/webapp/image/home/introduce_product3.jpg" alt=""> <a
								href="src/main/webapp/html/product.jsp" class="introduce_product_name">Bếp
								điện</a>
						</div>

						<div class="col-lg-6 introduce_product_item">
							<img src="src/main/webapp/image/home/introduce_product4.jpg" alt=""> <a
								href="src/main/webapp/html/product.jsp" class="introduce_product_name">Máy
								ép trái cây</a>
						</div>

						<div class="col-lg-6 introduce_product_item">
							<img src="src/main/webapp/image/home/introduce_product5.jpg" alt=""> <a
								href="src/main/webapp/html/product.jsp" class="introduce_product_name">Nồi
								cơm điện</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="product_list" id="home">
			<h2 style="margin-bottom: 20px; cursor: default;">Sản phẩm nổi
				bật</h2>
			<div class="row mb-3"></div>
		</div>
	</div>

	<%@include file="src/main/webapp/html/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous" type="text/javascript">
		
	</script>

	<script src="src/main/webapp/js/index.js" type="text/javascript"></script>
	<script src="src/main/webapp/js/product.js" type="text/javascript"></script>

</body>
</html>