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
			
			<div class="main-content">
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
					<c:when test="${empty replyList.replydto}">
						<div class="empty">댓글이 없습니다.</div>
					</c:when>
					<c:when test="${not empty replyList.replydto }">
						<div class="replylist">
							<!-- 여기에 ajax를 통해 댓글, 대댓글 들어옴 (반복문 돌림) -->
						</div>
					</c:when>
				</c:choose>


				<div class="reply">
					<form class="frm-reply">
						<div class="r-1">
							<div>
								${loginInfo.memId }
							</div>
						</div>
						<div class="r-2">
							<div>
								<textarea name="replyContent" cols="144" rows="5" placeholder="내용을 입력하시오."></textarea>
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
			</div>
			
			<div class="btn">
				<button type="button" class="btn write">글쓰기</button>
			<c:if test="${dto.boardWriter == loginInfo.memId}">
				<button type="button" class="btn update">수정</button>
			</c:if>
				<button type="button" class="btn board">목록</button>
			</div>
		</div>
	</div>
	
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>



<script>
$(loadedHandler);

function loadedHandler(){
	/* 댓글, 대댓글 정보 읽어오기 */
	/* ajax는 함수 내에서 실행되며 event를 실행할 때 ajax로 실행할거야~ 라는 것 */
	$.ajax({
		url: "${pageContext.request.contextPath}/board/reply/content",
		method: "post",
		data: { id : ${param.id} },
		/* url 부분의 query string - param 객체에서 id값 불러오기
				ex. board/content?id=62*/
		dataType: 'json',
		success: function(result){
			console.log(result);
			if(result == null) {
				console.log("!!!!!댓글 없어요!!!!");
			} 
			displayReplyWrap(result);
		},
		error: ajaxErrorHandler		
	});
	
	
	
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
	$(".replydel").on("click", ReplydelClickHandler)
	
	$(".btn.write").on("click", boardWriteClickHandler);
 	$(".btn.update").on("click", boardUpdateClickHandler);
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
		error: ajaxErrorHandler	
	});
	
	if($(this).text() == "등록") {		
		$(this).text("삭제");		
		return;
	} else {
		$(this).text("등록");
	}

	
}

/* 댓글, 대댓글 데이터 출력하는 함수*/
function displayReplyWrap(datalist){
	console.log("${dto.boardId }");

	var htmlVal = '';
	for(var idx in datalist){
		var replydto = datalist[idx];
		
		/* 댓글, 대댓글을 레벨로 구분해주기 */
		if(replydto.replyLevel == 1){
			htmlVal += `<div class="replyresult level1">`;
			/* 댓글 */
		
		} else {
			htmlVal += `<div class="replyresult level2">`;
			/* 대댓글 */
		}
		htmlVal += `
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
		`;
		if(replydto.replyLevel == 1){
			htmlVal += `<li class="replyMore" data-replyid="\${replydto.replyId}" data-replylevel="\${replydto.replyLevel}" data-replystep="\${replydto.replyStep}" data-replyref="\${replydto.replyRef}">댓글 달기</li>`;
				/*  dat는 소문자만 사용 가능 - 이걸로 원한는 값 끌고오기 가능한데
												값 꺼내쓸 때 변수에 담아야 함*/
		} else {
			htmlVal += `<li></li>`;
		}

			/* 대댓글은 댓글Id를 알아야 찾아갈 수 있음 */
			/* 댓글id는 boardId를 알고 있기 때문에(boardId 데이터를 가지고 있음) 대댓글에서까지 boardId 알 필요 없음 */
			htmlVal += `
							<li class="replydel" data-replyid="\${replydto.replyId}" style="cursor: pointer;">삭제</li>
						</ul>
					</div>
				</div>
			`;
	}
	
	$(".replylist").html(htmlVal);
	/*  이렇게 하면 여기 출력되는 자리가 htmlVal로 인해 새롭게 overwrite 되면서 위에 걸려있던 대댓글창 띄우기 이벤트가 사라짐으로
 	   밑에 다시 걸어야함 */
		   
	/* 대댓글창 이벤트 다시 등록하기 */
	$(".replydel").off("click");
	$(".replydel").on("click", ReplydelClickHandler);
	
	$(".replyMore").each(function(index, element){
		/* replyMore - forEach로 인해 element 개수가 여러개인데 그중 하나의 그 element들 중 하나에 클릭이벤트 걸기*/
		/* forEach 를 걸면서 댓글이 달린 개수만큼 반복이 되서 이벤트 클릭했을때 그때그때 위치를 찾아줘야함 */
		$(element).click(ReplyMoreClickHandler);
		/* 그중 하나에 클릭이벤트 건게 이 친구!! */
	});
	
	

}		


