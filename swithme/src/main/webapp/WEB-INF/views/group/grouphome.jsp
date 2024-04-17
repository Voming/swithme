<!-- reset.css -->
<link
	href="${pageContext.request.contextPath}/resources/css/basic/reset.css"
	rel="stylesheet">
<!-- 레이아웃 설정 -->
<link
	href="${pageContext.request.contextPath}/resources/css/basic/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/basic/layout.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/basic/header.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/basic/footer.css"
	rel="stylesheet">

<!-- group_home-->
<link
	href="${pageContext.request.contextPath}/resources/css/group/grouphome.css"
	rel="stylesheet">

<!-- carousel -->
<link
	href="${pageContext.request.contextPath}/resources/css/group/carousel_assets/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/group/carousel_assets/owl.theme.default.css"
	rel="stylesheet">
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
				dots : true,
				//autoplay: true,
				autoplayTimeout : 3000,
				autoplayHoverPause : true
			});
		};
	</script>
	<div class="wrapper">
		<div class="wrap-header">
			<header>
				<%@include file="/WEB-INF/views/basic/header.jsp"%>
				<div class="bn">
					<div class="nav2-wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
							<li><a class="active"
								href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a href="${pageContext.request.contextPath}/testcalendar">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr>
				</div>
			</header>
		</div>
		<div class="wrap-body">
			<div class="wrap-group">
				<div class="wrap-my">
					<div class="txt-my">
						<p>내 그룹</p>
					</div>
					<div class="owl-carousel">
						<div class="item">
							<figure>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/myrecord'">
									<img src="http://via.placeholder.com/290X180.jpg/">
								</button>
								<figcaption>그룹명</figcaption>
							</figure>
						</div>
						<div class="item">
							<figure>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/myrecord'">
									<img src="http://via.placeholder.com/290X180.jpg/">
								</button>
								<figcaption>그룹명</figcaption>
							</figure>
						</div>
						<div class="item">
							<figure>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/myrecord'">
									<img src="http://via.placeholder.com/290X180.jpg/">
								</button>
								<figcaption>그룹명</figcaption>
							</figure>
						</div>
						<div class="item">
							<figure>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/myrecord'">
									<img src="http://via.placeholder.com/290X180.jpg/">
								</button>
								<figcaption>그룹명</figcaption>
							</figure>
						</div>
						<div class="item">
							<figure>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/myrecord'">
									<img src="http://via.placeholder.com/290X180.jpg/">
								</button>
								<figcaption>그룹명</figcaption>
							</figure>
						</div>
					</div>
					<div class=""></div>
				</div>
			</div>
			<div class="wrap-search">
				<div>
					<p>그룹찾기</p>
				</div>
				<div>
					<div class="search" >
						<input type="text" value="&nbsp;찾고싶은 스터디 그룹명을 검색 하세요.">
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/myrecord'">
							<img class="search-btn"
								src="${pageContext.request.contextPath}/resources/images/find.png"
								alt="찾기">
						</button>
					</div>
				</div>
				<div class="move-make">
					<div>
						<p>원하는 그룹이 없다면?</p>
					</div>
					<div>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/group/create'">그룹
							생성하러 가기</button>
					</div>
				</div>
			</div>
			<div class="wrap-openlist">
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	<!-- carousel -->
	<script
		src="${pageContext.request.contextPath}/resources/css/group/carousel_js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/group/carousel_js/owl.autoplay.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/group/carousel_js/owl.navigation.js"></script>
</body>
</html>