<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/about.css">
<title>Giới thiệu</title>
</head>

<body>
	<div id="page">
		<%@include file="header.jsp"%>

		<div id="root">
			<div class="about_img">
				<img src="../image/about/about_img.jpg" alt="">

				<div class="about_img_slogan">
					<h1 style="margin-bottom: 10px;">SẢN PHẨM TỐT</h1>
					<h1 style="margin-bottom: 10px;">CUỘC SỐNG TỐT</h1>
					<p>Cuộc sống với sản phẩm tốt là một trải nghiệm đáng trân
						trọng. Sản phẩm tốt không chỉ mang lại hạnh phúc và sự tiện ích,
						mà còn thể hiện sự chăm sóc và quan tâm đến chất lượng cuộc sống
						của chúng ta.</p>
				</div>
			</div>

			<div class="introduce container">
				<h2>GIỚI THIỆU</h2>
				<p>Trang web bán đồ gia dụng là điểm đến lý tưởng cho những
					người đang tìm kiếm các sản phẩm gia đình đa dạng và chất lượng.
					Chúng tôi cung cấp một bộ sưu tập đa dạng gồm các sản phẩm từ đồ
					nội thất, thiết bị nhà bếp, đồ trang trí cho đến các thiết bị điện
					tử, giúp bạn tạo nên không gian sống hoàn hảo theo phong cách riêng
					của bạn. Hãy tham gia cùng chúng tôi để biến ngôi nhà của bạn thành
					nơi đáng sống!</p>
			</div>

			<div class="container">
				<div class="row about_history about_us">
					<div class="col-lg-6">
						<img src="../image/about/history.jpg" alt="">
					</div>
					<div class="col-lg-6 mt-3">
						<div class="history_estab">
							<h2 style="text-align: center;">HÌNH THÀNH</h2>
							<p>Chúng tôi là một nhóm đam mê và chuyên nghiệp trong lĩnh
								vực phát triển web, đã tổng hợp kiến thức và kinh nghiệm của
								mình để tạo ra một dự án đầy tham vọng.</p>
							<p>Chúng tôi hiểu rằng việc mua sắm trực tuyến là một xu
								hướng phổ biến và quan trọng trong thời đại số hóa. Chúng tôi đã
								nhận thấy nhu cầu của người tiêu dùng và doanh nghiệp trong việc
								cung cấp một nền tảng trực tuyến hiệu quả và thuận tiện để mua
								sắm các sản phẩm đồ gia dụng chất lượng. Với mục tiêu này, chúng
								tôi đã tự hào giới thiệu dự án của mình</p>
						</div>
					</div>
				</div>

				<div class="row about_value about_us">
					<div class="col-lg-6">
						<img src="../image/about/value.jpg" alt="">
					</div>
					<div class="col-lg-6 mt-3">
						<div class="value_webpage">
							<h2 style="text-align: center;">GIÁ TRỊ CHÚNG TÔI MANG LẠI</h2>
							<p class="value_webpage_first">Sản phẩm chất lượng:</p>
							<p class="value_webpage_second">Chúng tôi cam kết cung cấp đồ
								gia dụng cao cấp và uy tín, chọn lọc từ các nhà cung cấp đáng
								tin cậy. Chất lượng sản phẩm là ưu tiên hàng đầu của chúng tôi.</p>

							<p class="value_webpage_first">Trải nghiệm mua sắm trực tuyến
								thuận tiện:</p>
							<p class="value_webpage_second">Chúng tôi hiểu rằng mua sắm
								trực tuyến cần phải dễ dàng và thoải mái. Trang web của chúng
								tôi được thiết kế để đảm bảo người dùng có trải nghiệm mua sắm
								trực tuyến trơn tru và an toàn.</p>

							<p class="value_webpage_first">Sự đa dạng và lựa chọn:</p>
							<p class="value_webpage_second">Trang web của chúng tôi cung
								cấp một loạt các sản phẩm đồ gia dụng từ bát đĩa, nồi chảo đến
								thiết bị gia đình thông minh. Chúng tôi tin rằng bạn sẽ tìm thấy
								sản phẩm phù hợp với nhu cầu và sở thích của mình.</p>

						</div>
					</div>
				</div>
			</div>

			<div class="contact container"
				style="margin-bottom: 7%; margin-top: 7%;">
				<div class="row">
					<div class="col">
						<form action="#" id="form">
							<thead>
								<th>
									<h1 class="text-center">Liên lạc với chúng tôi</h1>
								</th>
							</thead>
							<div class="mb-3 mt-3">
								<input type="text" class="form-control" id="name"
									placeholder="Nhập tên của bạn" name="name" required>
							</div>
							<div class="mb-3 mt-3">
								<input type="email" class="form-control" id="email"
									placeholder="Nhập email của bạn" name="email" required>
							</div>
							<div class="mb-3 mt-3">
								<input type="text" class="form-control" id="subject"
									placeholder="Nhập tiêu đề" name="subject" required>
							</div>
							<div class="mt-3 mb-2">
								<textarea name="content" class="form-control"
									placeholder="Nhập nội dung" id="content" cols="30" rows="7"></textarea required>
							</div>
							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-primary rounded-9"
									style="background-color: var(- -yellow-primary); border: none;">Gửi
									email</button>
							</div>

						</form>
					</div>

					<div class="col mt-3">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2257143843904!2d106.78732442480627!3d10.870429689284114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1698550669366!5m2!1svi!2s"
							width="600" height="450" style="border: 0;" allowfullscreen=""
							loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					</div>
				</div>
			</div>
			<%@include file="footer.jsp"%>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

</html>