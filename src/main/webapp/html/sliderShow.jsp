<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/sliderShow.css">
<title>Slider</title>
</head>
<body>
	<div class="slider container">
		<div class="slider_img_list">
			<c:forEach items="${imgSliderShow}" var="img">
				<img class="slider_img_item" src="../image/home/sliderShow/${img}"
					alt="">
			</c:forEach>
		</div>

		<%
		int totalDot = (Integer) request.getAttribute("totalDot");
		%>
		<div class="slider_dot_list"
			style="left: calc(50% + (var(--marginLeftWidthDotSliderShow) + var(--widthDotSliderShow)/2)*<%=-totalDot%>)">
			<%
			for (int i = 0; i < totalDot; i++) {
				if (i == 0) {
			%>
			<div class="slider_dot_item background_dot_slider-active"></div>
			<%
			} else {
			%>
			<div class="slider_dot_item "></div>
			<%
			}
			}
			%>
		</div>

		<i class="fa-solid fa-angle-left left"></i> <i
			class="fa-solid fa-angle-right right"></i>
	</div>

</body>
</html>