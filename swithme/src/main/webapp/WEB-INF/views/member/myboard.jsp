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
						</tr>
					</tbody>
				</table>
				<div class="btn">
					<button type="button" class="btn delete">삭제</button>
				</div>
			</div>

			<div>
				<ul>
					<c:if test="${startPageNum > 1}">
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
	

	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	
	
<script>
$(loadedHandler);

function loadedHandler() {

	console.log('${dataObj.startPageNum}');
	
	console.log( "로그인아이디 : " + '${loginInfo.memId}');
	
	$("li.page").on("click", pageChangeHandler);
	
	/* li태그에 Handler 걸어서 function 안에 a 태그 불러와서 css 색 바꿔주기 */
	$(".page").on("mouseenter", pageMouseEnterHandler);
 	$(".page").on("mouseleave", pageMouseLeaveHandler); 

	
	/* checkbox 전체 선택 */
 	$("#allCheck").on("click", allCheckHandler);
 	
 	/* checkbox 하나 눌렀을때  */
 	$(".item").on("click", itemCheckHandler); 
	
	$(".btn.delete").on("click", btnDeleteClickHandler);
	
	//게시글 삭제 이후 남은 게시글 출력
	loadboard();
}


//밑에 페이지 눌렀을 때 페이지 바뀌는 것
function pageChangeHandler(){
	location.href = "${pageContext.request.contextPath}/mypage/myboard?page="+$(this).text();
	/* ?는 쿼리, page는 name, 이 뒤에 오는게 value 이고 이것은 get방식 */
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
	$('input[name=checkitem]:checked').each(function (index) {
		var item = $(this).parent().parent().find('.boardId-txt').text();
	  	console.log(item);
		cbList.push(item);
		//cbList에 push를 통해 item 집어넣기
	});
	console.log(cbList);
	
	$.ajax({
        type : "post",
          url:"${pageContext.request.contextPath}/mypage/myboard/delete",
          data: JSON.stringify(cbList),
          contentType: "application/json; charset=utf-8",
          success: function(result){
        	  console.log(result);
        	 loadboard(); 
          },
          error: ajaxErrorHandler
      });
	
}

//나의 게시글에서 삭제한 게시글을 조회하는 함수
function loadboard(){
	
	$.ajax({
		url: "${pageContext.request.contextPath}/mypage/myboard",
		method: "post",
		data: { page : "1"},
		/* 여기서 memId를 데이터로 안들고 가는 이유는 이미 controller에서 로그인한 정보의 memId를 꺼내서 가지고 가고있음 */
		dataType: 'json',
		success: function(result){
			console.log(result);
			if(result == null) {
				console.log("게시글 조회 실패");
			} 
			displayboardWrap(result);
		},
		error: ajaxErrorHandler		
	});
}



//남은 게시글 출력하는 함수
function displayboardWrap(dataObj){
	console.log("dataObj : " + dataObj);
	//console창 찍어보면 object 형태( { } 가 있음)
	console.log("dataObj.boardlistdto : " + dataObj.boardlistdto);
	
	htmlVal = '';
	if(dataObj.boardlistdto.length == 0){
		htmlVal += `
		<tr class="tr-sec">
			<td colspan="6" style="border-bottom: none; text-align:center;">
				게시글이 존재하지 않습니다.
			</td>
		</tr>
		`;
	} 
	else{ 
		for(var idx in dataObj.boardlistdto){
			var dto = dataObj.boardlistdto[idx];
			if(dto){
				htmlVal += `	
				<tr class="tr-sec">
					<td style="text-align: center;"><input type="checkbox" class="item" name="checkitem"></td>
					<td style="text-align: center;" class="boardId-txt">\${dto.boardId}</td>
					<td onclick="location.href='${pageContext.request.contextPath }/board/content?id=\${dto.boardId }'">\${dto.title }</td>
					<td>\${dto.boardWriter}</td>
					<td>\${dto.writeTime}</td>
					<td style="text-align: center;">\${dto.readCount}</td>
				</tr>
				`;
			}
		}
	}
	$(".tbody-my").html(htmlVal);
	
	console.log(dataObj.currentPage);
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