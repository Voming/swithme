<!-- reset.css -->
<link href="${pageContext.request.contextPath}/resources/css/basic/reset.css" rel="stylesheet">
<!-- 레이아웃 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/basic/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/layout.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/basic/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/member/login.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>login</title>
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
		</div>
		<div class="wrap-body">
			<div class="wrap-login">
			<fieldset>
				<form id="login-form"  action="${pageContext.request.contextPath }/login" method="post">
					<div>
						<input type="text" name="id" placeholder="아이디">
					</div>
					<div>
						<input type="password" name="pwd" placeholder="비밀번호">
					</div>
					<div>
						<button type="button" class="btn submit" >로그인</button>
					</div>
					<div class="join-btn">
					<a href="${pageContext.request.contextPath}/join">회원가입하기</a>
					</div>
				</form>
			</fieldset>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>



	<script>
	$(loadedHandler);
	function loadedHandler() {
		$("#login-form .btn.submit").on("click", frmClickHandler);
	}

	function frmClickHandler() {
		console.log("클릭");
		console.log($("#login-form").serialize());
		console.log($("[name=id]").val());
		console.log($("[name=pwd]").val());
		$.ajax({
					url : "${pageContext.request.contextPath}/login",
					method : "post",
					data :
					{
						id : $("#login-form [name=id]").val(),
						pwd : $("#login-form [name=pwd]").val()
					},
					success : function(result) {
						console.log(result);
						if (result == 1) {
							alert("반갑습니다");
							var prePage = "${prePage}";
							if (prePage == "myrecord") {
								location.href = "${pageContext.request.contextPath}/myrecord";
							}
							location.href = "${pageContext.request.contextPath}/myrecord";
						} else {
							alert("아이디 비밀번호 일치하지 않음");
							$("[name=pwd]").val("");
						}
					},
					error : function(request, status, error) {
						alert("code: " + request.status + "\n"
								+ "message: " + request.responseText + "\n"
								+ "error: " + error);
					}
				});
	}

	
	
	</script>
	
	

</body>
</html>