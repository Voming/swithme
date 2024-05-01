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
	
	
<!-- 공간 차지 안하지만 실제 테이블처럼 활용(가상 테이블) - view -->

<script>

$(loadedHandler);

function loadedHandler(){
	
	$('.btn.tab01').on('click', btnDailyClickHandler);
	$('.btn.tab02').on('click', btnMonthlyClickHandler);
}


function btnDailyClickHandler() {

	$('.monthly').hide();
    $('.daily').show();
    $(this).css('background-color', '8066FF').css('color', 'white');
    $('.btn.tab02').css('background-color', 'white').css('color', 'black');
    
/*  	$.ajax({
		url: "{pageContext.request.contextPath}/ranking",
		method: "post", 
		data: {memId :'${loginInfo.memId}'}, 
		dataType: 'json',
		success: function(result){
			console.result();
			displayDailyWrap();
		}, 
		error: ajaxErrorHandler
		
	}); */

}

/* function displayDailyWrap(){
	
	var htmlVal = '';
	htmlVal += `
		
		`;
	
	$('.daily-bar').html(htmlVal);
	
} */


function btnMonthlyClickHandler() {
	
    $('.daily').hide();
    $('.monthly').show();
    $(this).css('background-color', '8066FF').css('color', 'white');
    $('.btn.tab01').css('background-color', 'white').css('color', 'black');

	console.log('${loginInfo.memId}');
    
	var memId = '${loginInfo.memId}';
	
	$.ajax({
		url: "${pageContext.request.contextPath}/ranking/monthly",
		method: "post",
		data: { memId : memId },
		dataType: 'json',
		success: function(result){
			console.log("monthly : " + result);
			displayMonthWrap(result);
		},
		error: ajaxErrorHandler
	});
	
	

} 

function displayMonthWrap(datalist){
	console.log('${loginInfo.memId}');
	
	var htmlVal =  '';
	if(datalist.length == 0) {
		htmlVal += `<div class="rankNone"><p>순위가 없습니다.</p></div>`;
	} else {
		for(var idx in datalist) {
			var monthlyTime = datalist[idx];		
			htmlVal += `
					<div class="ranking-wrap">
						<div class="ranknum"><p>1</p></div>
						<div class="memId">${loginInfo.memId }</div>
						<div class="studyrecord">\${monthlyTime.difftime}</div>
						<div class="rank-bar"><div data-width="${loginInfo.memId }"><span>${loginInfo.memId }</span></div></div>							
					</div>
				`;		
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