<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/board/boardwrite.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="boardwrite">
				<p>게시글 작성</p>
			</div>
			<form id="form-write">
				<ul class="write">
					<li>
						<div>
							<p>제목</p>
						</div>
						<div>
							<input type="text" name="title" placeholder="제목을 입력하시오." required>
						</div>
					</li>
					<li>
						<div class="txt-content">
							<p>내용</p>
						</div>
						<div class="ta-content">
							<textarea name="content"
								placeholder="내용을 입력하시오." required></textarea>
						</div>
					</li>
					<li class="wrap-btn">
						<div class="btn">
							<div>
								<button type="button" class="btn write">등록</button>
							</div>
							<div>
								<button type="button" class="btn esc">취소</button>
							</div>
							<div>
								<button type="button" class="btn board" onClick="location.href='${pageContext.request.contextPath}/board'">목록</button>
							</div>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>

	<div class="wrap-footer">
      <%@include file="/WEB-INF/views/basic/footer.jsp"%>

    </div>
    
    
<script>

$(loadedHandler);

function loadedHandler(){
	$(".btn.write").on("click", btnWriteClickHandler);
/* 	$(".btn.esc").on("click", btnEscClickHandler); */
}

function btnWriteClickHandler(){
	
	if($("[name=title]").val().trim().length == 0) {
		alert("빈 제목 안됨. 제목 채워라");
		return;
	}
	// return 쓰면 여기서 단계가 끊김.
	
	if($("[name=content]").val().trim().length == 0) {
		alert("빈 내용 안됨. 내용 채워라");
		return;
	}
	
	var frm = document.getElementById("form-write");
	frm.method="post";
	frm.action="${pageContext.request.contextPath}/board/write";
	frm.submit();
}


</script>   
    
</body>
</html>