<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--부트스트랩  -->
<link href="${pageContext.request.contextPath}/resources/bootstrap-5.0.2/bootstrap.min.css" rel="stylesheet" />
<!-- jQuery 선언 및 css연결 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link	href="${pageContext.request.contextPath}/resources/css/myrecord/myrecord.css"	rel="stylesheet">
<!--chart.js CDN  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js" rel="stylesheet">
<script src="https://fastly.jsdelivr.net/npm/chart.js"></script>
<!-- moment CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<jsp:include page="/WEB-INF/views/common/common_function.jsp" />
<script>

</script>


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
							<li><a href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a href="${pageContext.request.contextPath}/test">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr>
				</div>
			</header>
		</div>
		<c:choose>
			<c:when test="${empty loginInfo }">
				<div class="wrap-welcome">
					<div class="check-login">
						<button type="button" class="btn join"
							onclick="location.href='${pageContext.request.contextPath}/join'">회원가입</button>
						<button type="button" class="btn login"
							onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="wrap-body">
					<div class="wrap-main">
					<div class="myrecord">
						<!-- 내가 할 곳 -->
						<div class="timer box">
							<div class="study-info">
								<ul class="sujblsit">
									<li class="mem-id"><p id="${memId}" class="mem">${memId}</p></li>
									<li>
										<div id="today">today</div>
										<div id="currentTime">currentTime</div>

									</li>
									<!-- 과목수에 따라 li 생성후 붙여넣기 -->
									<c:forEach items="${sublist}" var="vo" varStatus="vs">
										<li>
										<c:choose>
												<c:when test="${empty vo.subjectName}">
													<div>
														<p>총 공부시간</p>
													</div>
												</c:when>
												<c:otherwise>
													<div id="${vo.subjectName}" class="subId" data-subject-name="${vo.subjectName}" data-subject-id="${vo.subjectId}" data-subject-color="${vo.subjectColor}">${vo.subjectName}</div>
												</c:otherwise>
											</c:choose> 
											<c:choose>
												<c:when test="${empty vo.difftime}">
													<div>
														<p>00:00:00</p>
													</div>
												</c:when>
												<c:otherwise>
													<div>${vo.difftime}</div>
												</c:otherwise>
											</c:choose>
											</li>
									</c:forEach>

								</ul>
								<div class="btnGroup">
									<button type="button" id="start" class="btn start">
										<P>시작</P>
									</button>
									<button type="button" disabled="true" id="stop"
										class="btn stop">
										<p>종료</p>
									</button>
								</div>
							</div>
							<div class="study-countdown-box">
								<div class="study-countdown">
									<div>
										<p id="selSub">과목명</p>
									</div>
									<div>
										<p id="countdown">00:00:00</p>
									</div>
								</div>
							</div>
						</div>
						<div class="subject-modal">
							<!-- TODO 과목 삭제 -->
							<div>
								<button class="btn remove-sub" type="button" data-bs-dismiss="modal">
									<p>과목 삭제하기</p>
								</button>
							</div>
							<!-- TODO 과목 수정 -->
							<div>
								<button type="button" class="btn re-sub btn-primary">
									<p>과목 수정하기</p>
								</button>
								<!-- Modal -->
								<div class="add-sub modal" id="staticBackdrop">
									<div class="modal-dialog .modal-dialog-centered">
										<div class="modal-content">
											<!-- <div class="btn modal-close" data-bs-dismiss="modal">x</div> -->
											<!-- controller 추가 -->
											<form id="frm-modify">
												<div class="subject ">
													<p class="title" id="bfore-title">수정할 과목 이름</p>
												</div>
												<div class="modify-name">
													<input type="text" name="subNameM"
														placeholder="     e.g 자바, 파이썬, SQL">
												</div>
												<div class="sub-color">
													<p>과목 색상</p>
													<select name="selectColorM">
														<option value="1">핑크</option>
														<option value="2">노랑</option>
														<option value="3">초록</option>
														<option value="4">파랑</option>
														<option value="5">보라</option>
													</select>
												</div>
												<div><p>변경할 색상을 선택하지 않으면 핑크가 기본 색깔로 지정됩니다</p></div>
												<!-- 취소버튼 -->
												<button class="btn" type="button" data-bs-dismiss="modal">
													<p>취소</p>
												</button>
												<button type="submit" class="btn modify-done">
													<p>완료</p>
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- 과목추가 -->
							<div>
								<!-- Modal -->
								<button type="button" class="btn add" data-bs-toggle="modal"
									data-bs-target="#exampleModal2">
									<p>과목 추가하기</p>
								</button>

								<!-- Modal -->
								<div class="add-sub modal" id="exampleModal2">
									<div class="modal-dialog .modal-dialog-centered">
										<div class="modal-content">
											<!-- <div class="btn modal-close" data-bs-dismiss="modal">x</div> -->
											<!-- controller 추가 -->
											<form id="frm-add">
												<div class="subject ">
													<p class="title">추가할 과목 이름</p>
												</div>
												<div class="add-name">
													<input type="text" name="subName"
														placeholder="     e.g 자바, 파이썬, SQL">
												</div>
												<div class="sub-color">
													<p>과목 색상</p>
													<select name="selectColor">
														<option value="1">핑크</option>
														<option value="2">노랑</option>
														<option value="3">초록</option>
														<option value="4">파랑</option>
														<option value="5">보라</option>
													</select>
												</div>
												<button class="btn" type="button" data-bs-dismiss="modal">
													<p>취소</p>
												</button>
												<button type="submit" class="btn done">
													<p>완료</p>
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="statistics-part">
							<div class="sub-title grid-item">
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

							<jsp:include page="/WEB-INF/views/myrecord/myrecord_chart.jsp"></jsp:include>
						</div>
					</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
