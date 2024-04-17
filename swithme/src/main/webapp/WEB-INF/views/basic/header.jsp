<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="tn">
	<!-- 최상단 네비(로고 및 회원가입, 로그인) -->
	<div class="nav1-wrap">
		<div class="logo-side">
			<a href="#"> <img
				src="${pageContext.request.contextPath}/resources/images/logo.jpg"
				alt="로고">
			</a>
		</div>
		<div class="log">
			<ul>
				<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
		</div>
	</div>
</div>
