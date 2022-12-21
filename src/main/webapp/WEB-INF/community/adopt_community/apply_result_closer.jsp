<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">신청(입양/임보)</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!-- <input type="date" style="width: 240" name="userBirth" value=> -->
			
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">생년</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!-- <input type="radio" name="gender" value="female"/> 여성
			<input type="radio" name="gender" value="male"/> 남성 -->
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
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">주소</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!-- <input type="text" style="width: 240;" name="loginId"> -->
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">작성자 희망 조건 관련</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		<!--<input type="password" style="width: 240" name="loginPwd">  -->	
		</td>
     </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">임양/임보에 대학 각오</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!-- <input type="password" style="width: 240" name="password2"> -->
		</td>
     </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">알레르기 유무</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<!--<input type="text" style="width: 240" name="address" placeholder="you@example.com">  -->
				<%-- <c:if test="${registerFailed}">value="${user.address}"</c:if>> --%>
		</td>
     </tr>
     <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">특이사항</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		<!--<input type="text" style="width: 240" name="address" placeholder="주소지"
				<c:if test="${registerFailed}">value="${user.address}"</c:if>>  -->	
		</td>
	 </tr>	
	  <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">거주지 형태</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		<!--<input type="text" style="width: 240" name="address" placeholder="주소지"
				<c:if test="${registerFailed}">value="${user.address}"</c:if>>  -->	
		</td>
	 </tr>	
	  <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">기타</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		<!--<input type="text" style="width: 240" name="address" placeholder="주소지"
				<c:if test="${registerFailed}">value="${user.address}"</c:if>>  -->	
		</td>
	 </tr>	
	</table>
	<table>
	 <tr align="center">
		<td align="left">
		
		<input class="btn" type="button" value="승인" onClick="userCreate()"> &nbsp;
		<input class="btn" type="button" value="삭제" onClick="userList()">
		</td>
	 </tr>
	 
	</table>
	</td>
</tr>
</table>

<!-- 테이블 종료 -->

</body>
</html>