<script type="text/javascript">
let subjectName;
let subjectId;
let subjectColor;
$(document).ready(function(){  
	//console.log("myrecord - document ready !!!!");
	myrecord_chart_jsp_loadedHandler();
	
	$("#start").on("click", startClickHandler);
	$("#stop").on("click", stopClickHandler);

	$("#today").ready(function() {
		todayHandler();
	});

	$("#currentTime").ready(function() {
		currentTimeHandler();
		setInterval(currentTimeHandler, 1000);
	});

	/* 과목  추가하기 */
	$(".btn.done").on("click", btnAddSubjectClickHandler);
	/* 과목  선택하기 */
	$(".subId").on("click",subIdClickHandler);
	/*과목 수정하기 과목추가 옆버튼(수정,삭제의 부모버튼)*/
	$(".btn.re-sub.btn-primary").on("click", btnReSubClickHandler);
	/*과목 수정하기 */
	$(".btn.modify-done").on("click", btnModifyDoneSubjectClickHandler);
	/* 과목 삭제하기 */
	$(".btn.remove-sub").on("click", btnRemoveSubjectClickHandler);
});
		

// 과목선택하기
function subIdClickHandler(){
	 subjectName = $(this).data('subject-name');
	 subjectId = $(this).data('subject-id');
	 subjectColor = $(this).data('subject-color');
	$("#selSub").text(subjectName);
}
//과목 삭제하기
function btnRemoveSubjectClickHandler(){
	
	/* 삭제할 과목이 선택 되었는가 */
	if(subjectName == null){
		alert("삭제할 과목을 먼저 선택해주세요");
	}else{
		var deleteTime = getCurrentDateTime(); 

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/myrecord/deletesubject.ajax",
			data : {subjectId : subjectId, deleteTime: deleteTime },
			error : ajaxErrorHandler,
			success : function(result) {
				alert("삭제되었습니다");
				location.reload(true);
			}
		});
	}
}
//과목 수정하기초입
function btnReSubClickHandler(){
	if(subjectName == null){
		alert("수정할 과목을 먼저 선택해주세요");
	}else{
		$("#bfore-title").text(subjectName);
		var col=chooseBorderColor(String(subjectColor));
		$("#bfore-title").css('color',col);
		var myReSubModal = new bootstrap.Modal(document.getElementById('staticBackdrop')); 
		myReSubModal.show();
	}
}

