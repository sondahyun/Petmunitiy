<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function userCreate() {
	if (form.userId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.loginPwd.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.loginPwd.focus();
		return false;
	}
	if (form.loginPwd.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password2.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}
	//동작?
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	}
	//form.method="post";
	form.submit();
}

function userList(targetUri) {
	form.action = targetUri;
	form.submit();	//get
}

</script>
</head>
<body>	
<!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<br>
<!-- registration form  -->

<form name="form" method="POST" action="<c:url value='/user/register' />">
  <table style="width: 100%">
  	 <tr height="100" align="center"><td>&nbsp;</td>
	  <td>
		<a href="https://drive.google.com/drive/folders/1D9SLM6m28H5EeIwVflH8gi7PqMxX5mC6">
		  <img src="<c:url value='/images/logo.gif' />" /></a>		
	  </td>
	</tr>
    <tr>
      <td width="20"></td>
	  <td>	 
	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${registerFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
	    <br>	  
	    <!--<center>-->
	    <table style="background-color: #848484">
	     <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">이름</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="userNickname" 
				 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>>
			</td>
		  </tr>
	  	  <!-- 
		   <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">나이</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="age" >
			</td>
		  </tr> -->
		  <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">생일</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="date" style="width: 240" name="userBirth" >
			</td>
		  </tr>
		   <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">성별</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="radio" name="gender" value="female"/> 여성
				<input type="radio" name="gender" value="male"/> 남성
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
			<td width="150" align="center" bgcolor="#E6E6E6">전화번호</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
			<select name=phone1>
				<option value=0 selected>010</option>
				<option value=1>080</option>
				<option value=2>070</option>
				<option value=3>02</option>
			</select> - <input type="text" name="phone2" value="" size="4" maxlength="4"> - <input type="text" name="phone3" value="" size="4" maxlength="4">
			<c:if test="${registerFailed}">value="${user.phone}"</c:if>	<%-- user.??? --%>
		</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">사용자 ID</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240;" name="loginId">
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">비밀번호</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="password" style="width: 240" name="loginPwd">
			</td>
		  </tr>
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">비밀번호 확인</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="password" style="width: 240" name="password2">
			</td>
		  </tr>
	  	 
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">이메일 주소</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="address" 
					<c:if test="${registerFailed}">value="${user.address}"</c:if>>
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">펫의 정보</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="petList" 
					<c:if test="${registerFailed}">value="${user.petList}"</c:if>>
			</td>
		  </tr>
	  	  <!-- <tr height="40">
			<td width="150" align="center" bgcolor="#E6E6E6">커뮤니티</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<select name="commId" style="width: 240">
					<option value="0">없음</option>
					<c:forEach var="comm" items="${commList}">
						<option value="${comm.id}"
							<c:if test="${comm.id eq user.commId}">selected="selected"</c:if>
							>${comm.name}</option>
					</c:forEach>
				</select>			
			</td>
		  </tr>	 -->
		  	  
	    </table>
	    <br>
	    <table style="margin-left: auto; margin-right: auto;">
		  <tr align="center">
			<td align="left">
			<input type="submit" value="회원 가입" onClick="userCreate()"> &nbsp;
			<input type="button" value="로그인 창으로 돌아가기" onClick="userList('<c:url value='/user/login' />')">
			</td>
		  </tr>
	    </table>
	
	   
	  </td>
    </tr>
  </table>  
</form>
</body>
</html>