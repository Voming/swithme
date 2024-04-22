<jsp:include page="/WEB-INF/views/common/links_file.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 선언 및 css연결 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link	href="${pageContext.request.contextPath}/resources/css/myrecord/myrecord.css"	rel="stylesheet">
<!--chart.js CDN  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- moment CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<!-- 풀캘린더 CDN -->

<script	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp" />
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
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
							<li><a href="${pageContext.request.contextPath}/testcalendar">시험달력</a></li>
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
									<li class="mem-id"><p>MEM_ID</p></li>
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
													<div id="${vo.subjectName}" class="subId" data-subject-name="${vo.subjectName}" data-subject-id="${vo.subjectId}" >${vo.subjectName}</div>
												</c:otherwise>
											</c:choose> <c:choose>
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
							<!-- TODO 과목 수정 -->
							<div>
								<button type="button" class="btn re-sub btn-primary"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop">
									<p>과목 수정하기</p>
								</button>
								<!-- Modal -->
								<div class="add-sub modal" id="staticBackdrop">
									<div class="modal-dialog .modal-dialog-centered">
										<div class="modal-content">
											<div class="btn modal-close" data-bs-dismiss="modal">x</div>
											<!-- controller 추가 -->
											<form id="frm-modify">
												<div class="subject ">
													<p class="title">수정할 과목 이름</p>
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
												<button class="btn remove-sub" type="button" data-bs-dismiss="modal">
													<p>삭제</p>
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
											<div class="btn modal-close" data-bs-dismiss="modal">x</div>
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
						<div class="sub-title">
							<p>출석</p>
						</div>
						<div id='calendar' class="study-calender"></div>
						<div class="statistics-part">
							<div class="sub-title">
								<p >통계</p>
							</div>
							<canvas id="myChart"></canvas>
<script>
$(document).ready(function(){
	todayStudyTime();
});
let subejctNameList =[];
let recordTimeList=[];
let subjectColorList=[];
var colorNum; //세미콜론
var numnum;
function chooseColor(colorNum){
var colNum;
switch (colorNum) {
	case '1':
		colNum = '#FFB3E5';
		break;
	case '2':
		colNum = '#FFE16F';
		break;
	case '3':
		colNum = '#AED581';
		break;
	case '4':
		colNum = '#99BBFF';
		break;
	case '5':
		colNum = '#BF80FF';
		break;
	
}//괄호 위치 중요
return colNum;
}
function todayStudyTime(){
$.ajax({
url: "${pageContext.request.contextPath }/myrecord/todayrecord.ajax"
,method:"post"
,error : ajaxErrorHandler
,data : {numnum : numnum} //data없인 안되는걸까??
,dataType:"json"
,success: function(result){
//console.log("-------------------   "+result[0].subjectName);
for(let i = 0 ; i < result.length;i++){	
	subejctNameList.push(result[i].subjectName);
 	//if (result[i].difftime !== null && result[i].difftime === undefined) {
    //console.log(result[i].difftime);
  	//} 
  
  	if ( result[i].difftime === undefined ) {//null은 아니고 undefined상황
	   // recordTimeList.push(moment('00:00:00', 'HH:mm:ss').format('HH:mm:ss'); //오류
	   	var nullChangeDate=moment('00:00:00', 'HH:mm:ss').format('HH:mm:ss');
	   	nullChangeDate= moment.duration(nullChangeDate).asSeconds();
	   
	   	recordTimeList.push(nullChangeDate);
	    console.log("recordTimeList    -> "+recordTimeList[i]);
	} else {
		var changeDate;
		//changeDate= moment(result[i].difftime, 'HH:mm:ss').format('HH:mm:ss'); 
		changeDate = moment.duration(result[i].difftime).asSeconds();
		//콘솔확인
		console.log("changeDate    -> "+changeDate);
	    recordTimeList.push(changeDate);
	}
  	let a = result[i].subjectColor;
  	console.log(a);
  	console.log("a엔 어떤게 들었을까 ?   "+chooseColor(a));
	subjectColorList.push(chooseColor(a));
	
	//확인용
	//console.log("result[i].subjectName   :"+result[i].subjectName);
	//console.log("result[i].subjectColor : "+chooseColor(result[i].subjectColor));
	//console.log("coloNum"+chooseColor(colorNum));
	//console.log(chooseColor(result[i].subjectColor));
}
console.log("+++++++++++++subejctNameList "+subejctNameList);
console.log("+++++++++++++recordTimeList "+recordTimeList);
console.log("+++++++++++++subjectColorList "+subjectColorList);
}
});
}	
//todayStudyTime
/**********************************************/

	var data = {
			 	labels:  subejctNameList,
				datasets: [{
				    label: '오늘의 공부시간',
				    data:recordTimeList ,
				    backgroundColor:subjectColorList,    //subjectColorList, '#FFE16F','#AED581','#99BBFF','#BF80FF'
				    hoverOffset: 4
				  }]
				};

