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
<br>

<table>
<th>
	<%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %>
</th>
<th>
<table>
<tr>
	<td><%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %></td>
	<td><%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %></td>
	<td><%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %></td>
</tr>
<tr>
</tr>
<tr>
	<td><%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %></td>
	<td><%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %></td>
	<td><%@include file="/WEB-INF/community/adopt_community/adopt_main.jsp" %></td>
</tr>
</table>
</th>
</table>


<!-- 테이블 종료 -->

</body>
</html>