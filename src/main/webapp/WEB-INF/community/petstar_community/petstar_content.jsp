<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>펫스타그램 게시글</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
</head>
<body>   
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->
<form name="form" method="POST" action="<c:url value='/user/register' />">
   
   <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
         <c:if test="${registerFailed}">
         <font color="red"><c:out value="${exception.getMessage()}" /></font>
       </c:if>  
<table>
	<tr>
	<td style="width:600px">
	<!-- <a href="<c:url value='/main/main' />"> -->
		<img src="<c:url value='/images/favicon.png' />" style="width:200px; height:200px"/>		
	</td>
	
	<td style="width:900px">
	<br>
	<h3>펫스타그램 게시글</h3>
	   <table style="background-color: #848484" style="width: 100%">
	    <!--<center>-->
	    <tr height="40">
	      <td width="150" align="center" bgcolor="#E6E6E6">작성자</td>
	      <td width="250" bgcolor="ffffff" style="padding-left: 10">
	         <!-- 정보 가져오기 -->
	      </td>
	    </tr>
	    <tr height="40">
	      <td width="150" align="center" bgcolor="#E6E6E6">내용</td>
	      <td width="250" bgcolor="ffffff" style="padding-left: 10">
	         <!-- 정보 가져오기 -->
	      </td>
	    </tr>
	    </table>
	 </td>
    </tr>
 </table>
</form>
</body>
</html>