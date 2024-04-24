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
							<div class="replynone">댓글이 존재하지 않습니다.</div>
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
											<li class="replyMore">댓글 달기</li>
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

<%-- 대댓글 창				
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
								<li class="replyreg2" style="cursor: pointer;">등록</li>
							</ul>
						</div>
					</form>	
					<input type="hidden" name="boardId" value="${dto.boardId }">
					<input type="hidden" name="replyId" value="\${replydto.replyId }">
					<input type="hidden" name="replyLevel" value="\${replydto.replyLevel }">
					<input type="hidden" name="replyStep" value="\${replydto.replyStep }">
					<input type="hidden" name="replyRef" value="\${replydto.replyRef }"> 			
				</div>
 --%>				
				<div class="wrap-reply">
					<form class="frm-reply">
						<div class="r-1">
							<div>
								${loginInfo.memId }
							</div>
						</div>
						<div class="r-2">
							<div>
								<textarea name="replyContent" cols="136" rows="5" placeholder="내용을 입력하시오."></textarea>
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
	/*댓글 달기  */
	$(".replyreg").on("click", boardReplyClickHandler);
	
	/* 대댓글창 띄우기 */
	$(".replyMore").each(function(index, element){
		/* replyMore - forEach로 인해 element 개수가 여러개인데 그중 하나의 그 element들 중 하나에 클릭이벤트 걸기*/
		/* forEach 를 걸면서 댓글이 달린 개수만큼 반복이 되서 이벤트 클릭했을때 그때그때 위치를 찾아줘야함 */
		$(element).click(ReplyMoreClickHandler);
		/* 그중 하나에 클릭이벤트 건게 이 친구!! */
	});
	
	/* 대댓글창 숨기기 */
	$(".replyesc").on("click", ReplyEscClickHandler);
	
	/* 대댓글 삭제 */
	$(".replydel").each(function(index, element){
		// 투두 ~~~ ReplyMoreClickHandler 처럼  ReplydelClickHandler 만들어주기
		//$(element).click(ReplydelClickHandler);
	});

	
	
	$(".btn.write").on("click", boardWriteClickHandler);
	$(".btn.board").on("click", boardClickHandler);
	

}

/* 댓글 등록하기 */
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
				/* 함수를 정의한 것이기 때문에 밑에서 값 넣어줘야함 */
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

/* 댓글 */
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
						<li class="replyMore">댓글 달기</li>
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
	/*  이렇게 하면 여기 출력되는 자리가 htmlVal로 인해 새롭게 overwrite 되면서 위에 걸려있던 대댓글창 띄우기 이벤트가 사라짐으로
 	   밑에 다시 걸어야함 */
		
 	   
	/* 대댓글창 띄우기 - 이벤트 등록 다시하기 */
	$(".replyMore").each(function(index, element){
		/* replyMore - forEach로 인해 element 개수가 여러개인데 그중 하나의 그 element들 중 하나에 클릭이벤트 걸기*/
		/* forEach 를 걸면서 댓글이 달린 개수만큼 반복이 되서 이벤트 클릭했을때 그때그때 위치를 찾아줘야함 */
		$(element).click(ReplyMoreClickHandler);
		/* 그중 하나에 클릭이벤트 건게 이 친구!! */
	});

}		


/* 대댓글 창 띄우기 */
function ReplyMoreClickHandler(){
 	
	var $nextEle = $(this).parents(".replyresult").next();
	/* parents(".replyresult") - 댓글창 */
	/* next - 댓글창의 다음 요소를 찾아달라라는 뜻으로 대댓글창이 밑에 있으니 대댓글 창을 찾아달라
			=> 객체 탐색은 요소를 찾아서 꺼내는 기능을 함 */
	if( $nextEle.hasClass("wrap-reply2")) {
		return;
		/*대댓글 창이 있으면 return 해서 이 밑으로 실행하지 않게 해줘 */
	}
	
	
	console.log(this);
 	
	var htmlVal = '';
	 	htmlVal += `
	 		<div class="wrap-reply2">
				<form class="frm-reply2">
					<div class="r-1">
						<div>
							작성자
						</div>
					</div>
					<div class="r-2">
						<div>
							<textarea name="content" cols="124" rows="5" placeholder="내용을 입력하시오."></textarea>
						</div>
					</div>
					<div class="r-3">
						<ul>
							<li class="replyesc" style="cursor: pointer;">취소</li>
							<li class="replyreg2" style="cursor: pointer;">등록</li>
						</ul>
					</div>
				</form>	
			</div>	
	`;
 
 	$(this).parents(".replyresult").after(htmlVal);
 	/*  이렇게 하면 여기 출력되는 자리가 htmlVal로 인해 새롭게 overwrite 되면서 위에 걸려있던 대댓글창이 사라지는
 		이벤트가 사라짐으로 밑에 다시 걸어야함 */
	/* after - 조작 개념이라서 어느 위치에 넣어달라는 의미 
	    => 조작 개념은 어느 위치에 넣고 빼고 추가하고 이런것들을 의미함*/
	
 		
	$(".replyesc").off("click");
 	$(".replyesc").on("click", ReplyEscClickHandler);
 	/* 대댓글 창에서 취소를 누르는 event를 먼저 off 시킨 다음 이벤트 다시 등록
 	   -> off 안시키면 on 해서 이벤트 걸었을때 대댓글창이 열린 개수만큼 취소에 걸리기 때문에
 	      off를 먼저 시켜줘야함
 	    ex. 대댓글창이 2개 열려있으면 취소를 2번 눌러야 대댓글창이 사라짐 */

 	
 	 /* this- 클릭한거
 		parents() 뒤에 next() 5개 쓰면 input 5개 뒤에 붙음*/
	/* 	$(".wrap-reply2").toggle(); - 누르면 나타나고 다시 누르면 사라짐 */

}

function ReplyEscClickHandler(){
	$(this).parents(".wrap-reply2").remove();
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