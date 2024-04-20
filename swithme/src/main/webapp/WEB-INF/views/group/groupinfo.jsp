<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/group/groupinfo.css" rel="stylesheet">
<!-- jQuery 선언 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>SWITH.ME</title>
</head>
<body>
	<div class="wrapper">
		<div class="wrap-header">
			<header>
				<%@include file="/WEB-INF/views/basic/header.jsp"%>
				<div class="bn">
					<div class="nav2-wrap">
						<ul>
							<li><a class="active"
								href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
							<li><a href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a
								href="${pageContext.request.contextPath}/testcalendar">시험달력</a></li>
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
				<c:if test="${not empty groupInfo }">
					<div class="txt-my">
						<div class="myGName">${groupInfo.groupName }</div>
						<div class="myGExp">${groupInfo.groupEx }</div>
						<p>활동중</p>
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/group/update">그룹 수정하기</button>
					</div>
					<div class="myGImg">
						<img src="${pageContext.request.contextPath }/files/${groupInfo.groupImgPath}" alt="그룹 이미지">
					</div>
				</c:if>
				</div>
			</div>
			<div class="group-mem">
				<div>
					<p>공부현황</p>
				</div>
				<div >[[${groupSumList }]]
					<ul class="group-box">
					
						<%-- <c:if test="${not empty OpenGrouplist }">
							<c:forEach items="${OpenGrouplist}" var="groupDto">
								<li>
									<div class="box">
										<img class="img_g"
											src="${pageContext.request.contextPath }/files/${groupDto.groupImgPath}"
											alt="그룹 사진"
											onclick="location.href='${pageContext.request.contextPath}/group/info?groupId=${groupDto.groupId}'">
										<div class="tag">
											<p
												style="background-color: black; padding: 3px; font-size: var(- -font5);">
												<c:if test="${groupDto.groupOpen == '0'}">공개</c:if>
												<c:if test="${groupDto.groupOpen == '1'}">비공개</c:if>
											</p>
										</div>
										<div class="description">
											<a class="name"
												style="font-size: var(- -font4); font-weight: bold;">${groupDto.groupName}</a>
											<a class="name-sub" style="font-size: var(- -font5);">${groupDto.groupEx}</a>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if> --%>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>