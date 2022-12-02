<%@page contentType="text/html; charset=utf-8" %> <!-- 변수 바꾸기 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<script>
function userCreate() {
	alert("실행");
	
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
	if (form.userNickname.value == "") {
		alert("이름을 입력하십시오.");
		form.userNickname.focus();
		return false;
	}
	
	//프론트팀 전달
	/* var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;	//""
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
	} */
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
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->

<form name="form" method="POST" action="<c:url value='/user/register' />">
	<h3>펫의 정보</h3>
	<table style="background-color: #848484; width: 100%">
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">이름</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="userNickname" >
				 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">생일</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="date" style="width: 240" name="userBirth" >
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">성별</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="radio" name="gender2" value="female"/> 여성
			<input type="radio" name="gender2" value="male"/> 남성
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">건강상태</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="address" placeholder="건강상태"
				<c:if test="${registerFailed}">value="${user.address}"</c:if>>
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">첨부파일(프로필 사진)</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input class="file_real" id="attached" type="file">
			<input class="file_fake" type="text" placeholder="* 10MB 미만의 jpg, png, bmp, gif만 첨부 가능" readonly tabindex="-1">
		</td>
	 </tr>
	</table>
	<table>
	 <tr align="center">
		<td align="left">
		<input class="btn" type="button" value="회원 가입" onClick="userCreate()"> &nbsp;
		<input class="btn" type="button" value="로그인 창으로 돌아가기" onClick="userList('<c:url value='/user/login' />')">
		</td>
	 </tr>
	 
	</table>
</form>
</body>
</html>