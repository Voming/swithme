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
					<c:choose>
						<c:when test="${empty replydtolist}">
							<div class="replynone">게시글이 존재하지 않습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${replydtolist}" var="replydto">
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
											<li class="replyreg" style="cursor: pointer;">삭제</li>
										</ul>
									</div>
								</div>
								<!-- list 값 하나씩 뽑아내기 위해서 foreach문 사용 -->
								<!-- setAttribute 값으로 값을 불러오려먼 el태그 써야함 -->
								<!-- getSession에서 setAttribute를 주니까 session에 등록하는거고
								이것은 서버가 연결되어 있는 한 모든 jsp에서 값 불러오기 가능 - 광역변수라 생각하자 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
								
					<div class="wrap-reply">
						<form class="frm-reply">
							<div class="r-1">
								<div>
									작성자
								</div>
							</div>
							<div class="r-2">
								<div>
									<textarea name="content" cols="146" rows="5" placeholder="내용을 입력하시오."></textarea>
								</div>
							</div>
							<div class="r-3">
								<ul>
									<li class="replyreg" style="cursor: pointer;">등록</li>
								</ul>
							</div>
						</form>
					</div>
				
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
	
	if($(".frm-reply [name=content]").val().trim().length == 0) {
		alert("등록하고 싶으면 입력해라");
		return;
	}

	
	$.ajax({
		url: "${pageContext.request.contextPath}/replywrite",
		method: "post",
		data: $(".frm-reply").serialize(),
		success: function(result){
			console.log(result);
			if(result == "-1") {
				alert("댓글 작성이 되지 않았습니다. 게시글 목록으로 이동 후 다시 작성해주세요.");
				location.href="${pageContext.request.contextPath}/board";
				return;
			}
			if(result == "0") {
				alert("댓글 등록에 실패하였습니다. 다시 시도해주세요.");
				return;
			}
			displayReplyWrap(result);
			
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
	
	} else {
		$(this).text("등록");
	}
	
	//	$(this).parent().next().show();
	/* this 를 기준으로 부모를 찾아서 보여지게 함 */
	$(this).parent().next().toggle();
	/* 한번 누르면 보이고 다시 누르면 사라짐 */
	
}

function displayReplyWrap(datalist){
	console.log("${dto.boardId }");
	var htmlVal = '';
	for(var idx in datalist){
		var replydto = datalist[idx];
		htmlVal += `
			<form class="frm-reply">
				<div class="r-1">
					<div>
						작성자
					</div>
				</div>
				<div class="r-2">
					<div>
						<textarea name="content" cols="146" rows="5" placeholder="내용을 입력하시오."></textarea>
					</div>
				</div>
				<div class="r-3">
					<ul>
						<li class="replyreg" style="cursor: pointer;">등록</li>
					</ul>
				</div>
			</form>
			
		`;
	}
	$(".wrap-reply").html(htmlVal);
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