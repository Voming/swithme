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
		$(loadedHandler);

		function loadedHandler() {
			//달력에 들어갈 이벤트 내용 가져오기
			$(".btn.update").on("click", btnUpdateClickHandler);

			//달력 값 받아오기
			var eventsArr = [];

			$.ajax({
				url : "${pageContext.request.contextPath}/test/event.ajax",
				method : "post",
				dataType : "json",
				success : function(param) {
					console.log(param);
					var data1 = param.prolist;
					//1 : 기술사 2: 기능장 3: 기사 산업기사
					//기술사
					$.each(data1, function(index, dto) {
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "필기접수",
								start : dto.docregstartdt,
								end : dto.docregenddt,
								color : '#8066FF',
								allDay : true,
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "필기접수 추가일정",
								start : dto.docregstartdtEx,
								end : dto.docregenddtEx,
								color : '#BF80FF',
								allDay : true,
								textColor : 'black'
							});
						}
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "실기접수",
								start : dto.pracregstartdt,
								end : dto.pracregenddt,
								color : '#8066FF',
								allDay : true,
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "실기접수 추가일정",
								start : dto.pracregstartdtEx,
								end : dto.pracregenddtEx,
								color : '#BF80FF',
								allDay : true,
								textColor : 'black'
							});
						}
					})
					//기능장
					var data2 = param.masterlist;
					$.each(data2, function(index, dto) {
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "필기접수",
								start : dto.docregstartdt,
								end : dto.docregenddt,
								color : '#6680FF',
								allDay : true,
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "필기접수 추가일정",
								start : dto.docregstartdtEx,
								end : dto.docregenddtEx,
								color : '#99BBFF',
								allDay : true,
								textColor : 'black'
							});
						}
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "실기접수",
								start : dto.pracregstartdt,
								end : dto.pracregenddt,
								color : '#6680FF',
								allDay : true,
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "실기접수 추가일정",
								start : dto.pracregstartdtEx,
								end : dto.pracregenddtEx,
								color : '#99BBFF',
								allDay : true,
								textColor : 'black'
							});
						}
					})
					//기사 산업기사
					var data3 = param.indlist;
					$.each(data3, function(index, dto) {
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "필기접수",
								start : dto.docregstartdt,
								end : dto.docregenddt,
								color : '#EE99FF',
								allDay : true,
								textColor : 'black'
								
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "필기접수 추가일정",
								start : dto.docregstartdtEx,
								end : dto.docregenddtEx,
								color : '#FFB3E5',
								allDay : true,
								textColor : 'black'
							});
						}
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "실기접수",
								start : dto.pracregstartdt,
								end : dto.pracregenddt,
								color : '#EE99FF',
								allDay : true,
								textColor : 'black'
								
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "실기접수 추가일정",
								start : dto.pracregstartdtEx,
								end : dto.pracregenddtEx,
								color : '#FFB3E5',
								allDay : true,
								textColor : 'black'
							});
						}
					})
					for(var i=0; i<eventsArr.length ; i++){
						console.log(eventsArr[i]);
					}
					
					//달력 세팅
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView : 'dayGridMonth',
						titleFormat : function(date) {
							return date.date.year + '년  시험 일정' + (parseInt(date.date.month) + 1) + '월';
						},
						selectable : true,
						droppable : true,
		
						events:eventsArr,
						trigger: 'hover',
						expandRows: true 
						
						
					});
					calendar.render();
				},
				error : ajaxErrorHandler
			});
		}

		function btnUpdateClickHandler() {
			// 시험 내용 업데이트 하기
			$.ajax({
				url : "${pageContext.request.contextPath}/test/update.ajax",
				method : "post",
				success : function(result) {

				},
				error : ajaxErrorHandler
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
							<li><a href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a class="active"
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
			<div class="wrap-calendar">
				<div id='calendar'></div>
				<div class="wrap-content">
				<button class="btn update" >시험달력 업데이트</button>
			</div>
			</div>
			
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>

</body>
</html>