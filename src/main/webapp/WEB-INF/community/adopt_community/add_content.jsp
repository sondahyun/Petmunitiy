<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>폼 작성</title>
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
<h3>폼 작성</h3>
   <table style="background-color: #848484" style="width: 100%">
    <!--<center>-->
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">이름</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="userNickname" >
                <c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
      </td>
    </tr>
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">신청(임보/입양)</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="radio" name="select" value="imbo"/> 임보
         <input type="radio" name="select" value="imag"/> 입양
      </td>
     </tr>
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">나이</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <select name=phone1>
            <option value=0 selected>1</option>
            <option value=1>2</option>
            <option value=2>3</option>
            <option value=3>4</option>
            <option value=4>5</option>
            <option value=5>6</option>
            <option value=6>7</option>
            <option value=7>8</option>
            <option value=8>9</option>
            <option value=9>10</option>
            <option value=10>11</option>
            <option value=11>12</option>
            <option value=12>13</option>
            <option value=13>14</option>
            <option value=14>15</option>
            <option value=15>16</option>
            <option value=16>17</option>
            <option value=17>18</option>
            <option value=18>19</option>
            <option value=19>20</option>
         </select> 
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
      <td width="150" align="center" bgcolor="#E6E6E6">연락처</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
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
      <td width="150" align="center" bgcolor="#E6E6E6">주소</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240;" name="address">
      </td>
    </tr>
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">작성자 희망 조건 사항</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="hope">
      </td>
     </tr>
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">입양에 대한 각오</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="prepare">
      </td>
     </tr>
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">알레르기 유무</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="radio" name="allergy" value="allergyNo"/> 없음
         <input type="radio" name="allergy" value="allergyYes"/> 있음
      </td>
     </tr>
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">특이사항</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="uniqueness">
      </td>
     </tr>
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">성별</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="radio" name="gender" value="male"/> 남성
         <input type="radio" name="gender" value="female"/> 여성
      </td>
     </tr>
      <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">종</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="species">
      </td>
     </tr>
     <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">거주지 주소</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="address" placeholder="주소지"
            <c:if test="${registerFailed}">value="${user.address}"</c:if>>
      </td>
    </tr>   
    <tr height="40">
      <td width="150" align="center" bgcolor="#E6E6E6">기타사항</td>
      <td width="250" bgcolor="ffffff" style="padding-left: 10">
         <input type="text" style="width: 240" name="etc">
      </td>
    </tr>   
    </table>
    <br>
    </td>
 </tr>
 <tr>
 	<td>
 		<input class="btn" type="button" value="게시글 작성완료" onClick="userCreate()"> &nbsp;
	</td>
 </tr>
</table>
</form>
</body>
</html>