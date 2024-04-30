<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/resources/css/member/myboard.css" rel="stylesheet">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>나의 게시판</title>
</head>
<body>

[[${loginInfo }]]

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
			<div class="pgroup">
				<p class="p-first">자유 게시판</p>
				<p class="p-sec">자유롭게 소통해요~</p>
			</div>
			<div>
				<table>
					<colgroup>
						<col style="width: 3%;">
						<col style="width: 5%;">
						<col style="width: 30%;">
						<col style="width: 15%;">
						<col style="width: 15%;">
						<col style="width: 5%;" >
					</colgroup>
					<tr class="tr-first">
						<td style="text-align: center;"><input type="checkbox" id="allCheck"></td>
						<td style="text-align: center;">번호</td>
						<td style="text-align: center;">제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td style="text-align: center;">조회수</td>
					</tr>
					<c:choose>
						<c:when test="${empty mapboardlist.boardlistdto}">
	          				<tr>
	          					<td colspan="6" style="border-bottom: none; text-align:center;">
	          						게시글이 존재하지 않습니다.
	          					</td>
	          				</tr>
	          			
	          			</c:when>
						<c:otherwise>
							<tbody>
								<c:forEach items="${mapboardlist.boardlistdto}" var="dto">
									<tr class="tr-sec">
										<td style="text-align: center;"><input type="checkbox" class="item"></td>
										<td style="text-align: center;">${dto.boardId}</td>
										<td><a href="${pageContext.request.contextPath }/board/content?id=${dto.boardId }">${dto.title }</a></td>
										<!-- boardId 에 의해 해당 게시판 상세 페이지로 이동 -->
										<!-- url에 있는 parameter 값 가지고 와서 쓸 수 있기 때문에 여기 있는 id는
										BoardContentController에에서 쓰임 -->
										<td>${dto.boardWriter}</td>
										<td>${dto.writeTime}</td>
										<td style="text-align: center;">${dto.readCount}</td>
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
					<button type="button" class="btn delete">삭제</button>
				</div>
			</div>

			<div>
				<ul>
					<c:if test="${mapboardlist.startPageNum > 1}">
						<li><a href="${pageContext.request.contextPath }/mypage/myboard?page=${mapboardlist.startPageNum-1 }"></a></li>
						<!-- paging 처리 : form 태그 쓰지 않아도 controller로 값이 전달되고 전달된 값을 getParameter() 로 꺼내 쓰고 service로 보냄 -->
						<!-- ? 뒤에 page는 name이고 = 뒤가 value 라서 value 로 이동해줘 라는 뜻
								request.getParameter() 로 받음 -->
					</c:if>
					<c:forEach begin="${mapboardlist.startPageNum }"
						end="${mapboardlist.endPageNum }" var="page">
						<c:if test="${mapboardlist.currentPage == page }">
							<li class="page">
								${page }
							</li>
						</c:if>
						<c:if test="${mapboardlist.currentPage != page }">
							<li class="page">
								<a href="${pageContext.request.contextPath }/mypage/myboard?page=${page }">
									${page }
								</a>
							</li>
							<input type="hidden" class="pageHidden" value="${page }">
							<!-- hidden은 화면에 안보이는거라 관리자꺼긴한데 화면상에 육안으로 안보이지만 값은 존재함 -->
							<!-- 여기에 위에 있는 a 태그 안에 있는 el태그{page} 이 값을 불러오면서
									페이지 범위를 넓혀줘서 숫자를 누르지 않고 배경 눌러도 페이지 이동 가능-->
						</c:if>
					</c:forEach>
					<c:if
						test="${mapboardlist.endPageNum < mapboardlist.totalPageCount }">
						<li><a href="${pageContext.request.contextPath }/mypage/myboard?page=${mapboardlist.endPageNum+1 }"></a></li>
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
	$("li.page").on("click", pageChangeHandler);
	
	/* li태그에 Handler 걸어서 function 안에 a 태그 불러와서 css 색 바꿔주기 */
	$(".page").on("mouseenter", pageMouseEnterHandler);
 	$(".page").on("mouseleave", pageMouseLeaveHandler); 

	
	/* checkbox 전체 선택 */
 	$("#allCheck").on("click", allCheckHandler);
 	
 	/* checkbox 하나 눌렀을때  */
 	$(".item").on("click", itemCheckHandler); 
	
	/* 	$(".btn.delete").on("click", btnDeleteClickHandler); */
}

function pageChangeHandler(){
	location.href = "${pageContext.request.contextPath}/mypage/myboard?page="+$("input.pageHidden").val();
	/* ?는 쿼리, page는 name, 이 뒤에 오는게 value 이고 이것은 get방식 */
}



function allCheckHandler(){
    var checkall = $("#allCheck");
    var itemcheck = $(".item");
    if(checkall.is(":checked")){
        $(itemcheck).prop("checked",true);
    } else {
        $(itemcheck).prop("checked",false);
    }

}

function itemCheckHandler(){
	
 	var itemcheck = $(".item");

	if($(".item:checked").length < $(".item").length ) {
		$("#allCheck").prop("checked", false);	
	} else {
		$("#allCheck").prop("checked", true);	
	}
}


/*마우스 올렸을 때 색 변환 */
function pageMouseEnterHandler(){
	console.error($(this).text());
	$(this).children().css('color', 'white');
}

/*마우스 뗐을 때 다시 원래색 변환 */
function pageMouseLeaveHandler(){
	$(this).children().css('color', 'black');
}


</script>	
	
	
</body>
</html>