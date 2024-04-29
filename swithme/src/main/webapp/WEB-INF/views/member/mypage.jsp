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
							<li><a href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a href="${pageContext.request.contextPath}/test">시험달력</a></li>
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
					<div class="id">
						아이디
						<span class="memid">${loginInfo.memId}</span>
					</div>
					<div class="pwd">
					비밀번호 <span class="mempwd">${loginInfo.memPwd}</span>
					<a href="${pageContext.request.contextPath}/update">수정하기</a>	
					</div>
					<div>
						<span>각오</span>
						<input type="text" name="fight">
					</div>
					<div>
						<button type="button" class="btn change" id="change"><p>수정완료</p></button>
					</div>
					
					<div class="myboard">
						<a href="${pageContext.request.contextPath}/mypage/myboard">내가 쓴 게시글</a>
					</div>
					<span> 
						<button class="btn logout" id="logout"><p>로그아웃</p></button>
					</span>
					<span> 
						<button class="btn out" id="out" onclick="return btnOutClickHandler();"><p>탈퇴하기</p></button>
					</span>
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
	//$(".btn.out").on("click",btnOutClickHandler);
}


function btnLogoutClickHandler(){

	alert("로그아웃되었습니다.");
	
	var logout = document.getElementById("login-form");
	logout.action = "${pageContext.request.contextPath}/logout";
	logout.method = "post";
	logout.submit();
	
	
}

function btnOutClickHandler(){

	alert("탈퇴되었습니다.");
	
	var out = document.getElementById("login-form");
	out.action = "${pageContext.request.contextPath}/out";
	out.method = "post";
	out.submit();
	
	
}

</script>

</body>
</html>