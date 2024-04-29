<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  유저용 -->  
    
<script>
$(document).ready(function(){
	todayStudyTime();
});
let subejctNameList =[];
let recordTimeList=[];
let subjectColorList=[];

var colorNum; //세미콜론
function chooseColor(colorNum){
var colNum;
switch (colorNum) {
	case '1':
		colNum = 'rgba(255,179,229,0.5)';
		break;
	case '2':
		colNum = 'rgba(255,225,111,0.5)';
		break;
	case '3':
		colNum = 'rgba(174,213,129,0.5)';
		break;
	case '4':
		colNum = 'rgba(153,187,255,0.5)';
		break;
	case '5':
		colNum = 'rgba(191,128,255,0.5)';
		break;
	
}//괄호 위치 중요
return colNum;
}
//그래프 선 
function chooseBorderColor(colorNum){
var colNum2;
	switch (colorNum) {
		case '1':
			colNum2 = 'rgba(255,179,229,1)';
			break;
		case '2':
			colNum2 = 'rgba(255,225,111,1)';
			break;
		case '3':
			colNum2 = 'rgba(174,213,129,1)';
			break;
		case '4':
			colNum2 = 'rgba(153,187,255,1)';
			break;
		case '5':
			colNum2 = 'rgba(191,128,255,1)';
			break;
		
	}//괄호 위치 중요
	return colNum2;
	}
