<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/general/logo.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/indexRes.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<title>Sản phẩm</title>
</head>

<!-- 
    Create: Cao Thành Nam
    Note: Trang product 
 -->

<body>
	<div id="page">

		<div class="slider container">
			<div class="slider_img_list">
				<img class="slider_img_item" src="../image/home/trian2011.jpg"
					alt=""> <img class="slider_img_item"
					src="../image/home/content_introduce1.png" alt=""> <img
					class="slider_img_item" src="../image/home/content_introduce.jpg"
					alt=""> <img class="slider_img_item"
					src="../image/home/lọakeokeo.jpg" alt="">
			</div>

			<div class="slider_dot_list">
				<div class="slider_dot_item background_dot_slider-active"></div>
				<div class="slider_dot_item"></div>
				<div class="slider_dot_item"></div>
				<div class="slider_dot_item"></div>
			</div>

			<i class="fa-solid fa-angle-left left"></i> <i
				class="fa-solid fa-angle-right right"></i>
		</div>


		<!-- phần lọc -->
		<div class="category_product container">
			<div class="category_price">
				<span>Giá</span>

				<div class="category_price_option">
					<ul class="category_price_option_list category_option_list">
						<li class="category_price_option_item category_option_item">
							<p class="category_price_option_default">Theo mức giá</p> <i
							class="fa-solid fa-chevron-down category_all_item_icon"></i>
							<ul>
								<li>Từ thấp đến cao</li>
								<li>Từ cao đến thấp</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<div class="category_brand">
				<span>Thương hiệu</span>

				<div class="category_price_option">
					<ul class="category_brand_option_list category_option_list">
						<li class="category_brand_option_item category_option_item">
							<p class="category_brand_option_default">Theo thương hiệu</p> <i
							class="fa-solid fa-chevron-down category_all_item_icon"></i>
							<ul>
								<li><label for="Sunhouse"> <input type="checkbox"
										name="Sunhouse" id="Sunhouse"> <span for="lg">Sunhouse</span>
								</label></li>

								<li><label for="Kanguroo"> <input type="checkbox"
										name="Kanguroo" id="Kanguroo"> <span>Kanguroo</span>
								</label></li>

								<li><label for="Toshiba"> <input type="checkbox"
										name="Toshiba" id="Toshiba"> <span>Toshiba</span>
								</label></li>

								<li><label for="BlueStone"> <input type="checkbox"
										name="BlueStone" id="BlueStone"> <span>BlueStone</span>
								</label></li>
								<li><label for="Panasonic"> <input type="checkbox"
										name="Panasonic" id="Panasonic"> <span>Panasonic</span>
								</label></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<button href="" class="category_product_submit">ÁP DỤNG</button>
		</div>

		<!-- danh sách các sản phẩm -->
		<div class="product_list container">
			<h2 style="margin-bottom: 20px; cursor: default;">Sản phẩm nổi
				bật</h2>
			<div class="row mb-3"></div>

			<div class="new_page">
				<div class="row">
					<div class="col-lg-12">
						<ul class="new_page_list">
							<li class="new_page_item new_page_item_previous"><a> <i
									class="fa-solid fa-angle-left"
									style="margin-right: 3px; text-align: center;"></i> Previous
							</a></li>
							<li class="new_page_item"><a>1</a></li>
							<li class="new_page_item"><a>2</a></li>
							<li class="new_page_item"><a>3</a></li>
							<li class="new_page_item"><a>4</a></li>
							<li class="new_page_item"><a>5</a></li>
							<li class="new_page_item"><a>6</a></li>
							<li class="new_page_item new_page_item_next"><a> Next <i
									class="fa-solid fa-angle-right"
									style="margin-left: 3px; text-align: center;"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>
	</div>
</body>

<script src="../js/product.js"></script>
<script src="../js/index.js"></script>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

</html>