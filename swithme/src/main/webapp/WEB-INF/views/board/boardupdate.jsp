<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/board/boardupdate.css" rel="stylesheet">
<title>게시글 수정</title>
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
							<li><a
								href="${pageContext.request.contextPath}/test">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr>
				</div>
			</header>
		</div>

		<div class="wrap-body">
			<div class="boardupdate">
				<p>게시글 수정</p>
			</div>
			<form id="frm-update">
				<div class="update-1">
					<div>
						<p>제목</p>
					</div>
					<div>
						<textarea name="title" required>${dto.title }</textarea>
					</div>
				</div>
				<div class="update-2">
					<div class="txt-content">
						<p>내용</p>
					</div>
					<div class="update-content">
						<textarea name="content" required>${dto.content }</textarea>
					</div>
				</div>
					<div class="wrap-btn">
						<div class="btn">
							<button type="button" class="btn update">수정</button>
							<button type="button" class="btn board" onClick="location.href='${pageContext.request.contextPath}/board'">목록</button>
							<input type="hidden" name="boardId" value="${dto.boardId }">
						</div>
					</div>
			</form>
		</div>
	</div>
	
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>


<script>
$(loadedHandler);

function loadedHandler(){
 	$(".btn.update").on("click", btnUpdateClickHandler);
 	
 	console.log('${loginInfo.memId}');
 	console.log('${param.id}');

}

function btnUpdateClickHandler(){
	
	if($("[name=title]").val().trim().length == 0) {
		alert("빈 제목 안됨. 제목 채워라");
		return;
	}
	// return 쓰면 여기서 단계가 끊김.
	
	if($("[name=content]").val().trim().length == 0) {
		alert("빈 내용 안됨. 내용 채워라");
		return;
	}
	
	var frm = document.getElementById("frm-update");
	frm.method="post";
	frm.action="${pageContext.request.contextPath}/board/update";
	frm.submit();

}


</script>

</body>
</html>