<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>폼 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<script>
function Create() {
   /* alert("실행");

   if (form.userNickname.value == "") {
      alert("이름을 입력하십시오.");
      form.userNickname.focus();
      return false;
   } */
   
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
<form name="form" method="POST" action="<c:url value='/community/adop_community/adopt_community' />">
   
   <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
         <%-- <c:if test="${registerFailed}">
         <font color="red"><c:out value="${exception.getMessage()}" /></font>
       </c:if>   --%>
<table>
<tr>
<td>
<br>
<h3>폼 작성</h3>
   <table style="background-color: #848484" style="width: 100%">
    <!--<center>-->
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">제목</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="postTitle" >
         <%-- <c:if test="${registerFailed}">value="${user.userNickname}"</c:if> --%>
      </td>
    </tr>
     <!-- <tr height="40">
	      <td width="150" align="center" bgcolor="#E6E6E6">작성일</td>
	      <td width="250" bgcolor="ffffff" style="padding-left: 10">
	      </td>
	    </tr> -->
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">모집(임보/입양)</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="radio" name="aType" value="0"/> 임보
         <input type="radio" name="aType" value="1"/> 입양
         <input type="radio" name="aType" value="2"/> 입양(임보)
      </td>
     </tr>
          <!-- <tr height="40">
	      <td width="150" align="center" bgcolor="#E6E6E6">현 상태</td>
	      <td width="250" bgcolor="ffffff" style="padding-left: 10">
	      </td> -->
	    </tr>
          <!-- <tr height="40">
	      <td width="150" align="center" bgcolor="#E6E6E6">입양(임보)완료일</td>
	      <td width="250" bgcolor="ffffff" style="padding-left: 10">
	      </td> -->
	      <input type="hidden" name="approval" value="0">
	    </tr>
	     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">동물 종</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="kind">
      </td>
     </tr>
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">동물 성별</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="radio" name="gender" value="male"/> 남성
         <input type="radio" name="gender" value="female"/> 여성
      </td>
     </tr>
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">동물 나이</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <select name=age>
            <option value=0 selected>1</option>
            <%
            	for(int i=1;i<100;i++){
            		out.println("<option value="+i+">"+(i+1)+"</option>");
            	}
            %>
         </select>
      </td>
    </tr>
        <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">건강상태</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="health">
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
      <td width="150" align="center" bgcolor="#E6E6E6">백신 접종 여부</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="vaccination">
      </td>
     </tr>
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">작성자 희망 조건 사항</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="hopeConditions">
      </td>
     </tr>
    </table>
    <br>
    </td>
 </tr>
 <tr>
 	<td>
 		<input class="btn" type="button" value="폼 작성완료" onClick="Create()"> &nbsp;
	</td>
 </tr>
</table>
</form>
</body>
</html>