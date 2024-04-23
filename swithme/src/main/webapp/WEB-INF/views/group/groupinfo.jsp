<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

function loadedHandler() {
	$(".btn.exit").on("click", btnExitClickHandler);
}

function btnExitClickHandler() {
	$.ajax({
		url:"${pageContext.request.contextPath }/group/exit.ajax"
		, method : "post"
		, data :  {"groupId" : ${groupInfo.sgroupId}}
		, success: function(result){
			console.log(result);
			if(result > 0){
				alert("그룹을 나가기 성공!");
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
								<button type="button" class="btn exit">그룹 나가기</button>
							</div>
						</div>
						<div class="myGImg">
							<img src="${pageContext.request.contextPath }/files/${groupInfo.sgroupImgPath}" alt="그룹 이미지"/>
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
							<c:forEach items="${groupSumDayList}" var="DayDto">
								<tr>
									<th>${DayDto.memId }</th>
									<td>${DayDto.d1 }</td>
									<td>${DayDto.d2 }</td>
									<td>${DayDto.d3 }</td>
									<td>${DayDto.d4 }</td>
									<td>${DayDto.d5 }</td>
									<td>${DayDto.d6 }</td>
									<td>${DayDto.d7 }</td>
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
										<div class="rank">
											<p>${idx.count }</p>
										</div>
										<div>
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