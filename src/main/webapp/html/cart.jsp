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
	<%@include file="header.jsp"%>
	<div id="page">

		<!-- 
            Create: Nguyễn Khải Nam
            Date: 23/10/2023
            Note: Trang giỏ hàng
         -->
		<div id="cart" class="container mt-5">
			<div class="cart_head">
				<h1>Giỏ hàng</h1>
				<span class="cart_head_count">0</span>
			</div>

			<div class="cart_body container mt-5">
				<!-- Nếu không có sản phẩm -->
				<div class="cart_body-empty">
					<h3>Hiện giỏ hàng của bạn đang trống</h3>
					<a class="cart_body_btn btn" href="../index/index.jsp">Quay lại
						cửa hàng</a>
				</div>

				<!-- Nếu có sản phẩm -->
				<div class="cart_body-item row">
					<div class="row text-start mb-2">
						<span class="card_abate"> <span
							class="card_abate-empty  card_abate-all"
							onclick="_checkAbate(this, '.card_abate-check')"></span> Thanh
							toán toàn bộ
						</span>
					</div>

					<div class="cart_body_list col-lg-8">
						<div class="card">
							<img class="card-img-top" src="../image/product/bepga/bg7.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Bếp ga đôi Sakura SA-2181EB</h5>
								<p class="card-text">Chúng tôi có một chiếc ghế bếp với công
									dụng tuyệt vời có thể giúp bạn lấy lại sức khi mệt, ngoài ra
									ghế đá của chúng tôi có sức tải lên tới 200kg.</p>
								<div class="mt-5">
									<span>Trị giá: 1.200.000.000 VND / 1 sản phẩm</span>
								</div>
								<div class="card-body_footer">
									<div>
										<span class="card_abate"> <span
											class="card_abate-empty"
											onclick="_checkAbate(this, '.card_abate-check')"></span>
											Thanh toán
										</span>
										<button class="btn btn-warning"
											onclick="_removeItem('.cart_body_list', this, '.card')">Loại
											bỏ</button>
									</div>
									<span class="card_amount">
										<button class="card_amount-minus"
											onclick="_quantityAdjust(this, '.card_amount_input', '-')">
											<i class="fa-solid fa-minus"></i>
										</button> <input class="card_amount_input" type="number" min="1"
										max="999" step="1" value="1" readonly>
										<button class="card_amount-plus"
											onclick="_quantityAdjust(this, '.card_amount_input', '+')">
											<i class="fa-solid fa-plus"></i>
										</button>
									</span>
								</div>
							</div>
						</div>

						<div class="card">
							<img class="card-img-top" src="../image/product/bepga/bg16.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Bếp ga đôi Sakura SA-695SG</h5>
								<p class="card-text">Chúng tôi có một chiếc ghế bếp với công
									dụng tuyệt vời có thể giúp bạn lấy lại sức khi mệt, ngoài ra
									ghế đá của chúng tôi có sức tải lên tới 200kg.</p>
								<div class="mt-5">
									<span>Trị giá: 1.200.000.000 VND / 1 sản phẩm</span>
								</div>
								<div class="card-body_footer">
									<div>
										<span class="card_abate"> <span
											class="card_abate-empty"
											onclick="_checkAbate(this, '.card_abate-check')"></span>
											Thanh toán
										</span>
										<button class="btn btn-warning"
											onclick="_removeItem('.cart_body_list', this, '.card')">Loại
											bỏ</button>
									</div>
									<span class="card_amount">
										<button class="card_amount-minus"
											onclick="_quantityAdjust(this, '.card_amount_input', '-')">
											<i class="fa-solid fa-minus"></i>
										</button> <input class="card_amount_input" type="number" min="1"
										max="999" step="1" value="1" readonly>
										<button class="card_amount-plus"
											onclick="_quantityAdjust(this, '.card_amount_input', '+')">
											<i class="fa-solid fa-plus"></i>
										</button>
									</span>
								</div>
							</div>
						</div>

						<div class="mb-5">
							<div class="cart_body_bill_group">
								<a
									class="button cart_body_bill_group_btn cart_body_bill_group_btn-back"
									href="../index/index.jsp">Tiếp tục mua hàng</a> <a
									class="button cart_body_bill_group_btn"
									href="../html/checkout.jsp">Thanh toán</a>
							</div>
						</div>
					</div>

					<div class="cart_body_bill col-lg-4">
						<h2 class="mt-3 text-start">Tóm tắt đơn hàng</h2>
						<div class="cart_body_bill_group">
							<h6>Thành tiền</h6>
							<h6>1.200.000.000</h6>
						</div>
						<div class="cart_body_bill_group cart_body_bill-line">
							<h6>Vận chuyển</h6>
							<h6>Giao hàng cấp tốc</h6>
						</div>
						<div class="cart_body_bill_group mb-3">
							<input class="cart_body_bill_group_input" type="text"
								placeholder="Mã giảm giá">
							<button class="button cart_body_bill_group_btn"
								style="border: none !important;">Sử dụng</button>
						</div>
						<div class="cart_body_bill_group">
							<h6>Số tiền giảm</h6>
							<h6>0</h6>
						</div>
						<div class="cart_body_bill_group cart_body_bill-line">
							<h6>Tổng cộng</h6>
							<h6>1.200.000.000</h6>
						</div>
						<div class="cart_body_bill_group flex-column">
							<h6 class="text-start">Thông tin giao hàng</h6>
							<p class="text-start">Đối với những sản phẩm có sẵn tại khu
								vực, N2Q sẽ giao hàng trong vòng 2-7 ngày. Đối với những sản
								phẩm không có sẵn, thời gian giao hàng sẽ được nhân viên N2Q
								thông báo đến quý khách.</p>
						</div>
						<div class="cart_body_bill_group">
							<a
								class="button cart_body_bill_group_btn cart_body_bill_group_btn-back"
								href="../../../../index.jsp">Tiếp tục mua hàng</a> <a
								class="button cart_body_bill_group_btn"
								href="../html/checkout.jsp">Thanh toán</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Các sản phẩm khác -->
			<div class="product_list mt-5">
				<h2 style="margin-bottom: 20px; cursor: default;">Các sản phẩm
					khác</h2>
				<div class="row mb-3"></div>
			</div>
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
	<script src="../js/cart.js"></script>
	<script src="../js/product.js"></script>
</body>

</html>