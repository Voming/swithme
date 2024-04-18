<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
//ajax error 부분
function ajaxErrorHandler (request, status, error){
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);

}

</script>