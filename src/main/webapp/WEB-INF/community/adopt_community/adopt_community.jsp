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
<style>

</style>
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<table>
	<td>
	<%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
	</td>
	
	<td>
		<table>
		<tr>
			<%-- <td><a class="nav-link" href="<c:url value='/community/adopt_community/apply_form' />">입양 신청폼 작성하기</a></td> --%>
			<td><a class="nav-link" href="<c:url value='/community/adopt_community/adopt_info' />">입양 정보 보러가기</a></td>
		</tr>
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
	</td>
</table>

<!-- 테이블 종료 -->

</body>
</html>