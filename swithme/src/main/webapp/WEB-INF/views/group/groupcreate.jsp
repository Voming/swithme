<!-- reset.css -->
<link
	href="${pageContext.request.contextPath}/resources/css/basic/reset.css"
	rel="stylesheet">
<!-- 레이아웃 설정 -->
<link
	href="${pageContext.request.contextPath}/resources/css/basic/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/basic/layout.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/basic/header.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/basic/footer.css"
	rel="stylesheet">
<!-- 그룹 만들기 레이아웃 -->
<link
	href="${pageContext.request.contextPath}/resources/css/group/groupcreate.css"
	rel="stylesheet">
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
<script>
$(loadedHandler);

function loadedHandler() {
	$(".btn.open").on("click", btnFileClickHandler);
}
function btnFileClickHandler(){
	if($(this).val() == "open"){
		$(".dpwd").hide();

	}else {
		$(".dpwd").show();
	}	
	var isOpen = $('input[type=radio]:checked').val();
	console.log(isOpen);
}

</script>
	<div class="wrapper">
		<div class="wrap-header">
			<header>
				<%@include file="/WEB-INF/views/basic/header.jsp"%>
				<div class="bn">
					<div class="nav2-wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
							<li><a class="active"
								href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a
								href="${pageContext.request.contextPath}/testcalendar">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr>
						[[${loginInfo}]]
				</div>
			</header>
		</div>
		<div class="wrap-body">
			<div class="wrap-create">
				<div class="gname">
					<P>그룹 만들기</P>
				</div>
				<div>
					<form class="frm-create">
						<ul>
							<li><p>그룹명</p></li>
							<li><input type="text" name="groupName" placeholder="그룹명을 입력하세요" /></li>
							<li><div class="wrap-open">
								<label>공개</label> 
								<input type="radio" name="chkopen" value="open" class="btn open" checked="checked">
								<label>비공개</label> 
								<input type="radio" name="chkopen" value="close" class="btn open">
								</div>
							</li>
								
							<li><div class="dpwd" style="display:none"><p>비밀번호</p></div></li>
							<li><div class="dpwd" style="display:none">
									<input type="text" name="groupPwd" placeholder="숫자로 된 비밀번호를 입력하세요" />
								 </div></li>
							<li><p>그룹 설명</p></li>
							<li><textarea rows="20" cols="77" placeholder="그룹 설명을 입력하세요(ex. 공부 목적, 규칙 등)"></textarea></li>
							<li><p>그룹 대표 이미지</p> </li>
							<li><input type="file" class="btnb" /></li>
							<li><div class="wbtn"><button type="submit" class="btnb">그룹 만들기</button></div></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		

		<div class="wrap-footer">
			<%@include file="/WEB-INF/views/basic/footer.jsp"%>
		</div>
</body>
</html>