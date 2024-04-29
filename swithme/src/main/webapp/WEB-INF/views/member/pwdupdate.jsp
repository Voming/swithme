<!-- reset.css -->
<link href="${pageContext.request.contextPath}/resources/css/basic/reset.css" rel="stylesheet">
<!-- 레이아웃 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/basic/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/layout.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/basic/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/member/pwdupdate.css" rel="stylesheet">


<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="wrap-update">
			<form id="update-form">
			<div>
			<p>기존 비밀번호</p>
			<input>
			</div>
			
			<div>
			<p>변경 비밀번호</p>
			<input type="password" name="pwd" id="pwd" required>
			</div>
			<div>
			<p>변경 비밀번호 확인</p>
			<input type="password" name="pwdr" id="pwdr" required>
			<span class="desc-pwdr"></span>
			</div>
			<div>
			<button class="btn update" id="update"><p>변경완료</p></button>
			</div>
			</form>
			
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>


<script>
$("input").keyup(function(){
	var pwd1=$("[name=pwd]").val().trim();
	var pwd2=$("[name=pwdr]").val().trim();
	if(pwd1 != "" || pwd2 != ""){
		if(pwd1 == pwd2) {
			$(".desc-pwdr").html("일치").css('color', 'green');
		} else{
			$(".desc-pwdr").html("불일치").css('color', 'red');
		}
	}
});
	
</script>
</body>
</html>