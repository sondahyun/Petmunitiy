<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<script>
function login() {
	if (form.loginId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.loginId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}		
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.method="GET";		// register form 요청
	form.submit();
}
</script>
<style>
	@font-face {
          font-family: 'Y_Spotlight';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }
   body {
      font-family: 'Y_Spotlight';
   }
   h2 {
   	  text-align: center;
   }
</style>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<h2>로그인</h2>
<!-- login form  -->
<form name="form" method="POST" action="<c:url value='/user/login' />">
  <table style="width:40%">
	<tr>
	  <td align="center">
	   	<table>
	   	  <tr>
		    <!-- <td class="title">&nbsp;&nbsp;사용자 관리 - 로그인&nbsp;&nbsp;</td> -->
		  </tr>
	    </table>  
		
	    <!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${loginFailed}">
	  	  <br><font color="red"><c:out value="${exception.getMessage()}" /></font><br>
	    </c:if>
	    <br>	  
	    <table style="background-color: white">
	  	  <tr height="40">
			<td width="150" align="center">ID</td>
			<td width="250" style="padding-left:10">
				<input type="text" style="width:240" name="loginId">
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center">비밀번호</td>
			<td width="250" style="padding-left:10">
				<input type="password" style="width:240" name="password">
			</td>
		  </tr>
	    </table>
	    <br>	  
	    <table style="width:100%">
		  <tr>
			<td align="center">
			<input class="btn" type="button" value="로그인" onClick="login()"> &nbsp;&nbsp;&nbsp;
			<input class="btn" type="button" value="회원가입" onClick="userCreate(
								'<c:url value='/user/register_person/form'/>')">
			</td>						
		  </tr>
		  <!--<center><tr height="40"><td>(관리자 로그인: admin/admin)</center></td></tr>-->
	    </table>
	    </td>	  
	</tr>
  </table>  
</form>
</body>
</html>