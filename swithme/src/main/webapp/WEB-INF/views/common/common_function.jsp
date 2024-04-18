<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>


function checkLogin(msq, prePage){
	var loginInfo = "${loginInfo}";
	if (!loginInfo){
		var result = confirm("로그인이 되야어 그룹 만들기가 가능합니다.이동하시겠습니까");
		if (result) {
			location.href = "${pageContext.request.contextPath}/login?prePage=" + prePage;
		} else {
			
		}
		return;
	}else{
		return false;
	}
	
}

function ajaxErrorHandler (request, status, error){
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}


</script>