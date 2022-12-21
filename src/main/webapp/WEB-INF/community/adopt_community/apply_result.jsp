<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="model.*" import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
@SuppressWarnings("unchecked")
AdoptionAnimal adoptAnimal = (AdoptionAnimal)session.getAttribute("adoptAnimal");
ArrayList<Apply> aList = (ArrayList<Apply>)request.getAttribute("aList");
System.out.println(aList.size());
Collections.sort(aList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>신청 폼 모아보기</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">

</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<h2>신청자 모아보기</h2>
<table style="width:100%">
<tr>
	<td class="myPage_mini">
		<%@include file="/WEB-INF/community/adopt_community/adopt_main2.jsp" %>
	</td>
	
	<td class="main">
		<table style="margin-top:0px;">
		<%-- <tr>
			<td>
				<!--  <select name=phone1>
					<option value=0 selected>전체게시판</option>
					<option value=0 selected>입양/임보 게시판</option>
					<option value=1>펫스타그램 게시판</option>
					<option value=2>그룹 게시판</option>
					<option value=3>정보 게시판</option>
				</select> -->
				<c:if test="${registerFailed}">value="${user.phone}"</c:if>
				<!-- <input type="date" style="width: 240" name="startDate" > -->
				<select name=phone1>
					<option value=0 selected>전체 기간</option>
					<option value=0 selected>1일</option>
					<option value=1>2일</option>
					<option value=2>3일</option>
					<option value=3>4일</option>
					<option value=3>직접 기간 입력하기
	 						<input type="date" style="width: 5%" name="startDay >-<input type="date" style="width: 5%" name="endDay" >
 	 <!-- 제이쿼리 -->				
 					</option>
				</select> 
			    <input class="srch" type="text" placeholder="검색어를 입력하세요.">
			    <button class="btn" >검색</button>
			</td>
		</tr> --%>
		<tr>
			<td class="main">
		<table class="list_table">
	      <colgroup>
	         <col width="15%" />
	         <col width="45%" />
	         <col width="20%" />
	         <col width="20%" />
	      </colgroup>
	      <thead>
	      <tr>
	        <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
	        <th>번호</th>
			<th>이름</th>
			<th>신청타입</th>
	      </tr>
	      </thead>
	      <tbody>
	      <% boolean exist = false; %>
	      	<c:forEach var="item" varStatus="i" items="${aList}">
	      	<c:if test="${item.petId == adoptAnimal.petId}">
	      		<%exist = true; %>
	      		<tr>
					<td>${item.applyId }</td>
					<td>${item.name}</td>
					<c:if test="${item.aType==0}">
						<td>임보</td>
					</c:if>
					<c:if test="${item.aType==1}">
						<td>입양</td>
					</c:if>
				</tr>
				</c:if>
	      	</c:forEach>
	      	<%
	      		if(exist == false)
		      		out.println("<tr><td colspan='3'><B>아직 신청자가 없습니다.</B></td></tr>");
	      	%>
		</tbody>
		</table>
		</td>
		</tr>
		</table>
	</td>
</tr> <!-- 쪽지하기 -->
</table>

<!-- 테이블 종료 -->

</body>
</html>