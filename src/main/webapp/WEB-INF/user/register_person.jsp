<%@page contentType="text/html; charset=utf-8" %> <!-- 변수 바꾸기 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<style>
.input {
    margin: 20px;
    display: flex;
    justify-content: flex-start;
    font-size: 18px;
}
</style>
<script>
function userCreate() {
	alert("나의 정보 작성완료 -> 펫 정보 작성하기");
	
	if (form.userNickname.value == "") {
		alert("이름을 입력하십시오.");
		form.userNickname.focus();
		return false;
	}
	if (form.loginId.value == "") {
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
	if (form.userBirth.value == "") {
		alert("생년월일을 입력하십시오.");
		form.userBirth.focus();
		return false;
	}
	if (form.gender.value == "") {
		alert("성별을 입력하십시오.");
		form.gender.focus();
		return false;
	}
	if (form.address.value == "") {
		alert("거주지 주소를 입력하십시오.");
		form.address.focus();
		return false;
	}
	if (form.email.value == "") {
		alert("이메일 주소를 입력하십시오.");
		form.userNickname.focus();
		return false;
	}
	if (form.phone1.value == "" || form.phone2.value =="" || form.phone3.value=="") {
		alert("전화번호를 입력하십시오.");
		form.phone1.focus();
		return false;
	}
	
	//프론트팀 전달
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;	//""
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}
	//동작?
	/* var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	} */
	//form.method="post";
	form.submit();
}

function userList(targetUri) {
	form.method = "GET";
	form.action = targetUri;
	form.submit();	//get
}

</script>
</head>
<body>	
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->

<form name="form" method="POST" action="<c:url value='/user/register_person' />" >
   <h3>나의 정보</h3>
   <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
   		<c:if test="${registerFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>  
   <table style="background-color: #848484; width: 100%">
	 <!--<center>-->
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">이름</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="userNickname" >
				 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">생년월일</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="date" style="width: 240" name="userBirth" >
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">성별</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
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
		<td width="50%" align="center" bgcolor="#E6E6E6">전화번호</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<select name=phone1>
				<option value=0 selected>010</option>
				<option value=1>080</option>
				<option value=2>070</option>
				<option value=3>02</option>
			</select> - <input type="text" name="phone2" value="" size="4" maxlength="4"> - <input type="text" name="phone3" value="" size="4" maxlength="4">
			<%-- <c:if test="${registerFailed}">value="${user.phone}"</c:if> --%>
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">사용자 ID</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240;" name="loginId">
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">비밀번호</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="password" style="width: 240" name="loginPwd">
		</td>
     </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">비밀번호 확인</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="password" style="width: 240" name="password2">
		</td>
     </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">이메일 주소</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="email" placeholder="you@example.com">
				<%-- <c:if test="${registerFailed}">value="${user.address}"</c:if>> --%>
		</td>
     </tr>
     <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">거주지 주소</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="address" placeholder="주소지"
				<c:if test="${registerFailed}">value="${user.address}"</c:if>>
		</td>
	 </tr>	
	</table>
	<table>
	 <tr align="center">
		<td align="left">
		<input class="btn" type="button" value="다음 단계로 넘어가기" onClick="userCreate()"> &nbsp;
		<input class="btn" type="button" value="로그인 창으로 돌아가기" onClick="userList('<c:url value='/user/login' />')">
		</td>
	 </tr>
	 
	</table>
</form>
</body>
</html>