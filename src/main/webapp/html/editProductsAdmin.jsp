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
					<button class="btn btn-warning" onclick="addProduct()">+
						Thêm sản phẩm</button>
				</div>
			</div>
		</nav>

		<div class="row mt-5 ">
			<div class="card-products col ms-2 me-2">
				<div class="card-deck">
					<div class="card">
						<div class="card_img_top col-5">
							<div class="slider_main">
								<img src="../image/detail/img1.jpg" alt="img1">
							</div>
							<div class="slider_images">
								<img class="slider_image active" src="../image/detail/img1.jpg"
									alt="img1"> <img class="slider_image"
									src="../image/detail/img2.jpg" alt="img2"> <img
									class="slider_image" src="../image/detail/img3.jpg" alt="img3">
								<img class="slider_image" src="../image/detail/img4.jpg"
									alt="img4"> <img class="slider_image"
									src="../image/detail/img5.jpg" alt="img5"> <img
									class="slider_image" src="../image/detail/img6.jpg" alt="img6">
							</div>
						</div>
						<div class="card-body col-7">
							<h5 class="card-title">Nồi điện đa năng, nồi lẩu mini đa
								năng kèm khay hấp, chất liệu chống dính, dung tích 1,8L tốc độ
								sôi cực nhanh</h5>
							<p class="card-text">- BỀ MẶT NẤU DUAL: Nồi điện mới của
								chúng tôi vừa là NƯỚNG vừa là Lẩu, giúp nấu nướng linh hoạt hơn
								mà ít tốn công sức hơn - để chuẩn bị những bữa ăn ngon. - ĐA
								CHỨC NĂNG: Bạn có thể điều chỉnh nhiệt độ từ 300° đến 450° F,
								giúp bạn thoải mái chế biến các món súp thịnh soạn, nướng thịt
								và rau - và nhiều hơn thế nữa. - NẤU CHE: Nắp kính cường lực
								ngăn ngừa bắn tung tóe khi nướng và nấu. Nó có thể ngăn ngừa sự
								lộn xộn trong nhà bếp và vết bẩn trên quần áo của bạn. - RỘNG
								RÃI & DI ĐỘNG: Nồi nấu bằng thép không gỉ cực lớn của chúng tôi
								có dung tích 2,5 lít và đảm bảo phân phối nhiệt đều và dễ dàng
								làm sạch – đó là máy rửa chén an toàn. - PHỤ KIỆN: Nồi này đi
								kèm đế nhiệt có thể điều chỉnh, nồi nấu bằng thép không gỉ, chảo
								nướng chống dính và nắp thủy tinh - cho những bữa ăn hoàn hảo
								mọi lúc.</p>
							<p>
								Trị giá: <span class="card-text">1.200.000.000</span> VND / <span
									class="card-text"> 1 </span> sản phẩm
							</p>
							<p>
								Thương hiệu: <span class="card-text">Aroma Housewares</span>
							</p>
							<p>
								Màu: <span class="card-text">Trắng</span>
							</p>
							<p>
								Chất liệu: <span class="card-text">Nhôm</span>
							</p>
							<p>
								Kích thước (Dài x Rộng x Cao): <span class="card-text">3</span>cm
								x <span class="card-text">3</span>cm x <span class="card-text">3</span>cm
							</p>
							<p>
								Dung tích: <span class="card-text">2</span>lít
							</p>
							<p>
								Số lượng: <span class="card-text">999</span>
							</p>
							<div>
								<button class="btn btn-danger" onclick="hideProduct(this)">Ẩn
									đi</button>
								<button class="btn btn-warning" onclick="editProduct(this)">Điều
									chỉnh</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/productAdmin.js"></script>
	
</body>

</html>