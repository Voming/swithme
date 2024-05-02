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
<link href="${pageContext.request.contextPath}/resources/css/testcalendar/testcalendartable.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp"/>
<title>SWITH.ME</title>
</head>
<body>
	<script>

	
	var testevent = [{
		allDay:true,
		color:"#8066FF",
		end:"2024-04-22",
		start:"2024-04-21",
		textColor:"black",
		title:"기술사(2024년도 제132회)필기접수"
		}
	];
		$(loadedHandler);

		function loadedHandler() {
			//달력에 들어갈 이벤트 내용 가져오기
			$(".btn.update").on("click", btnUpdateClickHandler);
			
			// 탭
            $('.test-tab-nav a').click(function () {
                $('.test-tab-content > div').hide().filter(this.hash).fadeIn();
                $('.test-tab-nav a').removeClass('active');
                $(this).addClass('active');
                return false;
            }).filter(':eq(0)').click();

			//달력 값 받아오기
			var eventsArr = [];

			$.ajax({
				url : "${pageContext.request.contextPath}/test/event.ajax",
				method : "post",
				dataType : "json",
				success : function(param) {
					//1 : 기술사 2: 기능장 3: 기사 산업기사
					//기술사
					var data1 = param.prolist;
					wrapeventdisplay1(data1);
					$.each(data1, function(index, dto) {
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "필기접수",
								start : dto.docregstartdt,
								end : dto.docregenddt,
								color : '#DDCCFF', //3
								 
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "필기접수 추가일정",
								start : dto.docregstartdtEx,
								end : dto.docregenddtEx,
								color : '#DDCCFF', //3
								 
								textColor : 'black'
							});
						}
						if (dto.docexamdt) {
							eventsArr.push({
								title : dto.description + "필기시험",
								start : dto.docexamdt,
								end : dto.docexamdt,
								color : '#8066FF', //1
								 
								textColor : 'white'
							});
						} 
						if (dto.docpassdt) {
							eventsArr.push({
								title : dto.description + "필기시험 발표",
								start : dto.docpassdt,
								end : dto.docpassdt,
								color : '#BF80FF', //2
								 
								textColor : 'black'
							});
						}
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "실기접수",
								start : dto.pracregstartdt,
								end : dto.pracregenddt, 
								color : '#DDCCFF', //3
								 
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "실기시험",
								start : dto.pracexamstartdt,
								end : dto.pracexamenddt,
								color : '#8066FF', //1
								 
								textColor : 'white'
							});
						}
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "합격자 발표",
								start : dto.pracpassdt,
								end : dto.pracpassdt,
								color : '#BF80FF', //2
								 
								textColor : 'black'
							});
						}
					})
					//기능장
					var data2 = param.masterlist;
					wrapeventdisplay2(data2);
					$.each(data2, function(index, dto) {
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "필기접수",
								start : dto.docregstartdt,
								end : dto.docregenddt,
								color : '#CCDDFF', //3
								 
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "필기접수 추가일정",
								start : dto.docregstartdtEx,
								end : dto.docregenddtEx,
								color : '#CCDDFF', //3
								 
								textColor : 'black'
							});
						}
						if (dto.docexamdt) {
							eventsArr.push({
								title : dto.description + "필기시험",
								start : dto.docexamdt,
								end : dto.docexamdt,
								color : '#6680FF', //1
								 
								textColor : 'white'
							});
						} 
						if (dto.docpassdt) {
							eventsArr.push({
								title : dto.description + "필기시험 발표",
								start : dto.docpassdt,
								end : dto.docpassdt,
								color : '#99BBFF', //2
								 
								textColor : 'black'
							});
						}
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "실기접수",
								start : dto.pracregstartdt,
								end : dto.pracregenddt,
								color : '#CCDDFF', //3
								 
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "실기시험",
								start : dto.pracexamstartdt,
								end : dto.pracexamenddt,
								color : '#6680FF', //1
								 
								textColor : 'white'
							});
						}
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "합격자 발표",
								start : dto.pracpassdt,
								end : dto.pracpassdt,
								color : '#99BBFF', //2
								 
								textColor : 'black'
							});
						}
					})
					//기사 산업기사
					var data3 = param.indlist;
					wrapeventdisplay3(data3);					
					$.each(data3, function(index, dto) {
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "필기접수",
								start : dto.docregstartdt,
								end : dto.docregenddt,
								color : '#FFDFF4', //3
								 
								textColor : 'black'
								
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "필기접수 추가일정",
								start : dto.docregstartdtEx,
								end : dto.docregenddtEx,
								color : '#FFDFF4', //3
								 
								textColor : 'black'
							});
						}
						if (dto.docexamdt) {
							eventsArr.push({
								title : dto.description + "필기시험",
								start : dto.docexamdt,
								end : dto.docexamdt,
								color : '#EE99FF', //1
								 
								textColor : 'white'
							});
						} 
						if (dto.docpassdt) {
							eventsArr.push({
								title : dto.description + "필기시험 발표",
								start : dto.docpassdt,
								end : dto.docpassdt,
								color : '#FFB3E5', //2
								 
								textColor : 'black'
							});
						}
						if (dto.docregstartdt) {
							eventsArr.push({
								title : dto.description + "실기접수",
								start : dto.pracregstartdt,
								end : dto.pracregenddt,
								color : '#FFDFF4', //3
								 
								textColor : 'black'
							});
						} 
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "실기시험",
								start : dto.pracexamstartdt,
								end : dto.pracexamenddt,
								color : '#EE99FF', //1
								 
								textColor : 'white'
							});
						}
						if (dto.docregstartdtEx) {
							eventsArr.push({
								title : dto.description + "합격자 발표",
								start : dto.pracpassdt,
								end : dto.pracpassdt,
								color : '#FFB3E5',//2
								 
								textColor : 'black'
							});
						}
					})
				
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
						expandRows: true ,
						eventDataTransform: function(event) {    
							//end 하루 더 안나오는거 해결
							if(event.allDay) {                                                                                                                                               
								event.end = moment(event.end).add(1, 'days')                                                                                                                 
							}
							return event;  
						}   
					});
					calendar.render();
				},
				error : ajaxErrorHandler
			});
		}
		
		//일정 테이블 만들기
		function wrapeventdisplay1(datalist){
			console.log(datalist);
			htmlVal = '';
			for(var idx in datalist){
				var testinfo = datalist[idx];
				if(!testinfo.docregstartdtEx){
					htmlVal += `	
						<tr>
							<td>\${testinfo.description}</td>
							<td>\${testinfo.docregstartdt} ~ \${testinfo.docregenddt}</td>
							<td>\${testinfo.docexamdt}</td>
							<td>\${testinfo.docpassdt}</td>
							<td>\${testinfo.pracregstartdt} ~ \${testinfo.pracregenddt}</td>
							<td>\${testinfo.pracexamstartdt} ~ \${testinfo.pracexamenddt}</td>
							<td>\${testinfo.pracpassdt}</td>
						</tr>
						`;
				}else{
					htmlVal += `	
						<tr>
							<td>\${testinfo.description}</td>
							<td>
								<p>\${testinfo.docregstartdt} ~ \${testinfo.docregenddt}</p>
								<p>빈자리 접수</p>
								<p>\${testinfo.docregstartdtEx} ~ \${testinfo.docregenddtEx}</p>
							 </td>
							<td>\${testinfo.docexamdt}</td>
							<td>\${testinfo.docpassdt}</td>
							<td>\${testinfo.pracregstartdt} ~ \${testinfo.pracregenddt}</td>
							<td>\${testinfo.pracexamstartdt} ~ \${testinfo.pracexamenddt}</td>
							<td>\${testinfo.pracpassdt}</td>
						</tr>
						`;
				}
			}
			$(".tb-1").html(htmlVal);
		}
		
		function wrapeventdisplay2(datalist){
			console.log(datalist);
			htmlVal = '';
			for(var idx in datalist){
				var testinfo = datalist[idx];
				if(!testinfo.docregstartdtEx){
					htmlVal += `	
						<tr>
							<td>\${testinfo.description}</td>
							<td>\${testinfo.docregstartdt} ~ \${testinfo.docregenddt}</td>
							<td>\${testinfo.docexamdt}</td>
							<td>\${testinfo.docpassdt}</td>
							<td>\${testinfo.pracregstartdt} ~ \${testinfo.pracregenddt}</td>
							<td>\${testinfo.pracexamstartdt} ~ \${testinfo.pracexamenddt}</td>
							<td>\${testinfo.pracpassdt}</td>
						</tr>
						`;
				}else{
					htmlVal += `	
						<tr>
							<td>\${testinfo.description}</td>
							<td>
								<p>\${testinfo.docregstartdt} ~ \${testinfo.docregenddt}</p>
								<p>빈자리 접수</p>
								<p>\${testinfo.docregstartdtEx} ~ \${testinfo.docregenddtEx}</p>
							 </td>
							<td>\${testinfo.docexamdt}</td>
							<td>\${testinfo.docpassdt}</td>
							<td>\${testinfo.pracregstartdt} ~ \${testinfo.pracregenddt}</td>
							<td>\${testinfo.pracexamstartdt} ~ \${testinfo.pracexamenddt}</td>
							<td>\${testinfo.pracpassdt}</td>
						</tr>
						`;
				}
			}
			$(".tb-2").html(htmlVal);
		}
		function wrapeventdisplay3(datalist){
			console.log(datalist);
			htmlVal = '';
			for(var idx in datalist){
				var testinfo = datalist[idx];
				if(!testinfo.docregstartdtEx){
					htmlVal += `	
						<tr>
							<td>\${testinfo.description}</td>
							<td>\${testinfo.docregstartdt} ~ \${testinfo.docregenddt}</td>
							<td>\${testinfo.docexamdt}</td>
							<td>\${testinfo.docpassdt}</td>
							<td>\${testinfo.pracregstartdt} ~ \${testinfo.pracregenddt}</td>
							<td>\${testinfo.pracexamstartdt} ~ \${testinfo.pracexamenddt}</td>
							<td>\${testinfo.pracpassdt}</td>
						</tr>
						`;
				}else{
					htmlVal += `	
						<tr>
							<td>\${testinfo.description}</td>
							<td>
								<p>\${testinfo.docregstartdt} ~ \${testinfo.docregenddt}</p>
								<p>빈자리 접수</p>
								<p>\${testinfo.docregstartdtEx} ~ \${testinfo.docregenddtEx}</p>
							 </td>
							<td>\${testinfo.docexamdt}</td>
							<td>\${testinfo.docpassdt}</td>
							<td>\${testinfo.pracregstartdt} ~ \${testinfo.pracregenddt}</td>
							<td>\${testinfo.pracexamstartdt} ~ \${testinfo.pracexamenddt}</td>
							<td>\${testinfo.pracpassdt}</td>
						</tr>
						`;
				}
			}
			$(".tb-3").html(htmlVal);
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
					<button class="btn update">시험달력 업데이트</button>
				</div>
			</div>
			<div class="wrap-events">
				<div class="tab-body">
					<p class="all-txt">상세일정</p>
					<ul class="test-tab-nav">
						<li><a href="#tab01">기술사</a></li>
						<li><a href="#tab02">기능장</a></li>
						<li><a href="#tab03">기사 산업기사</a></li>
					</ul>
					<div class="test-tab-content">
						<c:forEach var="i" begin="1" end="3" step="1">
							<div id="tab0${i}">
								<table class="tb-events">
									<thead>
										<tr>
											<th>시행회차</th>
											<th>필기시험 접수</th>
											<th>필기시험</th>
											<th>필기시험 발표</th>
											<th>실기시험 접수</th>
											<th>실기시험</th>
											<th>합격자 발표</th>
										</tr>
									</thead>
									<tbody class="tb-${i}">
									</tbody>
								</table>
							</div>
						</c:forEach>
					</div>
					<div class="wrap-link">
						<button onclick="location.href='https://www.q-net.or.kr/crf021.do?id=crf02101&gSite=Q&gId=&scheType=01'">시험 상세정보 보러 이동하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
<!-- full calendar -->
<script src="${pageContext.request.contextPath}/resources/css/basic/fullcalendar_js/index.global.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/basic/fullcalendar_js/locales-all.global.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/basic/fullcalendar_js/daygrid/index.global.js"></script>
</body>
</html>