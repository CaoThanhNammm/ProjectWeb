<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<title>Quản lý slidershow</title>
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="../css/slidershowAdmin.css">
<link rel="stylesheet" href="../css/header.css">
</head>

<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>

	<div id="slidershowAdmin">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<span class="navbar-brand">Slidershow</span>
			</div>
		</nav>

		<nav class="navbar navbar-expand-sm bg-light">
			<div>
				<form method="POST" action="../html/slidershowAdmin"
					enctype="multipart/form-data">
					<input style="margin-left: 10px" type="file" accept=".png, .jpg"
						multiple name="linkImage">
					<button class="btn btn-warning">+ Thêm ảnh</button>
				</form>
			</div>
		</nav>


		<div class="row">
			<div class="col ms-2 me-2">
				<%
				Map<String, String> slidershowImgCurrent = (Map<String, String>) request.getAttribute("slidershowImgCurrent");
				for (Map.Entry<String, String> entry : slidershowImgCurrent.entrySet()) {
				%>
				<div class="card mt-3">
					<img class="card-img-top" src="<%=entry.getValue()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=entry.getKey()%></h5>
						<div>
							<a href="../html/slidershowAdmin?link=<%=entry.getValue()%>"
								class="btn btn-danger">Xóa</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>

</html>