<%@page import="swithme.model.myrecord.dto.RecordCalendarDto"%>
<%@page import="java.util.List"%>
<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 선언 및 css연결 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link	href="${pageContext.request.contextPath}/resources/css/myrecord/selectedUserInfo.css"	rel="stylesheet">
<!--chart.js CDN  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- moment CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- 풀캘린더 CDN -->
<script	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp" />

<%-- <script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			headerToolbar:{
				left:'dayGridMonth,timeGridDay,timeGridWeek' ,
				center:'title' ,
				right:'today prev,next' 				
			},
			selectable : true,
			droppable : true,
			editable : true,
			events:[
				
				
				<%List<RecordCalendarDto> calendarList = (List<RecordCalendarDto>)request.getAttribute("calendarList");%>
				<%if (calendarList != null) {%>
	            <%for (RecordCalendarDto vo : calendarList) {%>
	            {
	            	title : '<%=vo.getSubjectName()%>',
	                start : '<%=vo.getRecordStart()%>',
	                end : '<%=vo.getRecordEnd()%>',
	           		color : chooseColor('<%=vo.getSubjectColor() %>')
	             },
				<%}  // for
				} // if %>
				
			]
		});
		calendar.render();
	});
	
</script> --%>
<title>SWITH.ME</title>
</head>
<body>
	<div class="wrapper">
		<div class="wrap-header">
			<header>
				<%@include file="/WEB-INF/views/basic/header.jsp"%>
				<div class="bn">
					<div class="nav2-wrap">
						<ul>
							<li><a class="active"
								href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
							<li><a href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
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
			<div class="wrap-ranking">

				<div class="grid">
					<div class="grid-item ">	
						<div>
							<p class="user-name"> ${memId}</p>
							<p class="user-comment">${comment}</p>
						</div>								
						<div class="user-difftime">${difftime}</div>
					</div>
					
					<div class="grid-item">
						<p>시간기록을 종료한 값만 통계에 반영됩니다</p>
					</div>
					<div class="grid-item">
						<p>과목별 비율</p>
						<canvas id="myChart" ></canvas>
					</div>
					<div class="grid-item">
						<p>과목별 공부시간</p>
						<canvas id="myChart2" ></canvas>
					</div>
					<!-- grid-item 4번 - -->
					<div class="grid-item">
						<div id='calendar' class="study-calender"></div>
					</div>
					<div class="grid-item">
						<p>공부시간 누적 ▼</p>
						<canvas id="myChart10" ></canvas>
					</div>
					<div class="grid-item">
						<p>일간 최대학습시간 ▼</p>
						<canvas id="myChart3" ></canvas>
					</div>
					<div class="grid-item">
						<p>월별 총 학습시간 ▼</p>
						<canvas id="myChart4" ></canvas>
					</div>
					<div class="grid-item">
						<p>일간 과목별 학습시간 ▼</p>
						<canvas id="myChart5" ></canvas>
					</div>
					<div class="grid-item">
						<p>월간 과목별 학습시간 ▼</p>
						<canvas id="myChart6" ></canvas>
					</div>
					<jsp:include page="/WEB-INF/views/myrecord/selectedUserInfo_chart.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
</body>
</html>