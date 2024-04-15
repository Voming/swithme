<!-- reset.css -->
<link href="${pageContext.request.contextPath}/resources/css/basic/reset.css" rel="stylesheet">
<!-- 레이아웃 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/basic/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/layout.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/basic/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/footer.css" rel="stylesheet">

<!-- group_home-->
<link href="${pageContext.request.contextPath}/resources/css/group/grouphome.css" rel="stylesheet">

<!-- carousel -->
<link href="${pageContext.request.contextPath}/resources/css/group/carousel_assets/owl.carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/carousel_assets/owl.theme.default.css"rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>group home</title>
<!-- jQuery 선언 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<script>
		$(carouselHandler)
		function carouselHandler() {
			$('.wrap-group .owl-carousel').owlCarousel({
				items : 3,
				margin : 10,
				loop : true,
				nav : true,
				autoplay : true,
				autoplayTimeout : 3000,
				autoplayHoverPause : true
			});
		};
	</script>
	<div class="wrapper">
		<div class="wrap-header">
			<%@include file="/WEB-INF/views/basic/header.jsp"%>
		</div>
		<div class="wrap-body">
			<div class="wrap-group">
				<div class="wrap-my">
					<div>
						<p>내 그룹</p>
					</div>
					<div class="owl-carousel">
						<div class="item">
							<img src="http://via.placeholder.com/290X180.jpg/">
						</div>
						<div class="item">
							<img src="http://via.placeholder.com/290X180.jpg/">
						</div>
						<div class="item">
							<img src="http://via.placeholder.com/290X180.jpg/">
						</div>
						<div class="item">
							<img src="http://via.placeholder.com/290X180.jpg/">
						</div>
						<div class="item">
							<img src="http://via.placeholder.com/290X180.jpg/">
						</div>
					</div>
					<div class=""></div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	<!-- carousel -->
	<script src="${pageContext.request.contextPath}/resources/css/group/carousel_js/owl.carousel.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/group/carousel_js/owl.autoplay.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/group/carousel_js/owl.navigation.js"></script>
</body>
</html>