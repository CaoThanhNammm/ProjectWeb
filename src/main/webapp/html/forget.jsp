<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/access.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Quên mật khẩu</title>
</head>

<%
String note = (String) request.getParameter("status");
if (note != null && !note.isBlank()) {
	switch (note) {
	case "failed-0":
		note = "Kiểm tra lại thông tin";
		break;
	case "failed":
		note = "Sai tài khoản hoặc không tồn tại";
		break;
	default:
		note = "Có lỗi";
		break;
	}
} else {
	note = "";
}
%>

<body>
	<!-- 
        Create: Nguyễn Khải Nam
        Date: 19/10/2003
        Note: Nơi người dùng quên mật khẩu
     -->
	<div id="root">
		<div id="forget" class="container access">
			<div class="row">
				<div class="col access_mb">
					<form id="form_forget" action="access">
						<div class="access_group">
							<input type="hidden" name="access" value="forget">
							<h1 class="access_group_h1">Quên mật khẩu</h1>
							<h5 class="access_group_h5">Hãy nhập email để chúng tôi giúp
								bạn</h5>
							<a href="../index/index.jsp"> <img
								class="access_group_logo_img-black"
								src="../image/general/logo-black.png"
								alt="Logo của N2Q trên nền trắng"> <img
								class="access_group_logo_img-white"
								src="../image/general/logo.png" alt="Logo của N2Q trên nền đen">
							</a>
						</div>

						<div class="mt-4">
							<span class="text-danger"><%=note%></span>
							<div class="access_group">
								<i class="fa-solid fa-envelope access_group_icon"></i> <input
									type="email" name="email" placeholder="*Địa chỉ email" required>
							</div>
							<button type="submit" class="btn access_btn access_btn_submit">Tiếp
								tục</button>
						</div>

						<div>
							<h6>
								Tiếp tục <a class="color-yellow" href="login.jsp">Tài khoản
									của bạn</a>
							</h6>
							<h6>
								Chưa có tài khoản hãy <a class="color-yellow"
									href="register.jsp">Đăng ký ngay</a>
							</h6>
						</div>
					</form>
				</div>

				<div class="col d-flex justify-content-center">
					<img class="access_img" src="../image/access/image.png"
						alt="Ảnh giới thiệu">
				</div>

			</div>
		</div>
	</div>

	<script src="../js/access.js"></script>
</body>

</html>