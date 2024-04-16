<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<div class="tn">
		<!-- 최상단 네비(로고 및 회원가입, 로그인) -->
		<div class="nav1-wrap">
			<div class="logo-side">
				<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="로고">
				</a>
			</div>
			<div class="log">
				<ul>
					<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="bn">
		<div class="nav2-wrap">
			<ul>
				<li><a href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
				<li><a class="active" href="${pageContext.request.contextPath}/group">그룹</a></li>
				<li><a href="#">랭킹</a></li>
				<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
				<li><a href="#">시험달력</a></li>
			</ul>
		</div>
	</div>
	<div class="hrline">
		<hr>
	</div>

</header>