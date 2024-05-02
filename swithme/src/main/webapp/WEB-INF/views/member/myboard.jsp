<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/member/myboard.css" rel="stylesheet">
<meta charset="UTF-8">
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
				<p class="p-first">나의 게시판</p>
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
					<tbody class="tbody-my">
						<tr class="tr-sec">
							<c:choose>
						<c:when test="${empty boardlist}">
	          				<tr>
	          					<td colspan="5" style="border-bottom: none;">
	          						게시글이 존재하지 않습니다.
	          					</td>
	          				</tr>
	          			</c:when>
						<c:otherwise>
							<tbody>
								<c:forEach items="${boardlist}" var="dto">
								<!-- mapboardlist 자체를 dto로 분리시킴 -->
									<tr class="tr-sec" >
 										<td style="text-align: center; border-bottom: 1px solid black;"><input type="checkbox" class="item" name="checkitem" value="${dto.boardId }"></td>
										<td style="text-align: center; border-bottom: 1px solid black;">${dto.boardId}</td>
										<td style="border-bottom: 1px solid black;"><a href="${pageContext.request.contextPath }/board/content?id=${dto.boardId }">${dto.title }</a></td>
										<!-- boardId 에 의해 해당 게시판 상세 페이지로 이동 -->
										<!-- url에 있는 parameter 값 가지고 와서 쓸 수 있기 때문에 여기 있는 id는
										BoardContentController에에서 쓰임 -->
										<td style="border-bottom: 1px solid black;">${dto.boardWriter}</td>
										<td style="border-bottom: 1px solid black;">${dto.writeTime}</td>
										<td style="border-bottom: 1px solid black;">${dto.readCount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:otherwise>
					</c:choose>
						</tr>
					</tbody>
				</table>
				<div class="wrap-btn">
					<div class="btn-group">
						<button type="button" class="btn delete" data-bs-toggle="modal"
								data-bs-target="deleteModal">삭제</button>

							<!-- Modal -->
<!--  							<div class="delete modal" id="deleteModal">
								<div class="modal-dialog .modal-dialog-centered">
									<div class="modal-content">
									 	<div>정말 삭제하시겠습니까?</div>
										<button type="button"  class="btn yes">
											<p>예</p>
										</button>
										<button type="button" class="btn no"  data-bs-dismiss="modal">
											<p>아니오</p>
										</button>
									</div>
								</div>
							</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	
	
<script>
$(loadedHandler);

function loadedHandler() {
	
	console.log( "로그인아이디 : " + '${loginInfo.memId}');
	
	/* li태그에 Handler 걸어서 function 안에 a 태그 불러와서 css 색 바꿔주기 */
	$(".page").on("mouseenter", pageMouseEnterHandler);
 	$(".page").on("mouseleave", pageMouseLeaveHandler); 

	
	/* checkbox 전체 선택 */
 	$("#allCheck").on("click", allCheckHandler);
 	
 	/* checkbox 하나 눌렀을때  */
 	$(".item").on("click", itemCheckHandler); 
	
	$(".btn.delete").on("click", btnDeleteClickHandler);
	
	//게시글 삭제 이후 남은 게시글 출력
	// loadboard();
}


//체크 박스 전체 선택
function allCheckHandler(){
    var checkall = $("#allCheck");
    var itemcheck = $(".item");
    if(checkall.is(":checked")){
        $(itemcheck).prop("checked",true);
    } else {
        $(itemcheck).prop("checked",false);
    }

}

//체크 박스 하나 클릭 시 전체 선택 취소
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
	$(this).children().css('color', 'white');
}

/*마우스 뗐을 때 다시 원래색 변환 */
function pageMouseLeaveHandler(){
	$(this).children().css('color', 'black');
}


//게시글 삭제 - ajax로 list형태를 보냄
function btnDeleteClickHandler(){
	var cbList = [];
	//배열로 선언
	
	$('.item:checked').each(function (index) {
	  	console.log($(this).val());
		cbList.push($(this).val());
		//cbList에 push를 통해 item 집어넣기
	});
	console.log(cbList);
	
	
	$.ajax({
       	  method : "post",
          url:"${pageContext.request.contextPath}/mypage/myboard/delete",
          data: JSON.stringify(cbList),
          contentType: "application/json; charset=utf-8",
          success: function(result){
				location.reload();
				/* 해당페이지 다시 로딩하면서 삭제한 게시글 사라진채로 뜸 */
          },
          error: ajaxErrorHandler
      });
	
}


//ajax error 부분
function ajaxErrorHandler (request, status, error){
	//controller에서 전달해준 값 여기서 호출
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}

</script>	
	
<script src="${pageContext.request.contextPath}/resources/bootstrap-5.0.2/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap-5.0.2/bootstrap.bundle.min.js"></script>	
</body>
</html>