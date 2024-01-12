<%@page import="model.Account"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/userAdmin.css">
<title>Phân quyền</title>
</head>

<body style="display: flex;">
	<%@include file="headerAdmin.jsp"%>

	<div class="admin_body">
		<div id="user_des_admin">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<div class="container-fluid">
					<span class="navbar-brand">Người dùng</span>
				</div>
			</nav>

			<div class="header_search bg-light">
				<form action="../html/userAdminFind" method="POST" style="overflow: hidden">
					<input type="text" class="search"
						placeholder="Tìm người dùng theo email"
						name="userAdmin_findByEmail"
						value="<%=request.getAttribute("email")%>"> <input
						style="margin-left: 20px;" type="number" class="search"
						placeholder="Tìm người dùng theo số điện thoại"
						name="userAdmin_findByPhone"
						value="<%=request.getAttribute("phone")%>"> <input
						style="margin-left: 20px;" type="text" class="search"
						placeholder="Tìm người dùng theo họ tên"
						name="userAdmin_findByName"
						value="<%=request.getAttribute("name")%>">
					<button class="search_logo_btn">
						<i class="fa-solid fa-magnifying-glass search_logo"></i>
					</button>
				</form>

			</div>

			<table class="table_user">
				<tr>
					<th>STT</th>
					<th>Email</th>
					<th>Số điện thoại</th>
					<th>Họ và tên</th>
					<th>Role</th>
					<th>Status</th>
					<th>Giới tính</th>
					<th>Địa chỉ</th>
				</tr>

				<%
				List<Account> accounts = (List) request.getAttribute("accounts");
				for (Account ac : accounts) {
				%>
				<tr>
					<td><%=ac.getId()%></td>
					<td><%=ac.getEmail()%></td>
					<td><%=ac.getPhone()%></td>
					<td><%=ac.getFullName()%></td>
					<td>
						<%
						String currentRole = ac.getRole().getName();
						%>
						<ul class="users_role_list">
							<li class="users_role_item"><%=currentRole%> <i
								class="fa-solid fa-chevron-down"></i>
								<ul>
									<%
									if (currentRole.equalsIgnoreCase("User")) {
									%>

									<li class="users_role_item_child">
										<form action="../html/UserAdmin?role=2&id=<%=ac.getId()%>"
											method="POST">
											<button>Admin</button>
										</form>
									</li>

									<%
									} else {
									%>
									<li class="users_role_item_child">
										<form action="../html/UserAdmin?role=1&id=<%=ac.getId()%>"
											method="POST">
											<button>User</button>
										</form>
									</li>
									<%
									}
									%>
								</ul></li>
						</ul>
					</td>

					<td>
						<%
						String currentStatus = ac.getStatus().getName();
						%>
						<ul class="users_status_list">
							<li class="users_status_item"><%=currentStatus%> <i
								class="fa-solid fa-chevron-down"></i>
								<ul>
									<%
									if (currentStatus.equalsIgnoreCase("Khóa tài khoản")) {
									%>

									<li class="users_status_item_child">
										<form action="../html/UserAdmin?status=2&id=<%=ac.getId()%>"
											method="POST">
											<button>Hoạt động</button>
										</form>
									</li>

									<%
									} else {
									%>
									<li class="users_status_item_child">
										<form action="../html/UserAdmin?status=1&id=<%=ac.getId()%>"
											method="POST">
											<button>Khóa tài khoản</button>
										</form>
									</li>
									<%
									}
									%>
								</ul></li>
						</ul>
					</td>
					<td><%=ac.getGender().getSex()%></td>
					<td><%=ac.getAddress()%></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
<script>
	var elementUserStatusList = document.querySelectorAll(".users_status_item");
	var elementUserRoleList = document.querySelectorAll(".users_role_item");

	elementUserStatusList.forEach(function(value) {
		value.onclick = function() {
			var elementUserStatusListChild = value.querySelector("ul");
			elementUserStatusListChild.classList.toggle("active_child");
		}
	})

	elementUserRoleList.forEach(function(value) {
		value.onclick = function() {
			var elementUserRoleListChild = value.querySelector("ul");
			elementUserRoleListChild.classList.toggle("active_child");
		}
	})
</script>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>
</html>