/*
 const data = {
		  labels: [
		    'Red',
		    'Blue',
		    'Yellow'
		    ,'ㅇㅇ'
		    ,'ㅁㅇㄴㄹ'
		  ],
		  datasets: [{
		    label: 'My First Dataset',
		    data: [300, 50, 100,12,34],
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 205, 86)',
		      'rgb(255, 205, 86)',
		      'rgb(255, 205, 86)'
		    ],
		    hoverOffset: 4
		  }]
		};
*/
	// 그래프 옵션
/*
	var options = {
		scales : {

            x: {
                type: 'category',
      
                }
            }
		};

*/
	//그래프 생성
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		//options : options
	});
	
</script>
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
$(loadedHandler);
function loadedHandler() {

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
}
		
		/*과목 이름 클릭시 해당과목이름 화면에 띄움, subjectName 받아오기 */
/* 		
function ready() {$(".subId").on("click",subIdClickHandler);}
document.addEventListener("DOMContentLoaded", ready);
function subIdClickHandler(){
	var tagId = $(this).data('subject-name');
	alert(tagId);
	
} 
*/
// 과목선택하기
function subIdClickHandler(){
	 subjectName = $(this).data('subject-name');
	 subjectId = $(this).data('subject-id');
	 
	$("#selSub").text(subjectName);
}
// 과목 수정하기
function btnModifyDoneSubjectClickHandler(){
//TODO
}
// 과목 추가하기  
function btnAddSubjectClickHandler() {
	console.log($("#frm-add").serialize());
	var frm = document.getElementById("frm-add");
	frm.method = "post";
	frm.action = "${pageContext.request.contextPath}/addsubject";
	frm.submit();
}
//과목 수정하기초입
function btnReSubClickHandler(){
	console.log("아아아아아아앍   "+subjectName);
	if(subjectName == null){
		alert("수정할 과목을 먼저 선택해주세요");
		//이벤트 전 화면으로 이동
		history.back();
	}
}
//과목 삭제하기
function btnRemoveSubjectClickHandler(){
	var deleteTime = getCurrentDateTime(); 
	//console.log("name=selectNameM-------> "+$("[name=selectNameM]").val());
	console.log("deleteTime ------> "+deleteTime);
	console.log("subjectId ------> "+subjectId);

	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/myrecord/deletesubject.ajax",
		data : {subjectId : subjectId, deleteTime: deleteTime },
		error : ajaxErrorHandler,
		success : function(result) {
			console.log("delete 성공");
			alert("삭제되었습니다");
			location.reload(true);
		}
	});
	
}
let intervalCountdownID;
let startTime;
let endTime;
let diffMSec;
let diffMin;
let diffHour;
let diffTime;

/* 	
// 10보다 작은 값에 0을 붙임
function addZero(n) {
	return n < 10 ? '0' + n : n;
}
// 현재 시간을 리턴
function getCurrentDate() {
	var currentDate = new Date();
	return currentDate.getFullYear().toString()
			+ addZero(currentDate.getMonth() + 1)
			+ addZero(currentDate.getDate())
			+ addZero(currentDate.getHours())
			+ addZero(currentDate.getMinutes())
			+ addZero(currentDate.getSeconds());
		} */

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
			console.log("start 성공");
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
			console.log("성공");
			//location.replace="${pageContext.request.contextPath}/myrecord";
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
</body>
</html>