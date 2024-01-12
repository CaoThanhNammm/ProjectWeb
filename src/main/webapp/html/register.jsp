<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/access.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Đăng ký</title>
</head>

<%
String note = (String) request.getParameter("status");
if (note != null && !note.isBlank()) {
	switch (note) {
	case "success":
		note = "Đăng nhập thành công";
		break;
	case "failed":
		note = "Vui lòng không để trống ô có đánh dấu *";
		break;
	case "failed-0":
		note = "Vui lòng kiểm tra lại thông tin";
		break;
	case "failed-1":
		note = "Email hoặc số điện thoại đã được đăng ký";
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
        Note: Đây là nơi đăng ký tài khoản cho khách hàng
     -->

	<div id="root">
		<div id="register" class="container access">
			<div class="row">
				<div class="col access_mb">
					<form id="form_register" method="post" action="access"
						accept-charset="UTF-8">
						<input type="hidden" name="access" value="register">
						<div class="access_group">
							<h1 class="access_group_h1">Xin chào</h1>
							<h5 class="access_group_h5">Cảm ơn bạn vì lựa chọn chúng tôi</h5>
							<a href="../index/index.jsp"> <img
								class="access_group_logo_img-black"
								src="../image/general/logo-black.png"
								alt="Logo của N2Q trên nền trắng"> <img
								class="access_group_logo_img-white"
								src="../image/general/logo.png" alt="Logo của N2Q trên nền đen">
							</a>
							<p class="text-danger">
								<%=note%>
							</p>
						</div>

						<div class="mt-4">
							<div class="access_group">
								<i class="fa-solid fa-user-tie access_group_icon"></i> <input
									id="name" type="text" placeholder="*Tên đăng nhập"
									maxlength="20" name="name" required>
							</div>
							<div class="access_group">
								<i class="fa-solid fa-phone access_group_icon"></i> <input
									type="tel" placeholder="*Số điện thoại" name="phone"
									required>
							</div>
							<div class="access_group">
								<i class="fa-solid fa-envelope access_group_icon"></i> <input
									type="email" placeholder="*Địa chỉ email" name="email" required>
							</div>
							<div class="access_group">
								<i class="fa-solid fa-address-book access_group_icon"></i> <input
									type="text" placeholder="Địa chỉ" name="address">
							</div>
							<div class="access_group">
								<i class="fa-solid fa-calendar-days access_group_icon"></i> <input
									type="date" name="date" required>
							</div>
							<div class="access_group access_group_gender">
								<span>Giới tính:</span> <span><input name="gender"
									type="radio" value="male" checked>Nam</span> <span><input
									name="gender" type="radio" value="freeMale">Nữ</span> <span><input
									name="gender" type="radio" value="other">Khác</span>
							</div>
							<div class="access_group access_group_regulation">
								<i class="fa-solid fa-lock access_group_icon"></i> <input
									type="password" placeholder="*Mật khẩu" name="pass"
									minlength="6" required>
							</div>
							<div class="access_group">
								<i class="fa-solid fa-lock-open access_group_icon"></i> <input
									type="password" placeholder="*Nhập lại mật khẩu" name="rePass"
									minlength="6" required>
							</div>

							<button type="submit" class="btn access_btn access_btn_submit">Tiếp
								tục</button>

							<div class="access_group">
								<div class="access_group_clause">
									Bằng cách tiếp tục, bạn đồng ý với <span class="color-yellow">Điều
										khoản sử dụng</span> và <span class="color-yellow">Thông báo
										quyền riêng tư</span> của <span>N2Q</span>.
								</div>
							</div>

							<div class="access_group d-flex flex-column">
								<span class="mb-4 access_group_head"> Hoặc đăng nhập </span> <a
									href="" class="access_btn btn btn-default"> <img
									class="icon" src="../image/general/google.png" alt="google">
									Bằng <span class="access_btn_focus">google</span>
								</a> <a href="" class="access_btn btn btn-default"> <img
									class="icon" src="../image/general/facebook.png" alt="facebook">
									Bằng <span class="access_btn_focus">facebook</span>
								</a>
							</div>
						</div>

						<div>
							<h6>
								Tiếp tục <a class="color-yellow" href="login.jsp">Tài khoản
									của bạn</a>
							</h6>
							<h6>
								Quên mật khẩu <a class="color-yellow" href="forget.jsp">Tìm
									lại ngay</a>
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
</body>

</html>