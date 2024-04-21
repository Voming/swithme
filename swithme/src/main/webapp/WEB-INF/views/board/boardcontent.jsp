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
				<form id="frm-reply">
				<input type="hidden" name="boardId" value="${dto.boardId} ">
					<div class="r-1">
						<div>
							작성자
						</div>
					</div>
					<div class="r-2">
						<div>
							<textarea name="content" cols="136" rows="5" placeholder="내용을 입력하시오."></textarea>
						</div>
					</div>
					<div class="r-3">
						<ul>
							<li>날짜</li>
							<li class="replyreg" style="cursor: pointer;">댓글 달기</li>
							<li>등록/삭제</li>
						</ul>
					</div>
				</form>
				
				<div class="wrap-reply">
				
				</div>
				
				<div class="wrap-reply2">
					<form id="frm-reply2">
						<div class="r-1">
							<div>
								작성자
							</div>
						</div>
						<div class="r-2">
							<div>
								<textarea name="content" cols="122" rows="5" placeholder="내용을 입력하시오."></textarea>
							</div>
						</div>
						<div class="r-3">
							<ul>
								<li>날짜</li>
								<li style="cursor: pointer;">댓글 달기</li>
								<li>등록/삭제</li>
							</ul>
						</div>
					</form>	
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
	$("replyreg").on("click", boardReplyClickHandler);
	$(".btn.write").on("click", boardWriteClickHandler);
	$(".btn.board").on("click", boardClickHandler);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/replycontent"
		, method: "post"
		/* url 접근 불가능하게 post 쓰기 */
		, data: {boardId: "${dto.boardId}"}
		, dataType: "json"
		, success: function(result){
			console.log("boardcontent ajax : " + result);
			displayReplyWrap(result);
			
		}
		, error: function(request, status, error){
			//controller에서 전달해준 값 여기서 호출
			alert("code: "+request.status + "\n" + "message: " 
					+ request.responseText + "\n"
					+ "error: "+error);
		}
		
	});
}

function boardReplyClickHandler(){
	
	if($("#frm-reply [name=content]").val().trim().length == 0) {
		alert("입력된 글이 없습니다. 입력 후 글을 등록해주세요.");
		return;
	}

	
	$.ajax({
		url: "${pageContext.request.contextPath}/replywrite",
		method: "post",
		data: $("#frm-reply").serialize(),
		dataType: "json",
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
}

function displayReplyWrap(datalist){

	var htmlVal = '';
	for(var idx in datalist){
		var replydto = datalist[idx];
		htmlVal += `
			<form id="frm-reply">
			<input type="hidden" name="boardId" value="${dto.boardId}">
			<input type="hidden" name="ReplyId" value="\${replydto.replyId }">
			<input type="hidden" name="ReplyLevel" value="\${replydto.replyLevel }">
			<input type="hidden" name="ReplyStep" value="\${replydto.replyStep }">
			<input type="hidden" name="ReplyRef" value="\${replydto.replyRef }">
				<div class="r-1">
					<div>
						작성자
					</div>
				</div>
				<div class="r-2">
					<div>
						<textarea name="content" cols="136" rows="5" placeholder="내용을 입력하시오."></textarea>
					</div>
				</div>
				<div class="r-3">
					<ul>
						<li>날짜</li>
						<li class="replyreg" style="cursor: pointer;">댓글 달기</li>
						<li>등록/삭제</li>
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