<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>쪽지쓰기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">
<style>

  /*.container {
     position: absolute;
     width : 50%
   }
   table {
      width : 30%
      
   }*/
   @font-face {
      font-family: 'Y_Spotlight';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
       font-weight: normal;
       font-style: normal;
   }
   .pop-teambox{
       margin: 0 auto;
   }
   .group_main_table1{
      border : none;
        border-collapse : collapse;
        border-radius : 10px;
       margin:auto;
       float:center;
       text-align:center;
       width:200px;
       height: 200px;
       font-family: 'Y_Spotlight';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
      font-weight: normal;
      font-style: normal; 
      font-size: 12pt; 
      color: Black; 
      background-color: #e8e8e8;
      line-height: 22px;
      table-layout: fixed;
   }
   .pic2{
      /* border : 1px solid black;
        border-collapse : collapse; */
        float:center;
      width:200px;
      height:130px;
   }
   .pic_td2, .content_writer1, .content_say1 {
      /* border : 1px solid black;
        border-collapse : collapse; */
        width:50px;
        float:center;
        height:20px;
   }
   .pic_td2, .content_writer2, .content_say2 {
      /* border : 1px solid black;
        border-collapse : collapse; */
        width:50px;
      height:20px;
      float:center;
      text-align:center;
     }
     .content_say2 {
        display : block;
      text-overflow: ellipsis;
      white-space: nowrap; 
      overflow : hidden;
      width: 50%;
     }
   .container .btn {
     position: absolute;;
     top: 50%;
     left: 95%;
     transform: translate(-70%, -70%);
     -ms-transform: translate(-70%, -70%);
     background-color: #5fbee3;
     color: white;
     font-size: 1px;
     padding: 12px 24px;
     border: none;
     cursor: pointer;
     border-radius: 5px;
     text-align: center;
   }
  @font-face {
      font-family: 'Y_Spotlight';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
       font-weight: normal;
       font-style: normal;
      }
   body {
      font-family: 'Y_Spotlight';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
       font-weight: normal;
       font-style: normal;
   }
      
   h3 {
        margin:auto;
        float: center;
        text-align: center; /* Quirks Mode                  */
   }
   .detail {
      background-color : #e8e8e8;
      padding: 20px 0px 30px 100px;
   }
   /*.image {
      position:relative;
      margin: 50px;
   }*/
   /*.login {
      text-decoration-line:none;
      font-size:10px;
      
   }
   .navbar-nav mr-auto {
         margin:auto;
        float: right;
        text-align: center; /* Quirks Mode                  
   }*/
</style>
<script>
function messageCreate() {
	alert("보내기");
   if (form.mTitle.value == "") {
      alert("제목을 입력하십시오.");
      form.mTitle.focus();
      return false;
   }
   
   if (form.loginId.value == "") {
	   alert("수신자를 입력하십시오.");
	   form.loginId.focus();
	   return false;
	}
   if (form.content.value == "") {
	   alert("내용을 입력하십시오.");
	   form.content.focus();
	   return false;
	}
   form.submit();
}
function userList(targetUri) {
	   form.action = targetUri;
	   form.submit();   //get
	}
</script>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<form name="form" method="POST" action="<c:url value='/message/message_write' />">
<h3>쪽지쓰기</h3>
<br>
	<table style="width:100%; height:500px" border="1">
	    <tr>
	      <th style="width:10%; height:50px">제목</th>
	      <td style="width:100%; height:50px"><input id="wrtTitle" type="text" class="txttype02" name="mTitle" style="width:80%" maxlength="256" value=""></td>
	    </tr>
	    <tr>
	      <th style="width:10%; height:50px">받는 사람</th>
	      <td style="width:100%; height:50px">
	         <input id="wrtTitle" type="text" class="txttype02" name="loginId" style="width:80%" maxlength="256">
	      </td>
	    </tr>          
	    <tr style="width:100%; height:400px">
	      <th style="width:10%; height:400px">내용</th>
	      <td style="width:100%; height:400px"><textarea id="wrtContent" name="content" style="font-size: 12px; width:80%; height:300px"></textarea></td>
	    </tr>
	</table>
	<br>
	<table>
		 <tr align="center">
			<td align="left">
			<input class="btn" type="button" value="전송하기" onClick="messageCreate()"> &nbsp;
			<input class="btn" type="button" value="목록보기" onClick="userList('<c:url value='/message/message' />')">
			</td>
		 </tr> 
	</table>   
</form>
</body>
</html>