//당일 과목별 학습 todayStudyTime
function todayStudyTime(){
$.ajax({
url: "${pageContext.request.contextPath }/selecteduser/info.ajax"
,method:"post"
,error : ajaxErrorHandler
//,data : {memId:memId} //TODO 
,dataType:"json"
,success: function(resultMap){
	console.log("---->>>>  resultMap");
	console.log(resultMap);
	console.log(resultMap.dayStudyTimeList);
	console.log(resultMap.fourdayStudyTimeList);
	displayTodayStudyTime(resultMap.dayStudyTimeList);
	displayFourdayStudyTimeChart(resultMap.fourdayStudyTimeList);
	displayThirtydayStudyTime(resultMap.thirtydayStudyTime);
	displayThirtyDayStudyTimeBySubjectChart(resultMap.thirtydayStudyTimeBySubject);
	displayAccStudyTime(resultMap.accStudyTime);
	displayMonthStudyTime(resultMap.monthStudyTime);
	displayMonthBySubject(resultMap.monthBySubject);
	
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
		} else {
			var changeDate;
			changeDate = moment.duration(result[i].difftime).asSeconds();
			//콘솔확인
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
let fourDifftimeList=[];
let foursubjectColorList=[];
let foursubjectColorBorderList=[];
let recordDateList=[]; 

function displayFourdayStudyTimeChart (result){
	const sub = new Array();

	for(let i = 0 ; i < result.length;i++){	
		var resultItem = result[i];
		foursubejctNameList[i] = result[i].subjectName;
	  	foursubjectColorList[i] = chooseColor(result[i].color);
	  	foursubjectColorBorderList[i] = chooseBorderColor(result[i].color);
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
		fourDifftimeList[i] = {
		        label: result[i].subjectName,
		        data:subData,
		        backgroundColor: chooseColor(result[i].color),
		        borderColor:chooseBorderColor(result[i].color),
		        borderWidth:2
		};
	}
	console.log("4일치 데이터 뽑아옴");
	console.log(foursubejctNameList);
	console.log(foursubejctNameList);
	console.log(fourDifftimeList);
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
	var myChart2 = new Chart(ctx, {
	type : 'bar',
    data:{
    	//라벨에 날짜 넣기
        labels: recordDateList, //라벨에 날짜 
        datasets: fourDifftimeList
    },
	options:{            
		scales:{

        	x:{ //x축값 누적
            	stacked:true
        	},
        	y:{ //y축값 누적
            	stacked:true,
    			ticks: {
                    // ticks에 출력되는 값 변경 
                    callback: function(value, index, ticks) {
                    	var yValue = parseInt(value/60)+'분';
                        return yValue;
                    }
                }
        	}
    	},
    	//호버동작과 관련된 설정, 호버를 하는 순간 툴팁창이 뜸
    	//그 툴팁에 대한 스타일링
		plugins:{
			tooltip:{
				callbacks:{//함수가 끝나고 난 뒤 실행되는 함수 //호버했을 때 뜨는 것 콜백
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
/**** myChart3 ******************************************/
let thiryDifftimeList =[];
let thirtyRecordDateList=[]; 
function displayThirtydayStudyTime(result){
	for (var i = 0; i < result.length; i++) {
		var resultItem =  result[i];
		thiryDifftimeList[i]=resultItem.difftime
		thirtyRecordDateList[i]=resultItem.onlyDate;
	}
	
	//그래프 생성
	// 여기
var ctx = document.getElementById('myChart3').getContext('2d');
var myChart3 = new Chart(ctx, {
type : 'bar',
data:{
	//라벨에 날짜 넣기
    labels: thirtyRecordDateList, //라벨에 날짜 
    datasets: [{
	    data:thiryDifftimeList ,
	    backgroundColor:'rgba(174,213,129,0.5)',   
	    hoverOffset: 4
	  }]
},
options:{
	scales:{
		//x,y축의 그리드 선 안보이게 설정
		x:{
			grid:{
				display:false
			}
		},
		y:{
			grid:{
				display:false
			},
			axis:'y',
			display:false
		}
	},
	plugins:{
		//차트 위에 해당그래프가 뭔지 뜨는 것 display none
	  	legend: {
		    display: false,
		  },
		tooltip:{
			callbacks:{//함수가 끝나고 난 뒤 실행되는 함수
				label: function(context){
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
/**** myChart10 누적 그래프******************************************/
 function displayAccStudyTime(result){
 let accDifftimeList =[];
 let accRecordDateList=[]; 
	for (var i = 0; i < result.length; i++) {
		var resultItem =  result[i];
		accDifftimeList[i]=resultItem.difftime
		accRecordDateList[i]=resultItem.onlyDate;
	}
	
	//그래프 생성
	// 여기
var ctx = document.getElementById('myChart10').getContext('2d');
var myChart10 = new Chart(ctx, {
type : 'line',
data:{
	//라벨에 날짜 넣기
    labels: accRecordDateList, //라벨에 날짜 
    datasets: [{
	    data:accDifftimeList ,
	    borderColor:'rgba(255,179,229,1)',  
	    pointBackgroundColor:'rgba(255,179,229,1)',
	    pointBorderColor:'rgba(255,179,229,1)',
	    pointRadius:0,
	    hoverOffset: 4
	  }]
},
options:{
	scales:{
		//x,y축의 그리드 선 안보이게 설정
		x:{
			grid:{
				display:false
			}
		},
		y:{
			grid:{
				display:false
			},
			axis:'y',
			display:false
		}
	},
	plugins:{
		//차트 위에 해당그래프가 뭔지 뜨는 것 display none
	  	legend: {
		    display: false,
		  },
		tooltip:{
			callbacks:{//함수가 끝나고 난 뒤 실행되는 함수
				label: function(context){
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
/**** myChart4 ****월별 학습시간******************************************/
let monthDifftimeList =[];
let monthRecordDateList=[]; 
function displayMonthStudyTime(result){
	for (var i = 0; i < result.length; i++) {
		var resultItem =  result[i];
		monthDifftimeList[i]=resultItem.difftime
		monthRecordDateList[i]=resultItem.onlyDate;
	}
	
	//그래프 생성
	// 여기
var ctx = document.getElementById('myChart4').getContext('2d');
var myChart4 = new Chart(ctx, {
type : 'bar',
data:{
	//라벨에 날짜 넣기
    labels: monthRecordDateList, //라벨에 날짜 
    datasets: [{
    	//
	    data:monthDifftimeList ,
	    backgroundColor:'rgba(255,225,111,0.5)',   
	    hoverOffset: 4
	  }]
},
options:{
	scales:{
		//x,y축의 그리드 선 안보이게 설정
		x:{
			grid:{
				display:false
			}
		},
		y:{
			grid:{
				display:false
			},
			axis:'y',
			display:false
		}
	},
	plugins:{
		//차트 위에 해당그래프가 뭔지 뜨는 것 display none
	  	legend: {
		    display: false,
		  },
		tooltip:{
			callbacks:{//함수가 끝나고 난 뒤 실행되는 함수
				label: function(context){
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
 
/**** myChart5 ****30일간 과목별로******************************************/
 
let thirySubejctNameList =[]; 
let thiryDifftimeBySubjectList=[]; //학습시간
let thirtySubjectColorList=[];
let thirtySubjectColorBorderList=[];
let thirtyRecordDateBySubjectList=[]; //학습날짜

function displayThirtyDayStudyTimeBySubjectChart (result){
	const sub = new Array();

	for(let i = 0 ; i < result.length;i++){	
		var resultItem = result[i];
		thirySubejctNameList[i] = result[i].subjectName;//과목명
		thirtySubjectColorList[i] = chooseColor(result[i].color);
		thirtySubjectColorBorderList[i] = chooseBorderColor(result[i].color);
		var diffTimeByDayList = result[i].diffTimeByDayList;
		var subData = new Array();
		for(let j=0; j<result[i].diffTimeByDayList.length; j++){
			subData[j] = diffTimeByDayList[j].difftime;
			if(i==0) {
				thirtyRecordDateBySubjectList[j] = diffTimeByDayList[j].onlyDate;
			}
		}
		thiryDifftimeBySubjectList[i] = {
		        label: result[i].subjectName,
		        data:subData,
		        backgroundColor: chooseColor(result[i].color),
		        borderColor:chooseBorderColor(result[i].color),
		        borderWidth:2
		};
	}
		
		//그래프 생성
		// 여기
	var ctx = document.getElementById('myChart5').getContext('2d');
	var myChart5 = new Chart(ctx, {
	type : 'bar',
    data:{
    	//라벨에 날짜 넣기
        labels: thirtyRecordDateBySubjectList, //라벨에 날짜 
        datasets: thiryDifftimeBySubjectList
    },
	options:{            
		scales:{

        	x:{ //x축값 누적
            	stacked:true,
            	grid:{
    				display:false
    			}
        	},
        	y:{ //y축값 누적
            	stacked:true,
    			grid:{
    				display:false
    			},
    			axis:'y',
    			display:false
        	}
    	},
    	//호버동작과 관련된 설정, 호버를 하는 순간 툴팁창이 뜸
    	//그 툴팁에 대한 스타일링
		plugins:{
		  	legend: {
			    display: false,
			  },
			tooltip:{
				callbacks:{//함수가 끝나고 난 뒤 실행되는 함수 //호버했을 때 뜨는 것 콜백
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
/**** myChart6 ***월별 과목별로******************************************/

let monthSubejctNameList =[]; 
let monthDifftimeBySubjectList=[]; //학습시간
let monthSubjectColorList=[];
let monthSubjectColorBorderList=[];
let monthRecordDateBySubjectList=[]; //학습날짜	
function displayMonthBySubject(result){
	const sub = new Array();

	for(let i = 0 ; i < result.length;i++){	
		var resultItem = result[i];
		monthSubejctNameList[i] = result[i].subjectName;//과목명
		monthSubjectColorList[i] = chooseColor(result[i].color);
		monthSubjectColorBorderList[i] = chooseBorderColor(result[i].color);
		var diffTimeByDayList = result[i].diffTimeByDayList;
		var subData = new Array();
		for(let j=0; j<result[i].diffTimeByDayList.length; j++){
			subData[j] = diffTimeByDayList[j].difftime;
			if(i==0) {
				monthRecordDateBySubjectList[j] = diffTimeByDayList[j].onlyDate;
			}
		}
		monthDifftimeBySubjectList[i] = {
		        label: result[i].subjectName,
		        data:subData,
		        backgroundColor: chooseColor(result[i].color),
		        borderColor:chooseBorderColor(result[i].color),
		        borderWidth:2
		};
	}
		
		//그래프 생성
		// 여기
	var ctx = document.getElementById('myChart6').getContext('2d');
	var myChart6 = new Chart(ctx, {
	type : 'bar',
    data:{
    	//라벨에 날짜 넣기
        labels: monthRecordDateBySubjectList, //라벨에 날짜 
        datasets: monthDifftimeBySubjectList
    },
	options:{            
		scales:{

        	x:{ //x축값 누적
            	stacked:true,
            	grid:{
    				display:false
    			}
        	},
        	y:{ //y축값 누적
            	stacked:true,
    			grid:{
    				display:false
    			},
    			axis:'y',
    			display:false
        	}
    	},
    	//호버동작과 관련된 설정, 호버를 하는 순간 툴팁창이 뜸
    	//그 툴팁에 대한 스타일링
		plugins:{
		  	legend: {
			    display: false,
			  },
			tooltip:{
				callbacks:{//함수가 끝나고 난 뒤 실행되는 함수 //호버했을 때 뜨는 것 콜백
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