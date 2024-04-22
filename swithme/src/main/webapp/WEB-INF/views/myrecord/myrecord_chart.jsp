<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  샘플
/* 도넛차트
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
 -->  
    
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
//당일 과목별 학습 todayStudyTime
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
	subjectColorList.push(chooseColor(result[i].subjectColor));
	
	//확인용
	//console.log("result[i].subjectName   :"+result[i].subjectName);
	//console.log("result[i].subjectColor : "+chooseColor(result[i].subjectColor));
	//console.log("coloNum"+chooseColor(colorNum));
	//console.log(chooseColor(result[i].subjectColor));
}
//console.log("+++++++++++++subejctNameList "+subejctNameList);
//console.log("+++++++++++++recordTimeList "+recordTimeList);
//console.log("+++++++++++++subjectColorList "+subjectColorList);
	var data = {
		 	labels:  subejctNameList,
			datasets: [{
			    label: '오늘의 공부시간',
			    data:recordTimeList ,
			    backgroundColor:subjectColorList,    //subjectColorList, '#FFE16F','#AED581','#99BBFF','#BF80FF'
			    hoverOffset: 4
			  }]
			};
	
	
	//그래프 생성
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
	type : 'doughnut',
	data : data,
	//TODO옵션 강사님께 물어보기
	/*
	options:{
		plugins:{
			tooltip:{
				callbacks:{
					label: function(context){
						console.log(">>>>> context      "+context);
						console.log("Context data:"+ context.dataset.data);
						var chartLabel=context.dataset.label || '';
						if (chartLabel) {
							chartLabel +=':';
						}
						//TODO 강사님께 물어보기
						console.log("-----y! if 박!!     "+context.parsed.y);
						if (context.parsed.y !== null) {
							console.log("-----y!         "+context.parsed.y);
                             var charthours = parseInt(context.parsed.y/(60*60));
                             var chartminutes = parseInt(context.parsed.y/60-charthours*60);
                             var chartseconds = parseInt(context.parsed.y-chartminutes*60-charthours*60*60);
                             chartLabel += charthours+'시 '+chartminutes+'분 '+chartseconds +'초';// 시간 값을 시:분:초 형식으로 표시
						}
						return chartLabel
					}
				}
			}
		}
	}//options
	*/
	});

}
});
}	

/**********************************************/


	
</script>