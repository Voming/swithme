<!-- reset.css -->
<link href="${pageContext.request.contextPath}/resources/css/basic/reset.css" rel="stylesheet">
<!-- 레이아웃 설정 -->
<link href="${pageContext.request.contextPath}/resources/css/basic/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/layout.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/basic/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/basic/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/member/join.css" rel="stylesheet">

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
			<div class="wrap-join">
				<form action="${pageContext.request.contextPath }/join" method="post">
					<div>
						<label>아이디</label><input type="text" name="id"  id="id" required>
						<button type="button" class="btn check">중복확인</button>
					</div>
					<div>
						<label>이메일</label><input type="email" name="email"  id="email" required>
						<button type="button" class="btn code">인증코드</button>
					</div>
					<div>
						<label>이메일 확인</label><input type="text" name="emailr" id="emailr" placeholder="인증코드" required>
					</div>
					<div>
						<label>비밀번호</label><input type="password" name="pwd" id="pwd" placeholder="영문자와 숫자로만 입력하세요" required>
						<span class="desc-pwd"></span>
					</div>
					<div>
						<label>비밀번호 확인</label><input type="password" name="pwdr" id="pwdr"  required>
						<span class="desc-pwdr"></span>
					</div>
					<div>
					<input type="checkbox" required> <label>(필수) 약관에 동의합니까</label>
					</div>
					<div>
						<button type="submit" class="btn join" id="btnjoin"> 회원가입</button> 
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	

<script>
$(loadedHandler);

function loadedHandler(){
	$(".btn.check").on("click", btnCheckClickHandler);
}

function btnCheckClickHandler(){
	var idVal = $("[name=id]").val().trim();
	console.log($("[name=id]").val());

	$.ajax({  
		url : "${pageContext.request.contextPath }/checkid"
		,method : "post"
		,data : { id:idVal }
		,success : function(result){
			console.log(result);
			if(result > 0){
				alert("아이디가 중복됩니다. 다른 아이디를 입력해주세요.");
			}if($("[name=id]").val().trim().length<1){
				alert('아이디를 입력해주세요.');
			}else {
				alert("사용가능");
			}	
		}
		,error : function(request, status, error){
			alert("code: "+request.status + "\n" + "message: " 
					+ request.responseText + "\n"
					+ "error: "+error);
		}
	});
}

 $("[name=pwd]").on("blur", function(){
	var pwdLength = $("[name=pwd]").val().trim().length;
	if(pwdLength < 1  ) {
		$(".desc-pwd").html("비밀번호를 입력하세요").css('color', 'red');
	}else{
		$(".desc-pwd").html("")
	}
});
 
 

</script>
	
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