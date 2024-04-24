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
	//fourdayStudyTime();
});
let subejctNameList =[];
let recordTimeList=[];
let subjectColorList=[];
let datePre = new Date().getDate();

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
//,data : {numnum : numnum} //data없인 안되는걸까??
,dataType:"json"
,success: function(resultMap){
	console.log("---->>>>  resultMap");
	console.log(resultMap);
	console.log(resultMap.dayStudyTimeList);
	console.log(resultMap.fourdayStudyTimeList);
	displayTodayStudyTime(resultMap.dayStudyTimeList);
	displayFourdayStudyTimeChart(resultMap.fourdayStudyTimeList);
	}  // successcbf
});  // ajax
}  // f

/**** myChart1 ******************************************/
function displayTodayStudyTime(result){
	for(let i = 0 ; i < result.length;i++){	
		subejctNameList.push(result[i].subjectName);
	  
	  	if ( result[i].difftime === undefined ) {
		   	var nullChangeDate=moment('00:00:00', 'HH:mm:ss').format('HH:mm:ss');
		   	nullChangeDate= moment.duration(nullChangeDate).asSeconds();
		   
		   	recordTimeList.push(nullChangeDate);
		    console.log("recordTimeList    -> "+recordTimeList[i]);
		} else {
			var changeDate;
			changeDate = moment.duration(result[i].difftime).asSeconds();
			//콘솔확인
			console.log("changeDate    -> "+changeDate);
		    recordTimeList.push(changeDate);
		}
		subjectColorList.push(chooseColor(result[i].color));
		
	}
		var data = {
			 	labels:  subejctNameList,
				datasets: [{
				    label: '오늘의 공부시간',
				    data:recordTimeList ,
				    backgroundColor:subjectColorList,   
				    hoverOffset: 4
				  }]
				};
		
		
		//그래프 생성
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		type : 'doughnut',
		data : data,
		//TODO옵션 강사님께 물어보기

		options:{
			responsive: false,
			plugins:{
				tooltip:{
					callbacks:{//함수가 끝나고 난 뒤 실행되는 함수
						label: function(context){
							
							var chartLabel=context.label || '';
							if (chartLabel) {
								chartLabel +=' : ';
							}
							console.log("----- parsed !!     ");
							console.log(context.parsed);
	                        var charthours = parseInt(context.parsed/(60*60));
	                        var chartminutes = parseInt(context.parsed/60-charthours*60);
	                        var chartseconds = parseInt(context.parsed-chartminutes*60-charthours*60*60);
	                        chartLabel += charthours+'시 '+chartminutes+'분 '+chartseconds +'초';// 시간 값을 시:분:초 형식으로 표시
							return chartLabel
						}
					}
				}
			}
		}//options

		});
}
/**** myChart2 ******************************************/

let foursubejctNameList =[];
let fourrecordTimeList=[];
let foursubjectColorList=[];
let recordDateList=[]; 

function displayFourdayStudyTimeChart (result){
	const sub = new Array();

	for(let i = 0 ; i < result.length;i++){	
		var resultItem = result[i];
		foursubejctNameList[i] = result[i].subjectName;
	  	foursubjectColorList[i] = chooseColor(result[i].color);
		var diffTimeByDayList = result[i].diffTimeByDayList;
		var subData = new Array();
		for(let j=0; j<result[i].diffTimeByDayList.length; j++){
			subData[j] = diffTimeByDayList[j].difftime;
			if(i==0) {
				recordDateList[j] = diffTimeByDayList[j].onlyDate;
			}
		}
		console.log("subData");
		console.log(subData);
		fourrecordTimeList[i] = {
		        label: result[i].subjectName,
		        data:subData,
		        backgroundColor: chooseColor(result[i].color),
		        borderColor:'#CBCE91',
		        borderWidth:1
		};
	}
	console.log("4일치 데이터 뽑아옴");
	console.log(foursubejctNameList);
	console.log(foursubejctNameList);
	console.log(fourrecordTimeList);
	console.log(foursubjectColorList);
	console.log(recordDateList);
	/* 	var data = {
			 	labels:  subejctNameList,
				datasets: [{
				    label: '오늘의 공부시간',
				    data:recordTimeList ,
				    backgroundColor:subjectColorList,    //subjectColorList, '#FFE16F','#AED581','#99BBFF','#BF80FF'
				    hoverOffset: 4
				  }]
				}; */
				/*
		//과목별로 const가 생성되어야한다.	day가 아님	
		const sub0 = {
		        label:foursubejctNameList[0],
		        data:[2,1,5],
		        backgroundColor:foursubjectColorList[0],
		        borderColor:'#CBCE91',
		        borderWidth:1
		}
		const sub1 = {
		        label:foursubejctNameList[1],
		        data:[3,2,4],
		        backgroundColor:foursubjectColorList[1],
		        borderColor:'#CBCE91',
		        borderWidth:1
		}
		const sub2 = {
		        label:foursubejctNameList[3],
		        data:[4,3,3],
		        backgroundColor:foursubjectColorList[3],
		        borderColor:'#CBCE91',
		        borderWidth:1
		}
*/
		
		//그래프 생성
		// 여기
	var ctx = document.getElementById('myChart2').getContext('2d');
	var myChart = new Chart(ctx, {
	type : 'bar',
    data:{
    	//라벨에 날짜 넣기
        labels: recordDateList, //라벨에 날짜 
        datasets: fourrecordTimeList
    },
	options:{            
		scales:{

        	x:{ //x축값 누적
            	stacked:true
        	},
        	y:{ //y축값 누적
            	stacked:true
        	}
    	},
		plugins:{
			tooltip:{
				callbacks:{//함수가 끝나고 난 뒤 실행되는 함수
					label: function(context){
						console.log(context);
						var chartLabel=context.dataset.label || '';
						if (chartLabel) {
							chartLabel +=' : ';
						}
						console.log("----- parsed !!     ");
						console.log(context.parsed.y);
                        var charthours = parseInt(context.parsed.y/(60*60));
                        var chartminutes = parseInt(context.parsed.y/60-charthours*60);
                        var chartseconds = parseInt(context.parsed.y-chartminutes*60-charthours*60*60);
                        chartLabel += charthours+'시 '+chartminutes+'분 '+chartseconds +'초';// 시간 값을 시:분:초 형식으로 표시
						return chartLabel
					}
				}
			}
		}
	}//options

	});
	}
	
</script>