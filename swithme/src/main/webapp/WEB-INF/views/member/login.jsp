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
			<div class="wrap-login">
			<fieldset>
				<form id="login-form"  action="${pageContext.request.contextPath }/login" method="post">
					<div>
						<input type="text" name="id"  id="id" placeholder="아이디">
						<span class="desc-id"></span>
					</div>
					<div>
						<input type="password" name="pwd" id="pwd" placeholder="비밀번호">
						<span class="desc-pwd"></span>
					</div>
					<div>
						<button type="button" class="btn submit" id="loginbtn">로그인</button>
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
							} else if(prePage == "group"){
								location.href = "${pageContext.request.contextPath}/group";
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
	
	<script>
	$("[name=id]").on("blur", function(){
		var strleng=$(this).val().trim().length;
		var id=$(this).val().trim();
		var msg='';
		if(strleng<1){
			msg='아이디를 입력해주세요'
		}else{
			msg='';
		}
		$(".desc-id").html(msg);
	});

	$("[name=pwd]").on("blur", function(){
		var strleng=$(this).val().trim().length;
		var id=$(this).val().trim();
		var msg='';
		if(strleng<1){
			msg='비밀번호를 입력해주세요'
		}else{
			msg='';
		}
		$(".desc-pwd").html(msg);
	});
	
</script>

<script>
const inputid = document.getElementById('id');
const inputpwd = document.getElementById('pwd');

function btnColorHandler(){
	$(".btn.submit").css('background','#BF80FF');
} 

function btnGreyHandler(){
	$("#loginbtn").css('background','#DDCCFF');
}

function onInput() {
    const id = inputid.value;
    const pwd = inputpwd.value;

if ((id.length&& pwd.length) > 0) {
    // 버튼을 활성화 하는 로식
    console.log(" 활성화");
	
	$(btnColorHandler);
} else {
    // 버튼을 비활성화 하는 로직
    console.log("비활성화");
	$(btnGreyHandler);
	}
}

loginbtn.addEventListener('input', () => {
 
})


//ID Event
inputid.addEventListener('input', onInput);

//PWD Event
inputpwd.addEventListener('input', onInput);

</script>
	

</body>
</html>