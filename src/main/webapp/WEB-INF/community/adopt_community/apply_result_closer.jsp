<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
@SuppressWarnings("unchecked")
Apply applyA = (Apply)request.getAttribute("applyA");
System.out.println("applyId : "+applyA.getApplyId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>apply_result 자세히보기</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">

</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<table style="width:100%">
<tr>
	<td class="myPage_mini">
		<%@include file="/WEB-INF/community/adopt_community/adopt_main2.jsp" %>
	</td>
	
	<td class="main">
		  <table style="background-color: #848484; width: 100%">
	 <!--<center>-->
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">이름</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!--<input type="text" style="width: 240" name="userNickname" value="${user.userNickname}">  -->
			${applyA.name}
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">신청(입양/임보)</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!-- <input type="date" style="width: 240" name="userBirth" value=> -->
			<c:if test="${applyA.aType==0}">임보</c:if>
			<c:if test="${applyA.aType==1}">입양</c:if>
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">생년</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			${applyA.birth}
		</td>
	 </tr>
	 <%-- 
	 <tr height="40">
		 <td width="150" align="center" bgcolor="#E6E6E6">전화번호</td>
		 <td width="250" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="phone" 
		   		<c:if test="${registerFailed}">value="${user.phone}"</c:if>>
			</td>
	 </tr> --%>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">전화번호</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!-- <select name=phone1>
				<option value=0 selected>010</option>
				<option value=1>080</option>
				<option value=2>070</option>
				<option value=3>02</option>
			</select> - <input type="text" name="phone2" value="" size="4" maxlength="4"> - <input type="text" name="phone3" value="" size="4" maxlength="4">
			<%-- <c:if test="${registerFailed}">value="${user.phone}"</c:if> --%> -->
			${applyA.phoneNumber}
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">주소</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			${applyA.address}
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">작성자 희망 조건 관련</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${applyA.hopeConditions}
		</td>
     </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">임양/임보에 대학 각오</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			${applyA.resolution}
		</td>
     </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">알레르기 유무</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			${applyA.allergy}
		</td>
     </tr>
     <!-- <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">특이사항</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		<input type="text" style="width: 240" name="address" placeholder="주소지"
				<c:if test="${registerFailed}">value="${user.address}"</c:if>> 	
		</td>
	 </tr>	 -->
	  <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">거주지 형태</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${applyA.housingType}
		</td>
	 </tr>	
	  <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">기타</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${applyA.etc}	
		</td>
	 </tr>	
	</table>
	</td>
</tr>
</table>

<!-- 테이블 종료 -->

</body>
</html>