<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>게시글 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<script>
function Create() {
   //alert("실행");

   /* if (form.userNickname.value == "") {
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
<br>
<h3>폼 작성</h3>
<form name="form" method="post" action="<c:url value='/community/petstar_community/add_content'/>">
  <table style="background-color: ffffff" style="width: 100%">
    <!--<center>-->
    <tr>
		<td>
		<br><br>
		   <table style="background-color: #848484" style="width: 100%">
		    <!--<center>-->
		    <tr height="40">
		      <td style="width: 20%" align="center" bgcolor="#E6E6E6">제목</td>
		      <td style="width: 100%" bgcolor="ffffff" >
		         <input type="text" style="width: 100%; height:30px" name="postTitle">
		      </td>
		    </tr>
		    <tr height="40">
		      <td style="width: 20%" align="center" bgcolor="#E6E6E6">사진</td>
		      <td style="width: 100%" bgcolor="ffffff" >
		         <input type="file" style="width: 240" name="fileName" size="11" multiple="multiple">
		      </td>
		     </tr>
		     <tr height="40">
		      <td style="width: 20%" align="center" bgcolor="#E6E6E6">내용</td>
		      <td style="width: 100%" bgcolor="ffffff" >
		         <textarea style="width: 100%; height:80px" name="postContent"></textarea>
		      </td>
		    </tr> 
		    <tr height="40">
		      <td style="width: 20%" align="center" bgcolor="#E6E6E6">종</td>
		      <td style="width: 100%" bgcolor="ffffff">
		         <input type="text" style="width: 100%; height:30px" name="kind">
		      </td>
		    </tr>
		    </table>
	    <br>
	    </td>
	 </tr>
	 <tr>
	 	<td><br>
	 		<input class="btn" type="button" value="폼 작성완료" onClick="Create()"> &nbsp;
		</td>
	 </tr>
	</table>
</form>
</body>
</html>