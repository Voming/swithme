<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- group_home-->
<link href="${pageContext.request.contextPath}/resources/css/group/grouphome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/grouphome_list.css" rel="stylesheet">

<!-- carousel -->
<link href="${pageContext.request.contextPath}/resources/css/group/carousel_assets/owl.carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/carousel_assets/owl.theme.default.css" rel="stylesheet">

<!-- wellcom -->
<link href="${pageContext.request.contextPath}/resources/css/welcome/welcome.css" rel="stylesheet">
<meta charset="UTF-8">
<title>group home</title>
<!-- jQuery 선언 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<script>
		$(loadedHandler);

		function loadedHandler() {
			//캐러셀 호출
			$('.wrap-group .owl-carousel').owlCarousel({
				items : 3,
				margin : 10,
				loop : true,
				dots : true,
				//autoplay: true,
				autoplayTimeout : 3000,
				autoplayHoverPause : true
			});
			
			
			$(".btn.make").on("click", btnMakeClickHandler);
			
			//그룹 탭
			 // $('.prd-tab-content > div').hide();
            $('.group-tab-nav a').click(function () {
                console.log(this);
                $('.group-tab-content > div').hide().filter(this.hash).fadeIn();
                $('.group-tab-nav a').removeClass('active');
                console.log(this);
                $(this).addClass('active');
                return false;
            }).filter(':eq(0)').click();
        }

		function btnMakeClickHandler() {
			/* 로그인 체크 */
			
			var loginInfo = "${loginInfo}";

			if (loginInfo) {
				
					location.href = "${pageContext.request.contextPath}/group/create";
			} else {
				var result = confirm("로그인이 되야어 그룹 생성이 가능합니다.이동하시겠습니까");
				if (result) {
					location.href = "${pageContext.request.contextPath}/login";
				} else {
					location.href = "${pageContext.request.contextPath}/group";
				}

			}
 
		}
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

		<c:choose>
			<c:when test="${empty loginInfo }">
				<div class="check-login">
					<button type="button" class="btn join"
						onclick="location.href='${pageContext.request.contextPath}/join'">회원가입</button>
					<button type="button" class="btn login"
						onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
				</div>
			</c:when>
			<c:otherwise>
						
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
						</div>
					</div>
					<div class="wrap-search">
						<div>
							<p>그룹찾기</p>
						</div>
						<div>
							<div class="search" >
								<input type="text" placeholder="&nbsp;찾고싶은 스터디 그룹명을 검색 하세요.">
								<button type="button"  class="btn find"
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
								<button type="button" class="btn make">그룹 생성하러 가기</button>
							</div>
						</div>
					</div>
					<div class="wrap-openlist">
						<div class="tab-body">
							<p>전체그룹</p>
							<ul class="group-tab-nav">
								<li><a href="#tab01">전체</a></li>
								<li><a href="#tab02">추천 그룹</a></li>
							</ul>
							<div class="group-tab-content">
								<div id="tab01">
									<ul class="group-box">
										<li>
											<div class="box">
												<img class="img_g"
													src="http://via.placeholder.com/220X140.jpg/" alt="그룹 사진"
													onClick="location.href='TODO상세페이지로 변경하기'">
												<div class="tag">
													<p style="background-color: black;  padding: 3px;  font-size: var(--font5);">공개</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">그룹명
													</a> <a class="name-sub" style="font-size: var(--font5);">그룹
														설명입니다</a>
												</div>
											</div>
										</li>
										<li>
											<div class="box">
												<img class="img_g"
													src="http://via.placeholder.com/220X140.jpg/" alt="그룹 사진"
													onClick="location.href='TODO상세페이지로 변경하기'">
												<div class="tag">
													<p style="background-color: black;  padding: 3px;  font-size: var(--font5);">공개</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">그룹명
													</a> <a class="name-sub" style="font-size: var(--font5);">그룹
														설명입니다</a>
												</div>
											</div>
										</li>
										<li>
											<div class="box">
												<img class="img_g"
													src="http://via.placeholder.com/220X140.jpg/" alt="그룹 사진"
													onClick="location.href='TODO상세페이지로 변경하기'">
												<div class="tag">
													<p style="background-color: black;  padding: 3px;  font-size: var(--font5);">공개</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">그룹명
													</a> <a class="name-sub" style="font-size: var(--font5);">그룹
														설명입니다</a>
												</div>
											</div>
										</li>
										<li>
											<div class="box">
												<img class="img_g"
													src="http://via.placeholder.com/220X140.jpg/" alt="그룹 사진"
													onClick="location.href='TODO상세페이지로 변경하기'">
												<div class="tag">
													<p style="background-color: black;  padding: 3px;  font-size: var(--font5);">공개</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">그룹명
													</a> <a class="name-sub" style="font-size: var(--font5);">그룹
														설명입니다</a>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div id="tab02">
									<ul class="group-box">
										<li>
											<div class="box">
												<img class="img_g"
													src="http://via.placeholder.com/220X140.jpg/" alt="그룹 사진"
													onClick="location.href='TODO상세페이지로 변경하기'">
												<div class="tag">
													<p style="background-color: black;  padding: 3px;  font-size: var(--font5);">공개</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">그룹명
													</a> <a class="name-sub" style="font-size: var(--font5);">그룹
														설명입니다</a>
												</div>
											</div>
										</li>
										<li>
											<div class="box">
												<img class="img_g"
													src="http://via.placeholder.com/220X140.jpg/" alt="그룹 사진"
													onClick="location.href='TODO상세페이지로 변경하기'">
												<div class="tag">
													<p style="background-color: black;  padding: 3px;  font-size: var(--font5);">공개</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">그룹명
													</a> <a class="name-sub" style="font-size: var(--font5);">그룹
														설명입니다</a>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
		
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
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