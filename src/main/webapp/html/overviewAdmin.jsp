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
String note = (String) request.getParameter("status");
boolean flag = true;
if (note != null && !note.isBlank()) {
	switch (note) {
	case "success":
		note = "Cập nhật thành công";
		break;
	case "failed":
		note = "Kiểm tra lại thông tin";
		break;
	case "change":
		flag = false;
		note = "";
		break;
	default:
		note = "Có lỗi";
		break;
	}
} else {
	note = "";
}
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
					<div class="ms-2 col">
						<span class="text-warning"><%=note%></span>
						<%
						if (flag) {
						%>
						<div>
							<div class="form-group">
								<label for="email"> <i class="fa-solid fa-envelope"></i>email
								</label> <input type="email" class="form-control" id="email"
									aria-describedby="email" placeholder="Địa chỉ email"
									name="email" value="<%=moreInfo.getEmail()%>" readonly>
							</div>

							<div class="form-group">
								<label for="tel"><i class="fa-solid fa-phone"> </i>Số
									điện thoại</label> <input type="tel" class="form-control" id="tel"
									name="tel" aria-describedby="tel" placeholder="Số điện thoại"
									value="<%=moreInfo.getPhone()%>" readonly>
							</div>

							<div class="form-group">
								<label for="fullName"><i class="fa-solid fa-user"></i>Họ
									và tên</label> <input type="text" class="form-control" id="fullName"
									name="fullName" aria-describedby="fullName"
									placeholder="Họ và tên" value="<%=moreInfo.getFullName()%>"
									readonly>
							</div>

							<div class="form-group">
								<label for="address"><i class="fa-solid fa-location-dot"></i>Địa
									chỉ</label> <input type="text" class="form-control" id="address"
									aria-describedby="address" placeholder="Địa chỉ" name="address"
									value="<%=moreInfo.getAddress()%>" readonly>
							</div>

							<div class="form-group">
								<label for="address-fb"><i class="fa-brands fa-facebook"></i>Facebook</label>
								<input type="text" class="form-control" id="address-fb"
									aria-describedby="address-fb"
									placeholder="Địa chỉ liên kết Facebook" value="facebook"
									readonly>
							</div>

							<div class="form-group">
								<label for="address-linkedin"><i
									class="fa-brands fa-linkedin"></i>Linkedin</label> <input type="text"
									class="form-control" id="address-linkedin"
									aria-describedby="address-linkedin"
									placeholder="Địa chỉ liên kết Linkedin" value="linkedin"
									readonly>
							</div>

							<div class="form-group">
								<label for="address-instagram"><i
									class="fa-brands fa-instagram"></i>Instagram</label> <input type="text"
									class="form-control" id="address-instagram"
									aria-describedby="address-instagram"
									placeholder="Địa chỉ liên kết Instagram" value="instagram"
									readonly>
							</div>

							<button class="btn btn-warning resest-password mt-2"
								onclick="_changePass()">
								<i class="fa-solid fa-lock"></i> <span class="mt-1">Đổi
									mật khẩu</span>
							</button>
							<button type="submit" onclick="_control()"
								class="btn btn-warning mt-2 submit" style="width: 100%;">Chỉnh
								sửa thông tin</button>
						</div>
						<%
						} else {
						%>
						<div class="form-group">
							<form action="infoAdmin" method="post">
								<input type="hidden" name="access" value="change-pass">
								<label for="pass"><i class="fa-solid fa-envelope"></i>Nhập
									mật khẩu cũ</label> <input type="text" class="form-control" id="pass"
									aria-describedby="pass" placeholder="Nhập mật khẩu cũ"
									name="pass" required> <label for="newPass"><i
									class="fa-solid fa-envelope"></i>Nhập mật khẩu mới</label> <input
									type="text" class="form-control" id="newPass"
									aria-describedby="newPass" placeholder="Nhập mật khẩu mới"
									name="newPass" required> <label for="confirmPass"><i
									class="fa-solid fa-envelope"></i>Nhập lại mật khẩu mới</label> <input
									type="text" class="form-control" id="confirmPass"
									aria-describedby="confirmPass"
									placeholder="Nhập lại mật khẩu mới" name="confirmPass" required>
								<button class="btn btn-warning mt-2" style="width: 100%;">Hoàn
									tất</button>
							</form>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/contact.js"></script>
	<script src="../js/editAdmin.js"></script>
</body>

</html>