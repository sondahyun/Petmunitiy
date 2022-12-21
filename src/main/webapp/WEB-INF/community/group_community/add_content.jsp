<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>게시글 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<script>
function applyAdopt() {
   alert("실행");

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
<td>
<br>
<h3>모임 생성</h3><br>
   <table style="background-color: #848484" style="width: 100%">
    <!--<center>-->
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">모임명</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240;" name="postTitle">
      </td>
    </tr>
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">모임 설명</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="postContent">
      </td>
     </tr> 
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">모임 목적</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="groupPurpose">
      </td>
     </tr> 
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">지역</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="region">
      </td>
     </tr> 
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">모임 대표 배경 사진</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="file" style="width: 240" name="filename">
      </td>
     </tr> 
    </table>
    <br>
    </td>
 </tr>
 <tr>
 	<td>
 		<input class="btn" type="button" value="모임 생성완료" onClick="userCreate()"> &nbsp;
	</td>
 </tr>
</table>
</form>
</body>
</html>