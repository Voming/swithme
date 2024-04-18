<link href="<%=request.getContextPath()%>/resources/css/basic/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/core.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/layout.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/basic/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/board/board.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
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
							<li><a class="active"
								href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
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
			<div class="pgroup">
				<p class="p-first">자유 게시판</p>
				<p class="p-sec">자유롭게 소통해요~</p>
			</div>
			<div>
				<table>
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 50%;">
						<col style="width: 10%;">
						<col style="width: 20%;">
						<col style="width: 5%;">
					</colgroup>
					<tr class="tr-first">
						<td style="text-align: center;">번호</td>
						<td style="text-align: center;">제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					<c:choose>
						<c:when test="${empty mapboardlist.boardlistdto}">
	          				<tr>
	          					<td colspan="5">
	          						게시글이 존재하지 않습니다.
	          					</td>
	          				</tr>
	          			
	          		</c:when>
						<c:otherwise>
							<tbody>
								<c:forEach items="${mapboardlist.boardlistdto}" var="dto">
									<tr class="tr-sec">
										<td style="text-align: center;">${dto.boardId}</td>
										<td>${dto.title}</td>
										<td>${dto.writeTime}</td>
										<td>${dto.boardWriter}</td>
										<td>${dto.readCount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:otherwise>
					</c:choose>
<!-- 					<tr>
						<td colspan="5">
							<div class="btn">
								<button type="button" class="btn write">글작성</button>
							</div>
						</td>
					</tr> -->
				</table>
				<div class="btn">
					<button type="button" class="btn write">글작성</button>
				</div>
			</div>


			<div>
				<ul>
					<c:if test="${mapboardlist.startPageNum > 1}">
						<li><a
							href="${pageContext.request.contextPath }/board?page=${mapboardlist.startPageNum-1 }">
								&lt;&lt; </a></li>
						<!-- paging 처리 : form 태그 쓰지 않아도 controller로 값이 전달되고 
							 전달된 값을 getParameter() 로 꺼내 쓰고 service로 보냄 -->
					</c:if>
					<c:forEach begin="${mapboardlist.startPageNum }"
						end="${mapboardlist.endPageNum }" var="page">
						<c:if test="${mapboardlist.currentPage == page }">
							<li><strong>${page }</strong></li>
						</c:if>
						<c:if test="${mapboardlist.currentPage != page }">
							<li><a
								href="${pageContext.request.contextPath }/board?page=${page }">${page }</a></li>
						</c:if>
					</c:forEach>
					<c:if
						test="${mapboardlist.endPageNum < mapboardlist.totalPageCount }">
						<li><a
							href="${pageContext.request.contextPath }/board?page=${mapboardlist.endPageNum+1 }">
								&gt;&gt; </a></li>
					</c:if>
				</ul>
			</div>

		</div>
	</div>

	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

	
<script>
$(loadedHandler);
function loadedHandler() {
	$(".btn.write").on("click", btnWriteClickHandler);

}

function btnWriteClickHandler() {
	location.href = "${pageContext.request.contextPath}/boardwrite";

}
</script>

</body>

</html>