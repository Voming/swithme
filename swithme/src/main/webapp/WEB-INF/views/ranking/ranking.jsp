<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
					<div class="daily">
						<div class="daily-bar">
							<%-- <p class="ranknum">나의 순위는 ___ 입니다.</p>
							<div class="ranking-wrap">
								<div class="ranknum"><p>1</p></div>
								<div class="memId">${loginInfo.memId }</div>
								<div class="studyrecord">00:36:00</div>
								<div class="rank-bar"><div data-width="${loginInfo.memId }"><span>${loginInfo.memId }</span></div></div>							
							</div> --%>
						</div>
					</div>
				</div>
				<div id="tab02">
					<div class="monthly">
						<div class="monthly-bar">
							<p class="ranknum">나의 순위는 ___ 입니다.</p>
							<div class="ranking-wrap">
									<div class="ranknum"><p>1</p></div>
									<div class="memId">${loginInfo.memId }</div>
									<div class="studyrecord">00:36:00</div>
									<div class="rank-bar"><div data-width="${loginInfo.memId }"><span>${loginInfo.memId }</span></div></div>							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	
<!-- 	- 일간/월간 controller 분리
- dto 만들기
- idx 가 0부터 시작이라서 count라는 변수 선언하고 1을 집어넣어서 그걸로 숫자 표시하기
-  -->
<!-- 공간 차지 안하지만 실제 테이블처럼 활용(가상 테이블) - view -->

<script>

$(loadedHandler);

function loadedHandler(){
	
	$('.btn.tab01').on('click', btnDailyClickHandler);
	$('.btn.tab02').on('click', btnMonthlyClickHandler);
	 btnDailyClickHandler();
}

var chartLabel='';
var charthours=0;
var chartminutes=0 ;
var chartseconds=0;



function btnDailyClickHandler() {

	$('.monthly').hide();
    $('.daily').show();
    $(this).css('background-color', '8066FF').css('color', 'white');
    $('.btn.tab02').css('background-color', 'white').css('color', 'black');
    
 	$.ajax({
		url: "${pageContext.request.contextPath}/ranking/daily",
		method: "post", 
		dataType: 'json',
		success: function(result){
			console.log(result);
			/* result 가 list 하나여서 for문 돌려서 사용 - 기존의 경우 받는 값이 list 하나였기 때문에 그냥 result 만 쓰면됐었는데....  */
			displayDailyWrap(result.dailyTime, result.dailyTopTime);
			/* controller에서 매개변수를 두개 받아서 result 에서 둘 다 꺼내서 사용*/
			
		}, 
		error: ajaxErrorHandler
		
	});
 	

}

function displayDailyWrap(datalist, dailyTopTime){
	console.log("displayDailyWrap >>>>>");
	var htmlVal = '';
	if(datalist.length == 0) {
		htmlVal += `<div class="rankNone"><p>순위가 없습니다.</p></div>`;
	} else {
		var count = 1;
		for(var idx in datalist) {
			var dailyTime = datalist[idx];
			//시간 단위 변경 초-> 00:00:00
			chartLabel='';
			/* 반복문이라서 얘를 선언 안하고 돌면 이전 기록이 있는 상태에서 다음 기록 추가되서 출력됨
 			  => 초기화 해줌*/
			charthours =  parseInt(dailyTime.difftime/(60*60)).toString().padStart(2, '0');
 			  /* padStart -> 2자리인데 공란은 0으로 채워줘 */
 			  /* 총자리수, 공란 => 왼쪽부터 차례대로 채움  */
 			chartminutes = parseInt(dailyTime.difftime/60-charthours*60).toString().padStart(2, '0');
			chartseconds = parseInt(dailyTime.difftime-chartminutes*60-charthours*60*60).toString().padStart(2, '0');
			chartLabel += charthours+' : '+chartminutes+' : '+chartseconds;			
			console.log(chartLabel);
			htmlVal += `
				<div class="ranking-wrap">
					<div class="ranknum"><p>\${count}</p></div>
					<div class="memId" onclick="location.href='${pageContext.request.contextPath}/group/selecteduser/info?memId=\${dailyTime.recordMemId}'" style="cursor: pointer;">\${dailyTime.recordMemId}</div>
					<div class="studyrecord">\${chartLabel}</div>
					<div class="rank-bar"><div class="rank-bar-child" data-width="\${dailyTime.recordMemId}"><span>\${dailyTime.recordMemId}</span></div><input type="hidden" name="chartsec" value="\${dailyTime.difftime}"></div>
				</div>
				`;	
					/* memId 에서 list 형태로 왔기 때문에 하나씩 꺼내줘야함 */
			count++;
		}
	}
	
	$('.daily-bar').html(htmlVal);
	$('.daily-bar').children().eq(0).children('.ranknum').css('background-color', '8066FF').css('color', 'white');
	$('.daily-bar').children().eq(1).children('.ranknum').css('background-color', 'var(--color_purple_2)').css('color', 'white');
	$('.daily-bar').children().eq(2).children('.ranknum').css('background-color', 'var(--color_pink_1)').css('color', 'white');
 	
	
	
 		console.log(dailyTopTime);
 		console.log(((10000 / dailyTopTime)*100)+'%');
	
 		if(dailyTopTime > 0) {
		 	$(".rank-bar-child").each(function(idx, item){
		 		//.rank-bar-child 가 위에서 반복문을 돌고 있어서 여러개 출력 됨
		 		console.log($(item)[0]);
		 		var porportion = $(item).next().val() / dailyTopTime;
		 		/* 0.xx 나옴 - 1등은 1이라서 width=100% */
		 		/* sql문에서 순서대로 뽑히게 했기 때문에  */
		 		console.log(porportion);
		 		$(item).css("width", (porportion*100)+'%');
		 	});

 		} 
 		
}


