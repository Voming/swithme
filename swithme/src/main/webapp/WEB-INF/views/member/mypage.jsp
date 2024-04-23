<!-- reset.css -->
<link href="${pageContext.request.contextPath}/resources/css/basic/reset.css" rel="stylesheet">
<!-- 레이아웃 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/basic/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/layout.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/basic/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/member/mypage.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SWITH.ME</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
							<li><a  href="${pageContext.request.contextPath}/group">그룹</a></li>
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
			<div class="wrap-mypage">
				<form id="login-form"  action="${pageContext.request.contextPath}/login" method="post">
					<div>
						아이디
						<input type="text" name="id">
					</div>
					<div>
						비밀번호
						<input type="password" name="pwd" >
					</div>
					<div>
						<legend>각오</legend>
						<input type="text" name="fight">
					</div>
					<div>
						<button type="button" class="btn change" id="change">수정완료</button>
					</div>
					<div> 
						<button class="btn logout" id="logout">로그아웃</button>
					</div>
					<div class="myboard">
					<a href="${pageContext.request.contextPath}/myboard">내가 쓴 게시글</a>
					</div>
					<div> 
						<button class="btn out">탈퇴하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>


<script>
$(loadHandler);
function loadHandler() {
	$(".btn.logout").on("click",btnLogoutClickHandler);
}


function btnLogoutClickHandler(){

	alert("로그아웃되었습니다.");
	
	var logout = document.getElementById("login-form");
	logout.action = "${pageContext.request.contextPath}/logout";
	logout.method = "post";
	logout.submit();
	
	
}

</script>

</body>
</html>