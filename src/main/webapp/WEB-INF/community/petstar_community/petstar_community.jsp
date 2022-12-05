<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>펫스타그램 게시판</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<table style="width:100%">
	<% if(session.getAttribute("loginId") != null) {%>
	<tr>
		<td colspan="3">
			<a style="float:right" href="<c:url value='/community/petstar_community/add_content' />">게시글 작성</a>
		</td>
	</tr>
	<%} %>
	<tr>
		<td class="myPage_mini">
			<%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
		</td>
		
		<td class="main">
			<table>
			<%-- <tr>
				<td><a class="nav-link" href="<c:url value='/community/adopt_community/apply_form' />">입양 신청폼 작성하기</a></td>
				<td><a class="nav-link" href="<c:url value='/community/adopt_community/adopt_info' />">입양 정보 보러가기</a></td>
			</tr> --%>
			<tr>
				<td><a href="<c:url value='/community/petstar_community/petstar_content' />"><%@include file="/WEB-INF/community/petstar_community/petstar_main.jsp" %></a></td>
				<td><a href="<c:url value='/community/petstar_community/petstar_content' />"><%@include file="/WEB-INF/community/petstar_community/petstar_main.jsp" %></a></td>
				<td><a href="<c:url value='/community/petstar_community/petstar_content' />"><%@include file="/WEB-INF/community/petstar_community/petstar_main.jsp" %></a></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td><a href="<c:url value='/community/petstar_community/petstar_content' />"><%@include file="/WEB-INF/community/petstar_community/petstar_main.jsp" %></a></td>
				<td><a href="<c:url value='/community/petstar_community/petstar_content' />"><%@include file="/WEB-INF/community/petstar_community/petstar_main.jsp" %></a></td>
				<td><a href="<c:url value='/community/petstar_community/petstar_content' />"><%@include file="/WEB-INF/community/petstar_community/petstar_main.jsp" %></a></td>
			</tr>
			</table>
		</td>
	</tr>
</table>
<!-- 테이블 종료 -->

</body>
</html>