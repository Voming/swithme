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
<!-- 그룹 만들기 레이아웃 -->
<link
	href="${pageContext.request.contextPath}/resources/css/group/groupcreate.css"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
							<li><a class="active"
								href="${pageContext.request.contextPath}/group">그룹</a></li>
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
			<div class="wrap-create">
				<form class="frm-create">
					<fieldset>
						<legend>그룹 만들기</legend>
						<ul>
							<li><p>그룹명</p></li>
							<li><input type="text" name="groupName" value="그룹명을 입력하세요" /></li>
							<li><label>공개</label> <input type="radio" name="chk_open"
								value="open"> <label>비공개</label> <input type="radio"
								name="chk_close" value="close"></li>
							<li><p>비밀번호</p></li>
							<li><input type="text" name="groupPwd"
								value="숫자로 된 비밀번호를 입력하세요" /></li>
							<li><p>그룹 설명</p></li>
							<li><textarea rows="20" cols="80"></textarea></li>
							<li><p>그룹 대표 이미지</p> <input type="file" /></li>
							<li><button type="submit">제출하기</button></li>
						</ul>
					</fieldset>
				</form>
			</div>
		</div>

		<div class="wrap-footer">
			<%@include file="/WEB-INF/views/basic/footer.jsp"%>
		</div>
</body>
</html>