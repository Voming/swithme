<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/ranking/ranking.css" rel="stylesheet">
<meta charset="UTF-8">
<title>전체 랭킹</title>
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
							<li><a href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a class="active"
								href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
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
			<div class="wrap-rank">
				<div class="rank-tab-nav">
					<button type="button" class="btn tab01">일간</button>
					<button type="button" class="btn tab02">월간</button>
				</div>
			</div>
			<div class="ranking-tab-content">
				<div id="tab01">
					<ul class="daily">
						<li>일간 보고</li>
					</ul>
				</div>
				<div id="tab02">
					<ul class="monthly">
						<li>월간 보고</li>
					</ul>
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
	$('.btn.tab01').on('click', btnDailyClickHandler);
	$('.btn.tab02').on('click', btnMonthlyClickHandler);
}

function btnDailyClickHandler() {
    $('.monthly').hide();
    $('.daily').show();

}

function btnMonthlyClickHandler() {
    $('.daily').hide();
    $('.monthly').show();

}

</script>

	
</body>
</html>