function btnMonthlyClickHandler() {
	
    $('.daily').hide();
    $('.monthly').show();
    $(this).css('background-color', '8066FF').css('color', 'white');
    $('.btn.tab01').css('background-color', 'white').css('color', 'black');

	console.log('${loginInfo.memId}');
	
	$.ajax({
		url: "${pageContext.request.contextPath}/ranking/monthly",
		method: "post",
		/* 이 함수 안에서 변수 선언해서 정의해줘야 memId 값 사용 가능
			- 그냥 el태그 써서 보내려하면 not defined라는 오류 뜸 */
		dataType: 'json',
		success: function(result){
			console.log("monthly : " + result);
			displayMonthlyWrap(result);
		},
		error: ajaxErrorHandler
	});

} 


function displayMonthlyWrap(datalist){
	console.log('${loginInfo.memId}');
	
	var htmlVal =  '';
	if(datalist.length == 0) {
		htmlVal += `<div class="rankNone"><p>순위가 없습니다.</p></div>`;
	} else {
		var count = 1;
		for(var idx in datalist) {
			var monthlyTime = datalist[idx];
			//시간 단위 변경 초-> 00:00:00
			chartLabel='';
			/* 반복문이라서 얘를 선언 안하고 돌면 이전 기록이 있는 상태에서 다음 기록 추가되서 출력됨
 			  => 초기화 해줌*/
			charthours =  parseInt(monthlyTime.difftime/(60*60)).toString().padStart(2, '0');
 			  /* padStart -> 2자리인데 공란은 0으로 채워줘 */
 			  /* 총자리수, 공란 => 왼쪽부터 차례대로 채움  */
 			chartminutes = parseInt(monthlyTime.difftime/60-charthours*60).toString().padStart(2, '0');
			chartseconds = parseInt(monthlyTime.difftime-chartminutes*60-charthours*60*60).toString().padStart(2, '0');
			chartLabel += charthours+' : '+chartminutes+' : '+chartseconds;			
			console.log(chartLabel);
			htmlVal += `
					<div class="ranking-wrap">
						<div class="ranknum"><p>\${count}</p></div>
						<div class="memId"  onclick="location.href='${pageContext.request.contextPath}/group/selecteduser/info?memId=\${monthlyTime.recordMemId}'" style="cursor: pointer;">\${monthlyTime.recordMemId}</div>
						<div class="studyrecord">\${chartLabel}</div>
						<div class="rank-bar"><div data-width="\${monthlyTime.recordMemId}"><span>\${monthlyTime.recordMemId}</span></div></div>							
					</div>
				`;	
			count++;
		}
	}
	
	$('.monthly-bar').html(htmlVal);
	console.log($('.monthly-bar').children().eq(0).children('.ranknum'));

	$('.monthly-bar').children().eq(0).children('.ranknum').css('background-color', '8066FF').css('color', 'white');
	$('.monthly-bar').children().eq(1).children('.ranknum').css('background-color', 'var(--color_purple_2)').css('color', 'white');
	$('.monthly-bar').children().eq(2).children('.ranknum').css('background-color', 'var(--color_pink_1)').css('color', 'white');
}

//ajax error 부분
function ajaxErrorHandler (request, status, error){
	//controller에서 전달해준 값 여기서 호출
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}



/* ajax 사용시 db로 보낼 값이 없으면 data 빼고 쓰면 됨 */
 

</script>

	
</body>
</html>