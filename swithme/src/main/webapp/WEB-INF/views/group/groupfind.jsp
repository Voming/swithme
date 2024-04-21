<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/group/groupfind.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/groupfind_list.css" rel="stylesheet">
<meta charset="UTF-8">
<title>SWITH.ME</title>
</head>
<body>
	<script>
		$(loadedHandler);

		function loadedHandler() {
			$(".btn.find").on("click", btnFindClickHandler);
        }
		

		function btnFindClickHandler() {
			if ($("[name=find]").val().trim().length == 0) {
				alert("빈문자열만 입력할 수 없습니다. 검색할 그룹명을 작성해주세요.");
				return;
			}
			// 중요!
			var frm = document.getElementById("frm-find");
			
			frm.method = "post"; 
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
			<div class="wrap-search">
				<div>
					<p>그룹 찾기</p>
				</div>
				<div>
					<div class="search">
					<form id="frm-find">
						<div><input type="text"  name="find" placeholder="&nbsp;찾고싶은 스터디 그룹명을 검색 하세요." value="${findstr }"></div>
						<div><button type="button" class="btn find" 
							onclick="location.href='${pageContext.request.contextPath}/group/find'">
							<img class="search-btn"
								src="${pageContext.request.contextPath}/resources/images/find.png"
								alt="찾기">
						</button></div>
					</form>	
					</div>
				</div>
			</div>
			<div class="find-group">
				<ul class="group-box">
					<c:if test="${not empty findGrouplist }">
						<c:forEach items="${findGrouplist}" var="findDto">
							<li>
								<div class="box">
									<img class="img_g"
										src="${pageContext.request.contextPath }/files/${findDto.sgroupImgPath}"
										alt="그룹 사진"
										onclick="location.href='${pageContext.request.contextPath}/group/info?groupId=${findDto.sgroupId}'">
									<div class="tag">
										<p
											style="background-color: black; padding: 3px; font-size: var(- -font5);">
											<c:if test="${findDto.sgroupOpen == '0'}">공개</c:if>
											<c:if test="${findDto.sgroupOpen == '1'}">비공개</c:if>
										</p>
									</div>
									<div class="description">
										<div><a class="name"
											style="font-size: var(--font4); font-weight: bold;">${findDto.sgroupName}</a></div>
										<div><a class="name-sub" style="font-size: var(--font5);">${findDto.sgroupEx}</a></div>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>