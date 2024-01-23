<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/cart.css">
<link rel="stylesheet" href="../css/indexRes.css">
<title>Giỏ hàng</title>
</head>
<body>
	<div id="page">
		<%@include file="header.jsp"%>

		<!-- 
            Create: Nguyễn Khải Nam
            Date: 23/10/2023
            Note: Trang giỏ hàng
         -->
		<div id="cart" class="container mt-5">
			<div class="cart_body container mt-5">
				<!-- Nếu không có sản phẩm -->
				<div >
					<h3>Thanh toán thành công, hãy kiểm tra lịch sử đặt hàng nhé</h3>
					<a class="cart_body_btn btn" href="infoUser">Xem lịch sử đặt hàng</a>
				</div>
			</div>
			<%@include file="../html/productSuggestion.jsp"%>
		</div>
		<%@include file="footer.jsp"%>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous">
		
	</script>

	<script src="../js/index.js"></script>
	<!-- Tạo bởi: Nguyễn Khải Nam
    Ngày: 20/10/2023
    Tác dụng: Xử lý cho phần sản phẩm -->
</body>

</html>