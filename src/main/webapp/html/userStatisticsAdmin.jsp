<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/headAdmin.css">
<link rel="stylesheet" href="../css/userAdmin.css">
<link rel="stylesheet" href="../css/productAdmin.css">
<title>Thống kê người dùng</title>
</head>
<%
long countUser = (long) request.getSession().getAttribute("count-user");
long countAccess = (long) request.getSession().getAttribute("count-access");
long countSign = (long) request.getSession().getAttribute("count-sign");
%>

<!-- 
    Create: Nguyễn Khải Nam
    Date: 08/11/2023
    Note: Trang thống kê người dùng
 -->
<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>

	<div id="statistic_admin" class="ms-2 me-2 mt-2">
		<div class="row">
			<div class="row">
				<div class="card-group">
					<div class="card text-white bg-dark">
						<div class="card-body">
							<h5 class="card-title">Số lượng người dùng</h5>
							<p class="card-text">
								Số lượng người dùng hiện tại đang có:
								<%=request.getAttribute("totalUser")%>
								người
							</p>
						</div>
					</div>
					<div class="card text-white bg-warning">
						<div class="card-body">
							<h5 class="card-title">Số lượng người dùng khả dụng</h5>
							<p class="card-text">
								Số lượng người dùng khả dụng là:
								<%=request.getAttribute("userAvailable")%>
								người
							</p>
						</div>
					</div>
					<div class="card bg-light">
						<div class="card-body">
							<h5 class="card-title">Số lượng người dùng mua vi phạm</h5>
							<p class="card-text">
								Số lượng người dùng vi phạm là:
								<%=request.getAttribute("userUnAvailable")%>
								người
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-3">
				<div class="row bg-light">
					<div class="col-lg-2 pt-1 pb-1 ps-2">
						<h2>Thống kê</h2>
					</div>
					<div class="col-lg-10 my-auto">
						<ul class="d-flex nav">
						</ul>
					</div>
				</div>

				<div class="row text-white bg-secondary pt-2 pb-2 ps-2 pe-2">
					<div class="col-lg-2">
						<div class="mt-5">
							<p>Số người dùng tạo tài khoản mới</p>
							<h2><%=countUser%></h2>
						</div>

						<div class="mt-5 mb-5">
							<p>Số người dùng hoạt động</p>
							<h2><%=countSign%></h2>
						</div>

						<div>
							<p>Số người dùng xem trang</p>
							<h2><%=countAccess%></h2>
						</div>
					</div>

					<div class="col-lg-10">
						<div class="row">
							<div class="operating-systems"></div>
						</div>

						<div class="row">
							<div class="chart">
								<div class="svg-container">
									<canvas id="myChart" style="width: 100%; max-width: 700px"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
		
	</script>

	<script>
		var xValues = [ "Tạo", "Hoạt động", "Xem trang" ];
		var yValues = [
	<%=countUser%>
		,
	<%=countSign%>
		,
	<%=countAccess%>
		];
		var barColors = [ "#b91d47", "#00aba9", "#2b5797" ];

		new Chart("myChart", {
			type : "pie",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : yValues,
				} ]
			},
			options : {
				title : {
					display : true,
					text : "Thống kê các loại người dùng trong tháng",
					fontColor : 'white'
				},
				legend : {
					labels : {
						fontColor : 'white'
					}
				}
			}
		});
	</script>
</body>


</html>