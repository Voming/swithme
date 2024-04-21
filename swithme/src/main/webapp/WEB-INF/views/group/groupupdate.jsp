<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 그룹 만들기 레이아웃 -->
<link href="${pageContext.request.contextPath}/resources/css/group/groupcreate.css" rel="stylesheet">
<meta charset="UTF-8">
<title>SWITH.ME</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp"/>
</head>
<body>
	<script>
$(loadedHandler);

function loadedHandler() {
	//원래 공개였는지 비공개였는지 체크
	if(${groupInfo.sgroupOpen} == '1'){
		$("input:radio[name='groupOpen']:radio[value='close']").prop('checked', true); // 선택하기
		$("input:radio[name='groupOpen']:radio[value='open']").prop('checked', false); // 해제하기
		var htmlVal = `<div class="dpwd"><p>비밀번호</p>
			<input type="text" name="groupPwd" value="${groupInfo.sgroupPwd }" required /></div>`;
		
		$(".wrap-open").after(htmlVal);  
	}else{
		$("input:radio[name='groupOpen']:radio[value='close']").prop('checked', false);
		$("input:radio[name='groupOpen']:radio[value='open']").prop('checked', true); 
	}
	
	$(".btn.open").on("click", btnOpenClickHandler);
	$(".btn.update").on("click", btnCreateClickHandler);
}
function btnOpenClickHandler(){
	if($(this).val() == "open"){
		$(".dpwd").remove();
	}else {
		var htmlVal = `<div class="dpwd"><p>비밀번호</p>
			<input type="text" name="groupPwd" value="${groupInfo.sgroupPwd }" required /></div>`;
		
		$(".wrap-open").after(htmlVal);  
	} 
	var isOpen = $('input[type=radio]:checked').val();
	console.log(isOpen);
}

function btnCreateClickHandler(){
	console.log("클릭");
	if ($("[name=groupName]").val().trim().length == 0) {
		alert("빈칸만 입력할 수 없습니다. 그룹명을 작성해주세요");
		return;
	}
	if ($("[name=groupPwd]").length > 0){
		if ($("[name=groupPwd]").val().trim().length == 0) {
			alert("빈칸만 입력할 수 없습니다. 비밀번호를 작성해주세요");
			return;
		} 
	}
	
	console.log($(".frm-create").serialize());
	
	// ajax - encType="multipart/form-data" 
	console.log( new FormData($(".frm-create").get(0)) );
	
	$.ajax({
		url:"${pageContext.request.contextPath }/group/update"
		, method : "post"
	// ajax - encType="multipart/form-data" 
		, data : new FormData($(".frm-create").get(0)) 
		, contentType : false
		, processData : false
		, dataType:  'text'
		, success : function(result){
			console.log("ajax result : "+ result);
			if(result == "0"){
				alert("그룹 수정이 불가합니다");
			}else if(result == "-1"){
				alert("그룹 수정중 오류 발생 다시 시도해주세요");
			} else{
				alert("그룹이 수정되었습니다.");
				location.href="${pageContext.request.contextPath }/group";
			}
		}
		,error : ajaxErrorHandler
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
							<li><a class="active"
								href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="#">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a
								href="${pageContext.request.contextPath}/testcalendar">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr> 
				</div>
			</header>
		</div>
		<div class="wrap-body">
			<div class="wrap-create">
				<div class="gname">
					<P>그룹 수정하기</P>
				</div>
				<div>
				<c:if test="${not empty groupInfo }">
					<form class="frm-create">
						<div><p>그룹명</p>
							<input type="text" name="groupName" value="${groupInfo.sgroupName }" required />
						</div>
						<div class="wrap-open">
							<label>공개</label> 
							<input type="radio" name="groupOpen" value="open" class="btn open" checked="checked"> 
							<label>비공개</label>
							<input type="radio" name="groupOpen" value="close" class="btn open">
						</div>
						<div>
							<p>그룹 설명</p>
							<textarea rows="20" name="groupExp">${groupInfo.sgroupEx }</textarea>
						</div>
						<div>
							<p>그룹 대표 이미지</p>
							<input type="file" name="uploadfile"  />
						</div>	
						<div class="wbtn">
							<button type="button" class="btn update">그룹 수정하기</button>
						</div>
					</form>
				</c:if>	
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
</body>
</html>