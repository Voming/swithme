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

<meta charset="UTF-8">
<title>SWITH.ME</title>
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
				autoplay: true,
				autoplayTimeout : 3000,
				autoplayHoverPause : true
			});
			
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
            
        	
			$(".btn.find").on("click", btnFindClickHandler);
        }
		

		function btnFindClickHandler() {
			if ($("[name=find]").val().trim().length == 0) {
				alert("빈문자열만 입력할 수 없습니다. 검색할 그룹명을 작성해주세요.");
				return;
			}
			// 중요!
			var frm = document.getElementById("frm-find");
			
			frm.method = "post"; // content 길이 길거라..
			frm.action = "${pageContext.request.contextPath}/group/find";
			frm.submit();
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
							<li><a class="active" href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
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
						 <c:if test="${not empty myGrouplist }"> 
							<c:forEach items="${myGrouplist}" var="groupDto">
								<div class="item">
									<figure>
										<button type="button"
											onclick="location.href='${pageContext.request.contextPath}/group/info?groupId=${groupDto.sgroupId}'">
											<img
												src="${pageContext.request.contextPath }/files/${groupDto.sgroupImgPath}">
										</button>
										<figcaption>${groupDto.sgroupName }</figcaption>
									</figure>
								</div>
							</c:forEach>
						</c:if> 
					</div>
				</div>
			</div>
			<div class="wrap-search">
				<div>
					<p>그룹찾기</p>
				</div>
				<div>
					<div class="search">
					<form id="frm-find">
						<input type="text"  name="find" placeholder="&nbsp;찾고 싶은 그룹 명을 입력하세요">
						<button type="button" class="btn find" 
							onclick="location.href='${pageContext.request.contextPath}/group/find'">
							<img class="search-btn"
								src="${pageContext.request.contextPath}/resources/images/find.png"
								alt="찾기">
						</button>
					</form>	
					</div>
				</div>
				<div class="move-make">
					<div>
						<p>원하는 그룹이 없다면?</p>
					</div>
					<div>
						<button type="button" class="btn make" onclick="location.href='${pageContext.request.contextPath}/group/create'">그룹 생성하러 가기</button>
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
								<c:if test="${not empty OpenGrouplist }"> 
									<c:forEach items="${OpenGrouplist}" var="groupDto">
										<li>
											<div class="box">
												<img class="img_g"
													src="${pageContext.request.contextPath }/files/${groupDto.sgroupImgPath}" alt="그룹 사진"
													onclick="location.href='${pageContext.request.contextPath}/group/info?groupId=${groupDto.sgroupId}'">
												<div class="tag">
													<p style="background-color: black; padding: 3px; font-size: var(--font5);">
														<c:if test="${groupDto.sgroupOpen == '0'}">공개</c:if>
														<c:if test="${groupDto.sgroupOpen == '1'}">비공개</c:if>
													</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">${groupDto.sgroupName}</a> 
													<a class="name-sub" style="font-size: var(--font5);">${groupDto.sgroupEx}</a>
												</div>
											</div>
										</li>
									</c:forEach>
								 </c:if> 
							</ul>
						</div>
						<div id="tab02">
							<ul class="group-box">
								<c:if test="${not empty RandGrouplist }"> 
									<c:forEach items="${RandGrouplist}" var="randDto">
										<li>
											<div class="box">
												<img class="img_g"
													src="${pageContext.request.contextPath }/files/${randDto.sgroupImgPath}" alt="그룹 사진"
													onclick="location.href='${pageContext.request.contextPath}/group/info?groupId=${randDto.sgroupId}'">
												<div class="tag">
													<p style="background-color: black; padding: 3px; font-size: var(--font5);">
														<c:if test="${randDto.sgroupOpen == '0'}">공개</c:if>
														<c:if test="${randDto.sgroupOpen == '1'}">비공개</c:if>
													</p>
												</div>
												<div class="description">
													<a class="name"
														style="font-size: var(--font4); font-weight: bold;">${randDto.sgroupName}</a> 
													<a class="name-sub" style="font-size: var(--font5);">${randDto.sgroupEx}</a>
												</div>
											</div>
										</li>
									</c:forEach>
								 </c:if> 
							</ul>
						</div>
					</div>
				</div>
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