<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %> <!-- 변수 바꾸기 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserInfo user = (UserInfo)request.getAttribute("user");
	Pet pet = (Pet)request.getAttribute("pet");
	String noPet= "pet이 등록되지 않았습니다.";
	//System.out.println(pet.getName());
%>
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
   /* var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   //""
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
   form.submit();   //get
}

</script>
</head>
<body>   

<!-- registration form  -->

<!--<h2>회원가입</h2>  -->

<form name="form" method="POST" action="<c:url value='/user/register' />">
  
   <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
         <c:if test="${registerFailed}">
         <font color="red"><c:out value="${exception.getMessage()}" /></font>
       </c:if>
<h3>마이페이지</h3>
<table>
   <tr>
   <td style="width:300px">
   <!-- <a href="<c:url value='/main/main' />"> -->
      <img src="<c:url value='/images/favicon.png' />" style="width:200px; height:200px"/>      
   </td>
   <td style="width:900px">
   <br>
   <table style="background-color: #848484; width: 100%">
    <!--<center>-->
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">이름</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
         ${user.userNickname}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">생일</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.userBirth}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">성별</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.gender}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">전화번호</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.phoneNumber}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">사용자 ID</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.loginId}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">비밀번호</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.loginPwd}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">이메일 주소</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.email}
      </td>
    </tr>
    <tr height="40">
      <td width="50%" align="center" bgcolor="#E6E6E6">거주지 주소</td>
      <td width="50%" bgcolor="ffffff" style="padding-left: 10">
		${user.address}
      </td>
    </tr>   
   </table>
   
   <h3>마이펫</h3>
   <table style="background-color: #848484; width: 100%">
   		<tr height="40">
	      <td align="center" bgcolor="#E6E6E6">이름</td>
	      <td bgcolor="ffffff" style="padding-left: 10">
	      	<% if(pet == null){%>
	      		<%=noPet%>
    	 	<%}%>
	      	${pet.name}
	      		
	      </td>
	   </tr>
	    <tr height="40">
	      <td align="center" bgcolor="#E6E6E6">나이</td>
	      <td bgcolor="ffffff" style="padding-left: 10">
			${pet.age}
	      </td>
	    </tr>
	    <tr height="40">
	      <td align="center" bgcolor="#E6E6E6">성별</td>
	      <td bgcolor="ffffff" style="padding-left: 10">
	         ${pet.gender}
	      </td>
	    </tr>
	    <tr height="40">
	      <td align="center" bgcolor="#E6E6E6">건강상태</td>
	      <td bgcolor="ffffff" style="padding-left: 10">
	         ${pet.health}
	      </td>
	    </tr>
	    <tr height="40">
	      <td align="center" bgcolor="#E6E6E6">첨부파일(프로필 사진)</td>
	      <td bgcolor="ffffff" style="padding-left: 10">
	         <!-- <input class="file_real" id="attached" type="file">
	         <input class="file_fake" type="text" placeholder="* 10MB 미만의 jpg, png, bmp, gif만 첨부 가능" readonly tabindex="-1"> -->
	      </td>
	    </tr>
   </table>
</table>
</form>
</body>
</html>