/* 대댓글 창 띄우기 */
function ReplyMoreClickHandler(){

	// 기존에 열린 대댓글 입력창 모두 닫기
	$(".reply2").remove();
	
	console.log($(this).parents(".replyresult").nextAll(".level1"));
	/* this를 기준으로 다음 level1부터를 기준으로 level1의 모든것 */
	
	
	
	// 클릭 기준으로 대댓글 입력창 열기
	var replyresultEle$ = $(this).parents(".replyresult").nextAll(".level1").eq(0);
	/* eq(0) - level1들 중에서 1번 째 */
	/* next라고 써있기 때문에 this의 부모의 형제인 replyresult 중 두번째 level1부터 모든 level1들을 찾아줘 */
	var replyId = $(this).data("replyid");
	/* data안에 있는 값을 꺼내는데 그게 replyid */
	/* data는 이 전에 data안에 속성이 지정되어야 꺼내서 사용가능 */
	var replyLevel = $(this).data("replylevel");
	var replyStep = $(this).data("replystep");
	var replyRef = $(this).data("replyref");
	
	var htmlVal = '';
	 	htmlVal += `
	 		<div class="reply2">
				<form class="frm-reply2">
					<div class="r-1">
						<div>
							${loginInfo.memId }
						</div>
					</div>
					<div class="r-2">
						<div>
							<textarea name="replyContent" cols="130" rows="5" placeholder="내용을 입력하시오."></textarea>
						</div>
					</div>
					<div class="r-3">
						<ul>
							<li class="replyesc" style="cursor: pointer;">취소</li>
							<li class="replyreg2" style="cursor: pointer;">등록</li>
						</ul>
					</div>
					<input type="hidden" name="boardId" value="${dto.boardId }">
					<input type="hidden" name="replyId" value="\${replyId }">
					<input type="hidden" name="replyLevel" value="\${replyLevel }">
					<input type="hidden" name="replyStep" value="\${replyStep }">
					<input type="hidden" name="replyRef" value="\${replyRef }">
				</form>	
			</div>	
	`;
 
	console.log(replyresultEle$);
	if(replyresultEle$.length == 0){ 
		// == null은 의미 X - 자료형으로 잡혀있어서 객체를 가지고 있니? 를 물어보는 거라서 안에 뭐 없으면 텅빈 상태로 넘어옴
		$(".replylist").append(htmlVal);
		// replylist의 마지막에 추가
		
	} else {
	 	replyresultEle$.before(htmlVal);
		// 다음번 level1(댓글값 입력된 창) 위에 대댓글 입력창 넣기
	}
 		
	// event 다시 등록
 	$(".replyesc").on("click", ReplyEscClickHandler);
 	$(".replyreg2").on("click", boardReplyMoreClickHandler);

}


/* 대댓글 등록하기 */
function boardReplyMoreClickHandler(){
	
	if($(".frm-reply2 [name=replyContent]").val().trim().length == 0) {
		alert("등록하고 싶으면 입력해라");
		return;
	}

	
	$.ajax({
		url: "${pageContext.request.contextPath}/board/reply/write",
		method: "post",
		data: $(".frm-reply2").serialize(),
		dataType: 'json',
		success: function(result){
			console.log(result);
			if(result == null) {
				alert("오류났어요~");
				
			} else {
				displayReplyWrap(result);
			}
		},
		error: ajaxErrorHandler	
		
	});
	
	if($(this).text() == "등록") {		
		$(this).text("삭제");		
		return;
	} else {
		$(this).text("등록");
	}
}

/* 대댓글 창 떴을 때 취소 누르기*/
function ReplyEscClickHandler(){
	$(this).parents(".reply2").remove();
}

/* 댓글 삭제하기 */
function ReplydelClickHandler(){
	var replyId = $(this).data("replyid");
	console.log("삭제할 replyId-----"+replyId );
}

/* 게시글 작성 */
function boardWriteClickHandler(){
	location.href = "${pageContext.request.contextPath}/board/write";
}

/* 게시글 수정 */
function boardUpdateClickHandler(){
	/* 어느 게시판인지 query string 으로 정보 보내야함 */
	location.href = "${pageContext.request.contextPath}/board/update?id=${dto.boardId }";
}


function boardClickHandler(){
	location.href = "${pageContext.request.contextPath}/board";
}


//ajax error 부분
function ajaxErrorHandler (request, status, error){
	//controller에서 전달해준 값 여기서 호출
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}
</script>


</body>
</html>