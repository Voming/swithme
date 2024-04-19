<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
			<form id="frm-logout">
			<ul>
				<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
				<li><a onclick="return btnLogoutClickHandler();">로그아웃</a></li>
			</ul>
			</form>
		</div>
	</div>
</div>

<script>
function btnLogoutClickHandler(){
	alert("로그아웃되었습니다.");
	
	var frmlogout = document.getElementById("frm-logout");
	frmlogout.action = "${pageContext.request.contextPath}/logout";
	frmlogout.method = "post";
	frmlogout.submit();
}
</script>
