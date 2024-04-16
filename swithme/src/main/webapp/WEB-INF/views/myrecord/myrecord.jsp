<!-- reset.css -->
<link
	href="${pageContext.request.contextPath}/resources/css/basic/reset.css"
	rel="stylesheet">
<!-- 레이아웃 설정 -->
<link
	href="${pageContext.request.contextPath}/resources/css/basic/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/basic/layout.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/basic/header.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/basic/footer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/myrecord/myrecord.css"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 선언 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


<title>sample</title>
</head>
<body>

	<div class="wrapper">
		<div class="wrap-header">
			<%@include file="/WEB-INF/views/basic/header.jsp"%>
		</div>
		<div class="wrap-body">
			<div class="wrap-main">
				<!-- 내가 할 곳 -->
				<div class="timer box">
					<div class="study-info">
						<ul>
							<li class="mem-id"><p>MEM_ID</p></li>
							<li>
								<div id="today">today</div>
								<div id="currentTime">currentTime</div>

							</li>
							<!-- 과목수에 따라 li 생성후 붙여넣기 -->
							<li>
								<div>
									<p>sub1</p>
								</div>
								<div>
									<p>time1</p>
								</div>
							</li>
							<li>
								<div>
									<p>sub2</p>
								</div>
								<div>
									<p>time3</p>
								</div>
							</li>
						</ul>
						<div class="btnGroup">
							<button type="button" id="start" class="btn">
								<P>시작</P>
							</button>
							<button type="button" id="stop" class="btn">
								<p>멈춤</p>
							</button>
						</div>
					</div>
					<div class="study-countdown-box">
						<div class="study-countdown">
							<p id="countdown"></p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(loadedHandler);
		function loadedHandler() {
			$("#start").on("click", startClickHandler);
			$("#stop").on("click", stopClickHandler);
			$("#today").ready(function() {
				todayHandler();
			});
			$("#currentTime").ready(function() {
				currentTime();
				setInterval(currentTime, 1000);
			});

			/*  함수();*/
		}

		let intervalCountdownID;
		let startTime;
		let endTime;
		let diffMSec;
		let diffMin;
		let diffHour;
		let diffTime;

		function startClickHandler() {
			startTime = new Date();
			intervalCountdownID = setInterval(intervalCountdownCb, 1000, "p1",
					"p2");

		}
		function stopClickHandler() {
			endTime = new Date();
			clearInterval(intervalCountdownID);

		}
		/* 시간 계산 setInterval 사용 */
		function intervalCountdownCb() {
			nowTime = new Date();
			/* 
			diffMSec = nowTime.getTime() - startTime.getTime();
			diffHour = Math.floor(diffMSec / (60 * 60 * 1000));
			diffMin = Math.floor(diffMSec / (60 * 1000));
			 */
			diffMSec = nowTime.getTime() - startTime.getTime();
			diffHour = Math.floor(diffMSec / (60 * 60 * 1000));
			diffMin = Math.floor(diffMSec / (60 * 1000));
			diffMSec = Math.floor(diffMSec / 1000);

			if (diffMSec < 10) {
				diffMSec = '0' + diffMSec;
			}
			if (diffHour < 10) {
				diffHour = '0' + diffHour;
			}
			if (diffMin < 10) {
				diffMin = '0' + diffMin;
			}

			diffTime = diffHour + ":" + diffMin + ":" + diffMSec;
			$("#countdown").text(diffTime);
			/* 확인용 */
			console.log(diffHour + ":" + diffMin + ":" + diffMSec);

		}

		/* 날짜 표현하기 */
		function todayHandler() {
			var time = new Date();
			console.log("time : " + time.toDateString());
			var month = time.getMonth() + 1;
			var date = time.getDate();
			var day = time.getUTCDay();
			var day2 = time.getDay();
			var week;
			console.log(typeof 0);
			console.log("getDay : " + day2);

			/* 요일이 이상해요 */
			switch (day) {
			case 0:
				week = '수요일';
			case 1:
				week = '목요일';
			case 2:
				week = '금요일';
			case 3:
				week = '토요일';
			case 4:
				week = '일요일';
			case 5:
				week = '월요일';
			case 6:
				week = '화요일';
			}
			var today = month + "월 " + date + "일 " + week;
			$("#today").text(today);

		}

		function currentTime() {
			var time = new Date();
			var localTime = time.toLocaleTimeString();
			$("#currentTime").text(localTime);

		}

		/* today(); */
	</script>
</body>
</html>