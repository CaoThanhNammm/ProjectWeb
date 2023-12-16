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

<%@ page import="model.Account"%>
<%
Account moreInfo = (Account) session.getAttribute("moreInfo");
%>

<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>
	<div id="overview">
		<div class="container-fluid">
			<div class="row mb-2">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark container">
					<div class="container-fluid">
						<span class="navbar-brand">Quản trị viên</span>
					</div>
				</nav>
			</div>
			<div id="form">
				<div class="row">
					<div class="col-sm-3">
						<div class="card">
							<img class="card-img-top" src="../image/avatar/admin.jpg"
								alt="Card image cap">
							<div class="card-body">
								<p class="card-text text-center">
									<i class="fa-solid fa-star"></i>Quản trị viên
								</p>
								<button class="btn btn-warning upload mb-2">
									<i class="fa-solid fa-upload"></i> Tải hình ảnh mới <input
										type="file">
								</button>
								<button class="btn btn-warning resest-password">
									<i class="fa-solid fa-lock"></i>Đổi mật khẩu
								</button>
							</div>
						</div>
					</div>

					<div class="ms-2 col-sm-8">

						<div class="form-group">
							<label for="fullName"><i class="fa-solid fa-envelope"></i>Địa
								chỉ email</label> <input type="email" class="form-control" id="email"
								aria-describedby="email" placeholder="Địa chỉ email"
								name="email" value="<%=moreInfo.getEmail()%>" readonly>
							<label for="tel"><i class="fa-solid fa-phone"></i>Số điện
								thoại</label> <input type="tel" class="form-control" id="tel" name="tel"
								aria-describedby="tel" placeholder="Số điện thoại"
								value="<%=moreInfo.getPhone()%>" readonly> <label
								for="fullName"><i class="fa-solid fa-user"></i>Họ và tên</label>
							<input type="text" class="form-control" id="fullName"
								name="fullName" aria-describedby="fullName"
								placeholder="Họ và tên" value="<%=moreInfo.getFullName()%>"
								readonly> <label for="address"><i
								class="fa-solid fa-location-dot"></i>Địa chỉ</label> <input type="text"
								class="form-control" id="address" aria-describedby="address"
								placeholder="Địa chỉ" name="address"
								value="<%=moreInfo.getAddress()%>" readonly> <label
								for="address-fb"><i class="fa-brands fa-facebook"></i>Địa
								chỉ liên kết Facebook</label> <input type="text" class="form-control"
								id="address-fb" aria-describedby="address-fb"
								placeholder="Địa chỉ liên kết Facebook" value="facebook"
								readonly> <label for="address-fb"><i
								class="fa-brands fa-linkedin"></i>Địa chỉ liên kết Linkedin</label> <input
								type="text" class="form-control" id="address-linkedin"
								aria-describedby="address-linkedin"
								placeholder="Địa chỉ liên kết Linkedin" value="linkedin"
								readonly> <label for="address-instagram"><i
								class="fa-brands fa-instagram"></i>Địa chỉ liên kết Instagram</label> <input
								type="text" class="form-control" id="address-instagram"
								aria-describedby="address-instagram"
								placeholder="Địa chỉ liên kết Instagram" value="instagram"
								readonly>
							<button type="submit" onclick="_control()"
								class="btn btn-warning mt-2 submit" style="width: 100%;">Chỉnh
								sửa thông tin</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/contact.js"></script>
	<script src="../js/editAdmin.js"></script>
</body>

</html>