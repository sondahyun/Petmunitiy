<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %> <!-- 변수 바꾸기 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserInfo user = (UserInfo)request.getAttribute("user");
	Pet pet = (Pet)request.getAttribute("pet");
%>
<html>
<head>
<title>사용자 관리 - 그룹원 상세정보 보기</title>
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
<h3>그룹원 상세정보 보기</h3>
<table style="background-color: YellowGreen">
  	  <tbody><tr>
		<td width="120" align="center" bgcolor="E6ECDE" height="22">사용자 ID</td>
		<td width="470" bgcolor="ffffff" style="padding-left: 10">
			123ser
		</td>
	  </tr>
	  <tr>
		<td width="120" align="center" bgcolor="E6ECDE" height="22">이름</td>
		<td width="470" bgcolor="ffffff" style="padding-left: 10">
			박세아
		</td>
	  </tr>
	  <tr>
		<td width="120" align="center" bgcolor="E6ECDE" height="22">이메일 주소</td>
		<td width="470" bgcolor="ffffff" style="padding-left: 10">
			katlelo@naver.com 
		</td>
	  </tr>		  
	  <tr>
		<td width="120" align="center" bgcolor="E6ECDE" height="22">전화번호</td>
		<td width="470" bgcolor="ffffff" style="padding-left: 10">
			010-4538-1227 
		</td>
	  </tr>		  
	  <tr>
		<td width="120" align="center" bgcolor="E6ECDE" height="22">커뮤니티</td>
		<td width="470" bgcolor="ffffff" style="padding-left: 10">
			<a href="/UserMan3/community/view?commId=20">
				A.R.M.Y 
			</a>
		</td>
	  </tr>	
 	</tbody>
</table>
<table style="width:100%">
   <tr>
   <td style="width:200px">
   		<%if(pet!=null && pet.getFilename() == null){ %>
			<img src="<c:url value='/images/linkedin_profile_image.png' />" style="width:200px; height:200px"/>	
		<%}else{ %>
			<img src="<c:url value='/upload/${pet.filename}'/>" style="width:200px; height:200px" />	
			<%} %>	 
   </td>
   <td style="width:1200px">
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
   <% if(pet == null){ %>
	    pet이 등록되지 않았습니다.
   <% }%>
   <% if(pet != null) {%>
	   <table style="background-color: #848484; width: 100%">
	   		<tr height="40">
		      <td align="center" bgcolor="#E6E6E6">이름</td>
		      <td bgcolor="ffffff" style="padding-left: 10">
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
		      <td align="center" bgcolor="#E6E6E6">접종여부</td>
		      <td bgcolor="ffffff" style="padding-left: 10">
		         ${pet.vaccination}
		      </td>
		    </tr>
		    <tr height="40">
		      <td align="center" bgcolor="#E6E6E6">종</td>
		      <td bgcolor="ffffff" style="padding-left: 10">
		         ${pet.kind}
		      </td>
		    </tr>
	   </table>
	    <%} %>
</table>
</form>
</body>
</html>