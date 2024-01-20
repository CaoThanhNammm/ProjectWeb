<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/voucherAdmin.css">
<title>Sửa voucher</title>
</head>

<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>

	<div id="voucher">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<span class="navbar-brand">Voucher</span>
			</div>
		</nav>

		<nav class="navbar navbar-expand-sm bg-light">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="header_search">
							<input type="text" class="search" placeholder="Tìm mã voucher">
							<i class="fa-solid fa-magnifying-glass search_logo"></i>
						</div>
					</li>
				</ul>

				<div>
					<button class="btn btn-warning">+ Thêm voucher</button>
				</div>
			</div>
		</nav>

		<div class="row">
			<div class="col ms-2 me-2">
				<div class="card mt-3">
					<img class="card-img-top" src="../image/voucher/voucher_img.png"
						alt="Card image cap">

					<div class="card-body">
						<h5 class="card-title">EEXJDKS</h5>
						<p class="card-text">Giảm 100%</p>
						<p class="card-text">Dành cho mọi sản phẩm</p>
						<p class="card-text">Số lượng: 999</p>
						<div>
							<button class="btn btn-danger">Loại bỏ</button>
							<button class="btn btn-warning">Điều chỉnh</button>
						</div>
					</div>
				</div>
				
				<div class="card mt-3">
					<img class="card-img-top" src="../image/voucher/voucher_img.png"
						alt="Card image cap">

					<div class="card-body">
						<h5 class="card-title">HJDSHJ</h5>
						<p class="card-text">Free ship</p>
						<p class="card-text">Dành cho mọi sản phẩm</p>
						<p class="card-text">Số lượng: 1000</p>
						<div>
							<button class="btn btn-danger">Loại bỏ</button>
							<button class="btn btn-warning">Điều chỉnh</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>