<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/headAdmin.css">
<link rel="stylesheet" href="../css/productAdmin.css">
<title>Thống kê sản phẩm</title>
</head>

<%
long total = (long) request.getAttribute("count-total");
long avai = (long) request.getAttribute("count-avai");
long countNewP = (long) request.getAttribute("count-new-product");
long[] countBuy = (long[]) request.getAttribute("count-buy");
long[] countAvai = (long[]) request.getAttribute("count-give-avai");
long[] countApproach = (long[]) request.getAttribute("count-approach");
%>

<body class="d-flex">
	<%@include file="headerAdmin.jsp"%>

	<div class="statistic_admin ms-2 me-2 mt-2">
		<div class="row">
			<div class="row">
				<div class="card-group">
					<div class="card text-white bg-dark">
						<div class="card-body">
							<h5 class="card-title">Số lượng sản phẩm</h5>
							<p class="card-text">
								Số lượng sản phẩm hiện tại đang có:
								<%=total%>
								sản phẩm
							</p>
						</div>
					</div>
					<div class="card text-white bg-warning">
						<div class="card-body">
							<h5 class="card-title">Số lượng sản phẩm khả dụng</h5>
							<p class="card-text">
								Số lượng sản phẩm khả dụng là:
								<%=avai%>
								sản phẩm
							</p>
						</div>
					</div>
					<div class="card bg-light">
						<div class="card-body">
							<h5 class="card-title">Số lượng sản phẩm mới (trong ngày)</h5>
							<p class="card-text">
								Số lượng sản phẩm mới là:
								<%=countNewP%></p>
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
							<li class="nav-item">
								<button class="btn" onclick="change(0)">Ngày</button>
							</li>
							<li class="nav-item ms-1 me-1">
								<button class="btn" onclick="change(1)">Tuần</button>
							</li>
							<li class="nav-item">
								<button class="btn" onclick="change(2)">Tháng</button>
							</li>
						</ul>
					</div>
				</div>

				<div class="row text-white bg-secondary pt-2 pb-2 ps-2 pe-2">
					<div class="col-lg-2">
						<div class="mt-5">
							<p>Số lần các sản phẩm được mua</p>
							<h2 id="buy"></h2>
						</div>

						<div class="mt-5 mb-5">
							<p>Số sản phẩm được giao thành công</p>
							<h2 id="buy-success"></h2>
						</div>

						<div>
							<p>Số lượng khách hàng tiếp cận sản phẩm mới</p>
							<h2 id="buy-approach"></h2>
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
		var a = [
	<%=countBuy[0]%>
		,
	<%=countBuy[1]%>
		,
	<%=countBuy[2]%>
		]
		var b = [
	<%=countAvai[0]%>
		,
	<%=countAvai[1]%>
		,
	<%=countAvai[2]%>
		]
		var c = [
	<%=countApproach[0]%>
		,
	<%=countApproach[1]%>
		,
	<%=countApproach[2]%>
		]
		function change(ind) {
			document.getElementById('buy').innerText = a[ind]
			document.getElementById('buy-success').innerText = b[ind]
			document.getElementById('buy-approach').innerText = c[ind]
			var xValues = [ "Số lần mua", "Giao thành công", "Tiếp cận" ];
			var yValues = [ a[ind], b[ind], c[ind] ];
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
						text : "Thống kê các sản phẩm theo danh mục",
						fontColor : 'white'
					},
					legend : {
						labels : {
							fontColor : 'white'
						}
					}
				}
			});
		}

		change(0)
	</script>
</body>

</html>