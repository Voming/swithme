<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- calendar -->
<link href="${pageContext.request.contextPath}/resources/css/testcalendar/testcalendarhome.css" rel="stylesheet">
<!-- full calendar-->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp"/>
<title>SWITH.ME</title>
</head>
<body>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				titleFormat : function(date) {
					year = date.date.year;
					return year + " 시험 일정";
				}
			});
			calendar.render();
		});

		$(loadedHandler);

		function loadedHandler() {
			$(".btn.update").on("click", btnUpdateClickHandler);
		}
		
		function btnUpdateClickHandler(){
			// 시험 내용 업데이트 하기
			$.ajax( { 
				url : "${pageContext.request.contextPath}/test/update.ajax"
				, method : "post"
				, success : function(result){ 
					
				}
				,error : ajaxErrorHandler
			} ); 
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
							<li><a href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a class="active"
								href="${pageContext.request.contextPath}/testcalendar">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr>
				</div>
			</header>
		</div>
		<div class="wrap-body">
			<div class="wrap-calendar">
				<div id='calendar'></div>
			</div>
			<div class="wrap-content">
				<button class="btn update">시험달력 업데이트</button>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>