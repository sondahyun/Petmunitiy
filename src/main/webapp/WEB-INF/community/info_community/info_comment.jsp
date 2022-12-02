<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>댓글 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
</head>
<body>   
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->
<form name="form" method="POST" action="<c:url value='/user/register' />">
   <h3>댓글 작성</h3>
   <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
   		<c:if test="${registerFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>  
	    <input type="text" style="width: 60%" name="userNickname" >
				 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
	    <input class="btn" type="button" value="등록" onClick="userCreate()"> &nbsp;
	    
   <%-- <table style="background-color: #848484; width: 100%">
	 <!--<center>-->
	 <tr height="40">
		<td width="90%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="userNickname" >
				 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
		</td>
	 </tr>
	</table>
	<table>
		<tr align="center">
			<td align="left">
			<input class="btn" type="button" value="등록" onClick="userCreate()"> &nbsp;
			</td>
		 </tr>
	</table> --%>
</form>
</body>
</html>