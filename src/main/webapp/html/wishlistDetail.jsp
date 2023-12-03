<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/cart.css">
<link rel="stylesheet" href="../css/indexRes.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/headerRes.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Sản phẩm yêu thích</title>

</head>

<body>
	<div id="page">
		<%@include file="header.jsp"%>
		<div class="product_list_wishlist container mt-5">
			<h2 style="margin-bottom: 20px; cursor: default;">Sản phẩm yêu
				thích</h2>
			<!-- danh sách sản phẩm yêu thích -->
			<div class="row mb-3">
				<div class="col-lg-3 col-sm-6 col-md-4 product">
					<i class="fa-solid fa-bag-shopping fly_to_card"></i>
					<div class="product_img">
						<img src="../image/product/mayxaysinhto/mx10.jpg" alt="">
						<div class="product_img_hover">
							<img src="../image/product/mayxaysinhto/mx5.jpg" alt="">
						</div>
					</div>
					<div class="product_in4">
						<p class="product_in4_name_product">Máy xay sinh tố Kangaroo
							KGBL1000X</p>
						<div class="product_in4_bottom">
							<div>
								<p class="product_in4_price">2200000₫</p>
								<p class="product_in4_sale_price">1200000₫</p>
							</div>
							<div class="product_in4_wishlist">
								<i class="fa-solid fa-heart alway_wishlist"></i> <span
									class="hint_wishlist">xóa yêu thích</span>
							</div>
						</div>
					</div>

					<div class="product_btn">
						<button href="" class=" product_btn-add_card_none a">Thêm
							vào giỏ</button>
						<a href="detail.jsp" class=" product_btn--product_detail_none a">xem
							thêm</a>
					</div>
				</div>

				<div class="col-lg-3 col-sm-6 col-md-4 product">
					<i class="fa-solid fa-bag-shopping fly_to_card"></i>
					<div class="product_img">
						<img src="../image/product/binhdun/bd11.jpg" alt="">
						<div class="product_img_hover">
							<img src="../image/product/binhdun/bd3.jpg" alt="">
						</div>
					</div>
					<div class="product_in4">
						<p class="product_in4_name_product">Bình đun siêu tốc Delites
							1.8 lít ST18S05</p>
						<div class="product_in4_bottom">
							<div>
								<p class="product_in4_price">1304303₫</p>
								<p class="product_in4_sale_price">1204303₫</p>
							</div>
							<div class="product_in4_wishlist">
								<i class="fa-solid fa-heart alway_wishlist"></i> <span
									class="hint_wishlist">xóa yêu thích</span>
							</div>
						</div>
					</div>

					<div class="product_btn">
						<button href="" class=" product_btn-add_card_none a">Thêm
							vào giỏ</button>
						<a href="detail.jsp" class=" product_btn--product_detail_none a">xem
							thêm</a>
					</div>
				</div>

				<div class="col-lg-3 col-sm-6 col-md-4 product">
					<i class="fa-solid fa-bag-shopping fly_to_card"></i>
					<div class="product_img">
						<img src="../image/product/bepga/bg12.jpg" alt="">
						<div class="product_img_hover">
							<img src="../image/product/bepga/bg1.jpg" alt="">
						</div>
					</div>
					<div class="product_in4">
						<p class="product_in4_name_product">Bếp ga đôi Electrolux
							ETG7256GKR</p>
						<div class="product_in4_bottom">
							<div>
								<p class="product_in4_price">3987532₫</p>
								<p class="product_in4_sale_price">2987532₫</p>
							</div>
							<div class="product_in4_wishlist">
								<i class="fa-solid fa-heart alway_wishlist"></i> <span
									class="hint_wishlist">xóa yêu thích</span>
							</div>
						</div>
					</div>

					<div class="product_btn">
						<button href="" class=" product_btn-add_card_none a">Thêm
							vào giỏ</button>
						<a href="detail.jsp" class=" product_btn--product_detail_none a">xem
							thêm</a>
					</div>
				</div>
			</div>

			<!-- tiếp tục mua hàng -->
			<div class="cart_body mb-5">
				<div class="cart_body-empty">
					<h3>Hiện danh mục yêu thích của bạn đang trống</h3>
					<a class="cart_body_btn btn" href="../../index.jsp">Quay lại
						cửa hàng</a>
				</div>
			</div>
		</div>

		<!-- danh sách sản phẩm đề xuất -->
		<div class="product_list container">
			<h2 style="margin-bottom: 20px; cursor: default;">Sản phẩm khác</h2>
			<div class="row mb-3 container"></div>
		</div>

		<!-- sang trang mới -->
		<div class="new_page">
			<div class="row">
				<div class="col-lg-12">
					<ul class="new_page_list">
						<li class="new_page_item new_page_item_previous"><a> <i
								class="fa-solid fa-angle-left"
								style="margin-right: 3px; text-align: center;"></i> Previous
						</a></li>
						<li class="new_page_item"><a>1</a></li>
						<li class="new_page_item"><a>2</a></li>
						<li class="new_page_item"><a>3</a></li>
						<li class="new_page_item"><a>4</a></li>
						<li class="new_page_item"><a>5</a></li>
						<li class="new_page_item"><a>6</a></li>
						<li class="new_page_item new_page_item_next"><a> Next <i
								class="fa-solid fa-angle-right"
								style="margin-left: 3px; text-align: center;"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

<script src="../js/wishlist.js"></script>
<script src="../js/product.js"></script>

</html>