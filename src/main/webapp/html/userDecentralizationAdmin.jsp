<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/headAdmin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/userAdmin.css">
<title>Phân quyền</title>
</head>

<body style="display: flex;">
	<%@include file="headerAdmin.jsp"%>

	<div id="user_des_admin">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<span class="navbar-brand">Người dùng</span>
			</div>
		</nav>

		<div class="header_search bg-light">
			<input type="text" class="search"
				placeholder="Tìm người dùng theo tên đăng nhập"> <i
				class="fa-solid fa-magnifying-glass search_logo"></i> <input
				style="margin-left: 20px;" type="text" class="search"
				placeholder="Tìm người dùng theo họ tên"> <i
				class="fa-solid fa-magnifying-glass search_logo"></i>
		</div>


		<table class="table_user">
			<tr>
				<th><input type="checkbox" name="" id=""></th>
				<th>STT</th>
				<th>Tên đăng nhập</th>
				<th>Email</th>
				<th>Số điện thoại</th>
				<th>Họ và tên</th>
				<th>Địa chỉ</th>
				<th>Role</th>
				<th>Status</th>
			</tr>

			<tr>
				<td><input type="checkbox" name="" id=""></td>
				<td>1</td>
				<td>huy12052003</td>
				<td>huylop12@gmail.com</td>
				<td>0908263287</td>
				<td>Nguyễn Văn Huy</td>
				<td>TPHCM</td>
				<td>User</td>
				<td><select name="" id="">
						<option value="">Khả dụng</option>
						<option value="">Không khả dụng</option>
						<option value="">Chặn</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="" id=""></td>
				<td>2</td>
				<td>quyen.fire</td>
				<td>quyenhocgioi@gmail.com</td>
				<td>0143433232</td>
				<td>Nguyễn Danh Quyền</td>
				<td>Đồng Nai</td>
				<td>User</td>
				<td><select name="" id="">
						<option value="">Khả dụng</option>
						<option value="">Không khả dụng</option>
						<option value="">Chặn</option>
				</select></td>
			</tr>

			<tr>
				<td><input type="checkbox" name="" id=""></td>
				<td>3</td>
				<td>teohomnaytoibuon</td>
				<td>teo123@gmail.com</td>
				<td>0907768787</td>
				<td>Đặng Thanh Tèo</td>
				<td>Đồng Tháp</td>
				<td>User</td>
				<td><select name="" id="">
						<option value="">Khả dụng</option>
						<option value="">Không khả dụng</option>
						<option value="">Chặn</option>
				</select></td>
			</tr>

			<tr>
				<td><input type="checkbox" name="" id=""></td>
				<td>4</td>
				<td>tybanteo</td>
				<td>tydichoi@gmail.com</td>
				<td>0933354667</td>
				<td>Cao Thiên Ngọc Quốc Tý</td>
				<td>TPHCM</td>
				<td>User</td>
				<td><select name="" id="">
						<option value="">Khả dụng</option>
						<option value="">Không khả dụng</option>
						<option value="">Chặn</option>
				</select></td>
			</tr>


		</table>

		<button class="submit">Lưu thay đổi</button>

	</div>
</body>


<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>



</html>