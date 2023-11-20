<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/headAdmin.css">
<link rel="stylesheet" href="../css/overviewAdmin.css">
<title>Tổng quan</title>
</head>

<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>
	<div id="overview">
		<div class="container-fluid">
			<div class="row">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark container">
					<div class="container-fluid">
						<span class="navbar-brand">Admin</span>
					</div>
				</nav>
			</div>

			<div class="row ms-2 mt-2">
				<div class="row mb-5">
					<div class="col-2">
						<img class="overview_avatar" src="../image/avatar/admin.jpg"
							alt="Ảnh đại diện">
					</div>

					<div class="col-10">
						<span class="overview_info">
							<p>
								Họ và tên: <b>Admin</b>
							</p>
						</span> <span class="overview_info">
							<p>
								Đại chỉ email: <b>nhom23@hcmuaf.edu.vn</b>
							</p>
						</span> <span class="overview_info">
							<p>
								Ngày sinh: <b>29 - 2 - 2003</b>
							</p>
						</span>
					</div>
				</div>

				<div class="row">
					<span class="overview_info">
						<p>
							Tên công ty: <b>Tập đoàn Nông Lâm N2Q</b>
						</p>
					</span> <span class="overview_info">
						<p>
							Số điện thoại: <b>+84 123 456 789</b>
						</p>
					</span> <span class="overview_info">
						<p>
							Địa chỉ: <b>VQCR+GP6, Khu Phố 6, Thủ Đức, Thành phố Hồ Chí
								Minh, Việt Nam</b>
						</p>
					</span> <span class="overview_info">
						<p>
							Liên kết Facebook: <b>https://www.facebook.com/</b>
						</p>
					</span> <span class="overview_info">
						<p>
							Liên kết Instagram: <b>https://www.instagram.com/</b>
						</p>
						<p></p>
					</span> <span class="overview_info">
						<p>
							Linkedin: <b>https://www.linkedin.com/</b>
						</p>
					</span>
				</div>

				<div class="row mt-3">
					<button class="btn btn-warning">Điều chỉnh</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>