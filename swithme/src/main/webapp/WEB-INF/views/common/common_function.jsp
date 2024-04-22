<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script>
function getCurrentDateTime() {
  // 현재 날짜 시간 구하기 yyyymmddhh24miss
  const now = new Date();
  // 년
  const year = now.getFullYear();
  // 월
  const month = (now.getMonth() + 1).toString().padStart(2, '0');
  // 일
  const day = now.getDate().toString().padStart(2, '0');
  // 시
  const hours = now.getHours().toString().padStart(2, '0');
  // 분
  const minutes = now.getMinutes().toString().padStart(2, '0');
  // 초
  const seconds = now.getSeconds().toString().padStart(2, '0');
  const sendDateTime = year + month + day + hours + minutes + seconds;
  console.log("getCurrentDateTime:"+sendDateTime);
  return sendDateTime;
}

function getCurrentTimeDisplay() {
  // 현재 날짜 시간 구하기 am hh:mi:ss
  const now = new Date();
  // 시
  const hours = now.getHours().toString().padStart(2, '0');
  // 분
  const minutes = now.getMinutes().toString().padStart(2, '0');
  // 초
  const seconds = now.getSeconds().toString().padStart(2, '0');
  const returnVal = hours + ":" + minutes + ":" + seconds;
  console.log("getCurrentDateTimeDisplay:"+returnVal);
  return returnVal;
}

function getCurrentDateDisplay() {
  // 현재 날짜 시간 구하기 m월 d일 day
  // TODO
  const now = new Date();
  // 년
  const year = now.getFullYear();
  // 월
  const month = (now.getMonth() + 1).toString().padStart(2, '0');
  // 일
  const day = now.getDate().toString().padStart(2, '0');
  const returnVal = hours + ":" + minutes + ":" + seconds;
  console.log("getCurrentDateTimeDisplay:"+returnVal);
  return returnVal;
}

//ajax error 부분
function ajaxErrorHandler (request, status, error){
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}





</script>