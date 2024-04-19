<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/resources/css/board/boardcontent.css" rel="stylesheet">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>게시판 상세</title>
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
			<div class="pgroup">
				<p class="p-first">자유 게시판</p>
			</div>
			
			<div class="content-main">
				<div class="title">
					<div class="t-1">
						<div>${dto.title }</div>
					</div>
					<div class="t-2">
						<ul>
							<li>${dto.boardWriter }</li>
							<li>${dto.writeTime }</li>
							<li>
								<p>${dto.boardLike }<p>
							</li>
						</ul>
					</div>
				</div>
				<div class="content">
					${dto.content}
				</div>
			</div>
			
			<hr>
			
			<div class="board-reply">
				<p>댓글</p>
				<div class="reply">
					<div class="r-1">
						<div>
							<input type="text" placeholder="제목을 입력하세요.">					
						</div>
						<div>
							<textarea name="content" cols="136" rows="5" placeholder="내용을 입력하시오."></textarea>
						</div>
						</div>
					<div class="r-2">
						<ul>
							<li>작성자</li>
							<li>날짜</li>
							<li>
								<p>등록/삭제<p>
							</li>
						</ul>
					</div>
				</div>			
				<div class="btn">
					<button type="button" class="btn write">글쓰기</button>
					<button type="button" class="btn board">목록</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>



<script>
$(loadedHandler);

function loadedHandler(){
	$(".btn.write").on("click", boardWriteClickHandler);
	$(".btn.board").on("click", boardClickHandler);	
}

function boardWriteClickHandler(){
	location.href = "${pageContext.request.contextPath}/boardwrite";
}

function boardClickHandler(){
	location.href = "${pageContext.request.contextPath}/board";
}

</script>


</body>
</html>