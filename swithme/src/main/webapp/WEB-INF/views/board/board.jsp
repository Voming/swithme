<link href="<%=request.getContextPath()%>/resources/css/basic/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/core.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/layout.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/board/board.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="https://noonnu.cc/font_page/1359" rel="stylesheet" type="text/css">
<link href="https://noonnu.cc/font_page/686" rel="stylesheet" type="text/css">
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
							<li><a class="active" href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
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
           <h2>자유 게시판</h2>
          
        </div>
    </div>

    <div class="wrap-footer">
        <%@include file="/WEB-INF/views/basic/footer.jsp"%>
    </div>
</body>

</html>