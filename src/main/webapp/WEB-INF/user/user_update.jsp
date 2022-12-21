<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserInfo user = (UserInfo)request.getAttribute("user");
	Pet pet = (Pet)request.getAttribute("pet");
	System.out.println(pet.toString());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_update</title>
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
	if (form.name.value == "") {
		alert("펫 이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	
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

<form name="form" method="POST" action="<c:url value='/user/user_update' />" enctype="multipart/form-data">
   <input type ="hidden" name="petId" value = "${pet.petId}">
   <h2>회원 정보 수정</h2>
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
			<input type="text" style="width: 240" name="userNickname" value="${user.userNickname}">
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">생일</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="date" style="width: 240" name="userBirth" value="${user.userBirth}">
			
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">성별</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
		<%
		if(user.getGender().equals("female")) {%>
			<input type="radio" name="gender" value="female" checked /> 여성
			<input type="radio" name="gender" value="male"/> 남성
		<%} else{%>
			<input type="radio" name="gender" value="female"  /> 여성
			<input type="radio" name="gender" value="male" checked/> 남성
		<%} %>
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
		<%
		String phone[] = (user.getPhoneNumber()).split("-"); 
		if(phone[0].equals("010")){%>
			<select name=phone1>
				<option value=010 selected>010</option>
				<option value=080>080</option>
				<option value=070>070</option>
				<option value=02>02</option>
			</select>
		<%}
		else if(phone[0].equals("080")){ %> 
			<select name=phone1>
				<option value=010>010</option>
				<option value=080 selected>080</option>
				<option value=070>070</option>
				<option value=02>02</option>
			</select>
		<%}
		else if(phone[0].equals("070")){%>
			<select name=phone1>
				<option value=010>010</option>
				<option value=080>080</option>
				<option value=070 selected>070</option>
				<option value=02>02</option>
			</select>
		<%} 
		else{%>
			<select name=phone1>
				<option value=010>010</option>
				<option value=080>080</option>
				<option value=070>070</option>
				<option value=02 selected>02</option>
			</select>
		<%} %>
			- <input type="text" name="phone2" size="4" maxlength="4" value=<%=phone[1]%>> - <input type="text" name="phone3" size="4" maxlength="4" value=<%=phone[2]%>>
			<%-- <c:if test="${registerFailed}">value="${user.phone}"</c:if> --%>
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">사용자 ID</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240;" name="loginId" value="${user.loginId}">
		</td>
	 </tr>
	 <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">비밀번호</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="password" style="width: 240" name="loginPwd" value="${user.loginPwd}">
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
			<input type="text" style="width: 240" name="email" value="${user.email}">
				<%-- <c:if test="${registerFailed}">value="${user.address}"</c:if>> --%>
		</td>
     </tr>
     <tr height="40">
		<td width="50%" align="center" bgcolor="#E6E6E6">거주지 주소</td>
		<td width="50%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="address" value="${user.address}">
		</td>
	 </tr>	
	</table>
	<h3>펫의 정보</h3>
	<table style="background-color: #848484; width: 100%">
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">이름</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="name" value = "${pet.name}">
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">성별</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<%
			if(pet.getGender().equals("female")) {%>
				<input type="radio" name="pGender" value="female" checked /> 여성
				<input type="radio" name="pGender" value="male"/> 남성
			<%} else{%>
				<input type="radio" name="pGender" value="female"  /> 여성
				<input type="radio" name="pGender" value="male" checked/> 남성
		<%} %>
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">나이</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="age" value = "${pet.age}">
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">건강상태</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="health" value="${pet.health}">
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">접종상태</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="vaccination" value="${pet.vaccination}" >
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">종</td>
		<td bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="kind" value="${pet.kind}">
		</td>
	 </tr>
	 <tr height="40">
		<td align="center" bgcolor="#E6E6E6">사진</td>
		<td bgcolor="ffffff" style="padding-left: 10">
		<%if(pet.getFilename() == null){ %>
			<img src="<c:url value='/images/favicon.png' />" style="width:200px; height:200px"/>	
		<%}else{ %>
			<img src="<c:url value='/upload/${pet.filename}'/>" style="width:200px; height:200px" />	
			<%} %>	
		<input type="file" style="width: 60%" name="filename" >			
			
		</td>
	 </tr>
	</table>
	<table>
	 <tr align="center">
		<td align="left">
		<input class="btn" type="button" value="수정하기" onClick="userCreate()"> &nbsp;
		</td>
	 </tr>
	 
	</table>
</form>
</body>
</html>