// 과목 수정하기
function btnModifyDoneSubjectClickHandler(){
	
	var subNameModi =$(this).parent().children().find('input[name="subNameM"]').val();
	var colorModi =$(this).parent().children().find('select[name="selectColorM"]').val();
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/myrecord/modify.ajax",
		data : {subjectName : subjectName, subNameModi: subNameModi,colorModi:colorModi },
		error : ajaxErrorHandler,
		success : function(result) {
			//console.log("-------- ajax result");
			//console.log(result);
			if(result != -1){			
				alert("수정이 완료되었습니다.");
			}else{
				alert("수정 실패애앩!!!");
			}
			location.reload(true);
		}
	});
}
// 과목 추가하기  
function btnAddSubjectClickHandler() {
	//console.log($("#frm-add").serialize());
	var frm = document.getElementById("frm-add");
	frm.method = "post";
	frm.action = "${pageContext.request.contextPath}/addsubject";
	frm.submit();
}


let intervalCountdownID;
let startTime;
let endTime;
let diffMSec;
let diffMin;
let diffHour;
let diffTime;

function startClickHandler() {
	
	if(subjectName == null){
		alert("과목을 선택 후 시작해주세요. 과목을 추가하지 않았다면 과목추가도 함께 진행해주세요");
		return;
	}
	var sendDateTime = getCurrentDateTime(); 
	startTime = new Date();
	intervalCountdownID = setInterval(intervalCountdownCb, 1000, "p1","p2");

	//버튼 활성화
	$("#start").attr("disabled", true);
	$("#stop").attr("disabled", false);
	
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/myrecord/recordstart.ajax",
		data : {subjectId : subjectId, startTime: sendDateTime },
		error : ajaxErrorHandler,
		success : function(result) {
		}
	});

}
function stopClickHandler() {
	var sendDateTime = getCurrentDateTime(); 
	endTime = new Date();

	clearInterval(intervalCountdownID);

	//버튼 활성화
	$("#start").attr("disabled", false);
	$("#stop").attr("disabled", true);

	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/myrecord/recordend.ajax",
		data : {subjectId : subjectId, endTime: sendDateTime },
		error : ajaxErrorHandler,
		success : function(result) {
			location.reload(true);
		}
	});
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
	diffSec = diffMSec / 1000;
	diffHour = Math.floor(diffSec / (60 * 60));
	diffMin = Math.floor(diffSec / 60 - diffHour * 60);
	diffMSec = Math.floor(diffSec - diffMin * 60 - diffHour * 60 * 60);

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

}

/* 날짜 표현하기 */
function todayHandler() {
	var time = new Date();
	var month = time.getMonth() + 1;
	var date = time.getDate();
	var day = time.getUTCDay();
	var day2 = time.getDay();
	var week;

	switch (day2) {
	case 0:
		week = '일요일';
		break;
	case 1:
		week = '월요일';
		break;
	case 2:
		week = '화요일';
		break;
	case 3:
		week = '수요일';
		break;
	case 4:
		week = '목요일';
		break;
	case 5:
		week = '금요일';
		break;
	case 6:
		week = '토요일';
		break;
	}
	var today = month + "월 " + date + "일 " + week;
	$("#today").text(today);

}

function currentTimeHandler() {
	var time = new Date();
	var localTime = time.toLocaleTimeString();
	$("#currentTime").text(localTime);

}

		/* today(); */
	</script>
<!-- full calendar -->
<script src="${pageContext.request.contextPath}/resources/fullcalendar-6.1.11/dist/index.global.js"></script>
<script src="${pageContext.request.contextPath}/resources/fullcalendar-6.1.11/dist/index.global.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/bootstrap-5.0.2/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap-5.0.2/bootstrap.bundle.min.js"></script>

</body>
</html>