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
<!-- 로그인정보 들어오는지 확인 -->
[[로그인 정보: ${loginInfo}]]

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
				<div class="warp-reply-list">
				<!-- 댓글 이미 등록된것들의 댓글창과 아무것도 안써있는 댓글창과 분리시켜야 
					밑에서 ajax로 결과 가지고 왔을때 버튼이나 이런것들 숨지 않고 나타남  -->
					<c:choose>
						<c:when test="${empty replydtolist}">
							<div class="replynone">게시글이 존재하지 않습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${replydtolist}" var="replydto">
							<!-- boardcontentcontroller에 있는 setAttribute값 -->
								<div class="replyresult">
									<div class="r-write">
										<div>
											${replydto.replyWriterid}
										</div>
									</div>
									<div class="r-content">
										<div>
											${replydto.replyContent}
										</div>
									</div>
									<div class="r-wrap">
										<ul>
											<li>${replydto.replyWritetime}</li>
											<li>댓글 달기</li>
											<li class="replydel" style="cursor: pointer;">삭제</li>
										</ul>
									</div>
								</div>
								<input type="hidden" name="boardId" value="${dto.boardId }">
								<input type="hidden" name="replyId" value="\${replydto.replyId }">
								<input type="hidden" name="replyLevel" value="\${replydto.replyLevel }">
								<input type="hidden" name="replyStep" value="\${replydto.replyStep }">
								<input type="hidden" name="replyRef" value="\${replydto.replyRef }">
								<!-- list 값 하나씩 뽑아내기 위해서 foreach문 사용 -->
								<!-- setAttribute 값으로 값을 불러오려먼 el태그 써야함 -->
								<!-- getSession에서 setAttribute를 주니까 session에 등록하는거고
								이것은 서버가 연결되어 있는 한 모든 jsp에서 값 불러오기 가능 - 광역변수라 생각하자 -->
							</c:forEach> 
						</c:otherwise>
					</c:choose>
				</div>
				<div class="wrap-reply">
					<form class="frm-reply">
						<div class="r-1">
							<div>
								${loginInfo.memId }
							</div>
						</div>
						<div class="r-2">
							<div>
								<textarea name="replyContent" cols="146" rows="5" placeholder="내용을 입력하시오."></textarea>
							</div>
						</div>
						<div class="r-3">
							<ul>
								<li></li>
								<li></li>
								<li class="replyreg" style="cursor: pointer;">등록</li>
							</ul>
						</div>
						<input type="hidden" name="boardId" value="${dto.boardId }">
						<!-- boardId 가지고 와야 그 해당 Id에 댓글 달림-->
					</form>
				</div>
				
<!--
				<div class="wrap-reply2">
					<form class="frm-reply2">
						<div class="r-1">
							<div>
								작성자
							</div>
						</div>
						<div class="r-2">
							<div>
								<textarea name="content" cols="132" rows="5" placeholder="내용을 입력하시오."></textarea>
							</div>
						</div>
						<div class="r-3">
							<ul>
								<li class="replyreg" style="cursor: pointer;">등록</li>
							</ul>
						</div>
					</form>	
				</div>	 
-->		
				<div class="btn">
					<button type="button" class="btn write">글쓰기</button>
					<button type="button" class="btn rewrite">수정</button>
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
	$(".replyreg").on("click", boardReplyClickHandler);
	$(".btn.write").on("click", boardWriteClickHandler);
	$(".btn.board").on("click", boardClickHandler);
	

}

function boardReplyClickHandler(){
	
	if($(".frm-reply [name=replyContent]").val().trim().length == 0) {
		alert("등록하고 싶으면 입력해라");
		return;
	}

	
	$.ajax({
		url: "${pageContext.request.contextPath}/board/reply/write",
		method: "post",
		data: $(".frm-reply").serialize(),
		dataType: 'json',
		success: function(result){
			console.log(result);
			if(result == null) {
				alert("오류났어요~");
				
			} else {
				displayReplyWrap(result);
			}
		},
		error: function(request, status, error){
			//controller에서 전달해준 값 여기서 호출
			alert("code: "+request.status + "\n" + "message: " 
					+ request.responseText + "\n"
					+ "error: "+error);
		}
		
	});
	
	if($(this).text() == "등록") {		
		$(this).text("삭제");		
		return;
	} else {
		$(this).text("등록");
	}

	
}

function displayReplyWrap(datalist){
	console.log("${dto.boardId }");

	var htmlVal = '';
	for(var idx in datalist){
		var replydto = datalist[idx];
	
		htmlVal += `
			<div class="replyresult">
				<div class="r-write">
					<div>
						\${replydto.replyWriterid}
					</div>
				</div>
				<div class="r-content">
					<div>
						\${replydto.replyContent}
					</div>
				</div>
				<div class="r-wrap">
					<ul>
						<li>\${replydto.replyWritetime}</li>
						<li>댓글 달기</li>
						<li class="replydel" style="cursor: pointer;">삭제</li>
					</ul>
				</div>
			</div>
			<input type="hidden" name="boardId" value="${dto.boardId }">
			<input type="hidden" name="replyId" value="\${replydto.replyId }">
			<input type="hidden" name="replyLevel" value="\${replydto.replyLevel }">
			<input type="hidden" name="replyStep" value="\${replydto.replyStep }">
			<input type="hidden" name="replyRef" value="\${replydto.replyRef }">
		`;
		
	}
	$(".warp-reply-list").html(htmlVal);
	// html(새로운내용으로덮어쓰면기존event등록이사라짐)
	// event 다시 등록

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