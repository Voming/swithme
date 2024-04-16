<!-- reset.css -->
<link href="${pageContext.request.contextPath}/resources/css/basic/reset.css" rel="stylesheet">
<!-- 레이아웃 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/basic/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/layout.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/basic/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/footer.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>login</title>

<style>
.wrap-body{
    padding: 0;
    margin: 0;
    border: none;
    display: flex;
}

.wrap-login{
    display: block;
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
}

#login-form{
    width: 300px;
    border: 0;
}
	
#login-form input{
    width: 100%;
    height: 50px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 10px;
    background-color: #F8F8F8;
}

.btn.submit{
	width: 100%;
    height: 50px;
    padding: 0 10px;
    box-sizing: border-box;
    border-radius: 10px;
}


</style>
</head>
<body>
	<div class="wrapper">
		<div class="wrap-header">
			<%@include file="/WEB-INF/views/basic/header.jsp"%>
		</div>
		<div class="wrap-body">
			<div class="wrap-login">
			<fieldset>
				<form id="login-form">
					<div>
						<label>아이디</label><input type="text" name="id">
					</div>
					<div>
						<label>비밀번호</label><input type="password" name="pwd">
					</div>
					<div>
						<button type="button" class="btn submit" >로그인</button>
					</div>
				</form>
			</fieldset>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>