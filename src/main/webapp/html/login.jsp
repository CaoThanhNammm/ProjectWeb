<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
		<link rel="stylesheet" href="../css/index.css">
		<link rel="stylesheet" href="../css/access.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
		<title>Đăng nhập</title>
	</head>
	<% String note=(String) session.getAttribute("status"); if (note !=null && !note.isBlank()) { switch (note) {
		case "success" : note="Đăng nhập tài khoản" ; break; case "success-1" : note="Nhập mật khẩu trong email" ;
		break; case "failed" : note="Đăng nhập không thành công" ; break; case "failed-0" : note="Tài khoản bị vô hiệu"
		; break; default: note="Có lỗi" ; break; } } else { note="" ; } %>

		<body>
			<!-- 
Create: Nguyễn Khải Nam
Date: 18/10/2003
Note: Nơi đăng nhập của những khách hàng đã có tài khoản
-->
			<div id="root">
				<div id="login" class="container access">
					<div class="row">
						<div class="col access_mb">
							<form id="form_login" action="../access" method="post">
								<input type="hidden" name="access" value="login">
								<div class="access_group">
									<h1 class="access_group_h1">Chào mừng</h1>
									<h5 class="access_group_h5">Rất vui vì bạn quay lại với
										chúng tôi</h5>
									<a href="../index/index.jsp"> <img class="access_group_logo_img-black"
											src="../image/general/logo-black.png" alt="Logo của N2Q trên nền trắng">
										<img class="access_group_logo_img-white" src="../image/general/logo.png"
											alt="Logo của N2Q trên nền đen">
									</a>
									<p class="text-danger">
										<%=note%>
									</p>
								</div>

								<div class="mt-4">
									<div class="access_group">
										<i class="fa-solid fa-user-tie access_group_icon"></i> <input type="text"
											placeholder="Email hoặc Số điện thoại" name="name" required>
									</div>
									<div class="access_group">
										<i class="fa-solid fa-lock access_group_icon"></i> <input type="password"
											placeholder="Mật khẩu" name="password" required>
									</div>

									<button type="submit" class="btn access_btn access_btn_submit">Tiếp
										tục</button>

									<div class="access_group">
										<div class="access_group_clause">
											Bằng cách tiếp tục, bạn đồng ý với <a class="color-yellow" href="policy.jsp"
												target="_blank">Điều khoản sử dụng</a> và <a class="color-yellow"
												href="policy.jsp" target="_blank">Thông
												báo quyền riêng tư</a> của N2Q.
										</div>
									</div>

									<div class="access_group d-flex flex-column">
										<span class="mb-4 access_group_head"> Hoặc đăng nhập </span> <a href=""
											class="access_btn btn btn-default"> <img class="icon"
												src="../image/general/google.png" alt="google">
											Bằng <span class="access_btn_focus">google</span>
										</a> <a href="" class="access_btn btn btn-default"> <img class="icon"
												src="../image/general/facebook.png" alt="facebook">
											Bằng <span class="access_btn_focus">facebook</span>
										</a>
									</div>
								</div>

								<div>
									<h6>
										Chưa có tài khoản hãy <a class="color-yellow" href="register.jsp">Đăng ký
											ngay</a>
									</h6>
									<h6>
										Quên mật khẩu <a class="color-yellow" href="register.jsp">Tìm
											lại ngay</a>
									</h6>
								</div>
							</form>
						</div>

						<div class="col d-flex justify-content-center">
							<img class="access_img" src="../image/access/image.png" alt="Ảnh giới thiệu">
						</div>
					</div>
				</div>
			</div>
		</body>

	</html>