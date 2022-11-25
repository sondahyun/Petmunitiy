<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<div>
	<button class="btn" style="float:right; margin-right:45px;">검색</button>
    <input type="text" placeholder="검색어를 입력하세요." style="float:right; margin-right:5px;">
</div>

<!-- 테이블 종료 -->

</body>
</html>