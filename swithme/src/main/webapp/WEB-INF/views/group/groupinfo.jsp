<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/group/groupinfo.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/groupmembers.css" rel="stylesheet">
<!-- jQuery 선언 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp"/>
<meta charset="UTF-8">
<title>SWITH.ME</title>
</head>
<body>
<script>
$(loadedHandler);
$(window).on('load', displaySetColor);

function loadedHandler() {
	$(".btn.exit").on("click", btnExitClickHandler);
}
function displaySetColor() {
	
	$(".d4.setcolor").each(function(){
		var d4Data = $(this).data("d4").toString();
		if(d4Data.indexOf(6) == 1){ // 만약 6시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 1)");
		} else if(d4Data.indexOf(4) == 1){ // 만약 4시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.8)");
		} else if(d4Data.indexOf(2) == 1){ // 만약 2시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.6)");
		} else if(d4Data.indexOf(1) == 1){ // 만약 1시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.4)");
		} else if(d4Data != "0" ){ // 만약 분 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.2)");
		}
	});
	
	$(".d5.setcolor").each(function(){
		var d5Data = $(this).data("d5").toString();
		if(d5Data.indexOf(6) == 1){ // 만약 6시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 1)");
		} else if(d5Data.indexOf(4) == 1){ // 만약 4시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.8)");
		} else if(d5Data.indexOf(2) == 1){ // 만약 2시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.6)");
		} else if(d5Data.indexOf(1) == 1){ // 만약 1시 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.4)");
		} else if(d5Data != "0" ){ // 만약 분 있다면
			$(this).css("background-color", "rgba(128, 102, 255, 0.2)");
		}
	});
	
	$(".setcolor.n1").css("font-family", "IM_Hyemin-Bold");
	$(".setcolor.n1").css("background-color", "white");
}
function btnExitClickHandler() {
	$.ajax({
		url:"${pageContext.request.contextPath }/group/exit.ajax"
		, method : "post"
		, data :  {"groupId" : ${groupInfo.sgroupId}}
		, success: function(result){
			console.log(result);
			if(result > 0){
				alert("그룹을 탈퇴 성공! \n마지막 멤버라면 그룹이 사라집니다.");
				location.href='${pageContext.request.contextPath}/group'
			}else{
				alert("그룹을 나가지 못했습니다.");
			}
		}
		,error : ajaxErrorHandler
	});	
	
}
</script>
	<div class="wrapper">
		<div class="wrap-header">
			<header>
				<%@include file="/WEB-INF/views/basic/header.jsp"%>
				<div class="bn">
					<div class="nav2-wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
							<li><a class="active" href="${pageContext.request.contextPath}/group">그룹</a></li>
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
			<div class="wrap-group">
				<div class="wrap-my">
					<c:if test="${not empty groupInfo }">
						<div class="txt-my">
							<div class="myGName">${groupInfo.sgroupName }</div>
							<div class="myGExp">${groupInfo.sgroupEx }</div>
							<!-- <p>활동중</p> -->
							<div class="wrap-btn">
								<button type="button" class="btn update" 
									onclick="location.href='${pageContext.request.contextPath}/group/update?groupId=${groupInfo.sgroupId}'">그룹
									수정하기
								</button>
								<button type="button" class="btn exit">그룹 탈퇴하기</button>
							</div>
						</div>
						<div class="myGImg">
							<img src="${groupInfo.sgroupImgPath}" alt="그룹 이미지"/>
						</div>
					</c:if>
					<hr>
				</div>
			</div>
			<div class="group-mem">
				<p class="now">공부현황</p>
				<div class="group-box">
					<ul>
						<c:if test="${not empty groupSumList }">
							<c:forEach items="${groupSumList}" var="groupSumDto">
								<li class="mem-box"><img alt="기본 아이콘"
									src="${pageContext.request.contextPath}/resources/images/studyIcon.jpg">
									<p>${groupSumDto.memId}</p>
									<p>${groupSumDto.sumMin}</p></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<hr>
			</div>
			<div class="wrap-calc">
				<div class="wrap-calendar">
					<p class="ct">출석부</p>
					<table>
						<c:if test="${not empty groupSumDayList }">
							<c:forEach items="${groupSumDayList}" var="DayDto" varStatus="idx" >
								<tr>
									<th>${DayDto.memId }</th>
									<td bgcolor="#CCDDFF" 
										class="d1 setcolor n${idx.count }" data-d1="${DayDto.d1 }">${DayDto.d1 }</td>
									<td class="d2 setcolor n${idx.count }" data-d2="${DayDto.d2 }">${DayDto.d2 }</td>
									<td class="d3 setcolor n${idx.count }" data-d3="${DayDto.d3 }">${DayDto.d3 }</td>
									<td class="d4 setcolor n${idx.count }" data-d4="${DayDto.d4 }">${DayDto.d4 }</td>
									<td class="d5 setcolor n${idx.count }" data-d5="${DayDto.d5 }">${DayDto.d5 }</td>
									<td class="d6 setcolor n${idx.count }" data-d6="${DayDto.d6 }">${DayDto.d6 }</td>
									<td class="d7 setcolor n${idx.count }" data-d7="${DayDto.d7 }">${DayDto.d7 }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="wrap-rank">
					<p class="ct">그룹 내 랭킹</p>
					<ul>
					<c:if test="${not empty groupSumList }">
							<c:forEach items="${groupSumList}" var="groupSumDto" varStatus="idx">
								<li>
									<div class="rank-txt">
										<div class="rank rank-${idx.count }">
											<p>${idx.count }</p>
										</div>
										<div style="margin-left: 10px; ">
											<p>${groupSumDto.memId}</p>
										</div>
										<div class="mins">
											<p>${groupSumDto.sumMin}</p>
										</div>
									</div>
									<div class="wrap-bar"></div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>