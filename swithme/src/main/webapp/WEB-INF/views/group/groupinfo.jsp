<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="${pageContext.request.contextPath}/resources/css/group/groupinfo.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/group/groupmembers.css"
	rel="stylesheet">

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
			<div class="wrap-group">
				<div class="wrap-my">
					<c:if test="${not empty groupInfo }">
						<div class="txt-my">
							<div class="myGName">${groupInfo.sgroupName }</div>
							<div class="myGExp">${groupInfo.sgroupEx }</div>
							<!-- <p>활동중</p> -->
							<button type="button" 
								onclick="location.href='${pageContext.request.contextPath}/group/update?groupId=${groupInfo.sgroupId}'">그룹
								수정하기</button>
						</div>
						<div class="myGImg">
							<img
								src="${pageContext.request.contextPath }/files/${groupInfo.sgroupImgPath}"
								alt="그룹 이미지"/>
						</div>
					</c:if>
				</div>
			</div>
			<div class="group-mem">
				<p class="now">공부현황</p>
				<div class="group-box">
					<ul>
						<li class="mem-box"><img alt="기본 아이콘"
							src="${pageContext.request.contextPath}/resources/images/studyIcon.jpg">
							<p>스벅돌체라떼</p>
							<p>390분</p></li>
						<li class="mem-box"><img alt="기본 아이콘"
							src="${pageContext.request.contextPath}/resources/images/studyIcon.jpg">
							<p>스벅돌체라떼</p>
							<p>390분</p></li>
						<li class="mem-box"><img alt="기본 아이콘"
							src="${pageContext.request.contextPath}/resources/images/studyIcon.jpg">
							<p>스벅돌체라떼</p>
							<p>390분</p></li>
					</ul>
				</div>
				<hr style="margin: 50px 0; color: var(--color_gray_1);">
			</div>
			<div class="wrap-calc">
				<div class="wrap-calendar">
					<p class="ct">출석부</p>
					<table>
						<tr>
							<th width="25%">가입순</th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
							<td>일</td>
						</tr>
						<tr>
							<th>가입순</th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
							<td>일</td>
						</tr>
						<tr>
							<th>가입순</th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
							<td>일</td>
						</tr>
						<tr>
							<th>가입순</th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
							<td>일</td>
						</tr>
						<tr>
							<th>가입순</th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
							<td>일</td>
						</tr>
						
					</table>
				</div>
				<div class="wrap-rank">
					<p class="ct">그룹 내 랭킹</p>
					<ul>
						<li>
							<div class="rank-txt">
								<div class="rank"><p>1</p></div>
								<div><p>스벅돌체</p></div>
								<div class="mins"><p>300분</p></div>
							</div>
							<div class="wrap-bar">
							
							</div>
						</li>
						<li>
							<div class="rank-txt">
								<div class="rank"><p>1</p></div>
								<div><p>스벅돌체</p></div>
								<div class="mins"><p>300분</p></div>
							</div>
							<div class="wrap-bar">
							
							</div>
						</li>
						<li>
							<div class="rank-txt">
								<div class="rank"><p>1</p></div>
								<div><p>스벅돌체</p></div>
								<div class="mins"><p>300분</p></div>
							</div>
							<div class="wrap-bar">
							
							</div>
						</li>
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