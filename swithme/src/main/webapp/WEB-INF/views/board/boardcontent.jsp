<link href="<%=request.getContextPath()%>/resources/css/basic/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/core.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/layout.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/board/board.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/board/boardcontent.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
					when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
					electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
				</div>
				<div class="content">
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
					when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
					electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
					
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
					when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
					electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
					
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
					when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
					electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	
				</div>
			</div>
			
			<hr>
			
			<div class="board-reply">
				<div class="reply">
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
					when an unknown printer took a galley of type andscrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
					electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	
				
				</div>			
			</div>
		</div>
	</div>
	
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>