<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" import="controller.user.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%Message message = (Message) request.getAttribute("message"); %>
<!DOCTYPE html>
<html>
<head>
<title>쪽지 상세보기</title>
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
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>

<h3>쪽지쓰기</h3>
<br>
	<table style="width:100%; height:500px" border="1">
	    <tr>
	      <th style="width:10%; height:50px">제목</th>
	      <td style="width:100%; height:50px">${message.mTitle}</td>
	    </tr>
	    <tr>
	      <th style="width:10%; height:50px">보낸 사람</th>
	      <td style="width:100%; height:50px">
	      	<% 
	      	  int findSender = message.getSender();
		      String senderNickName = UserSessionUtils.getUserNickName(findSender);
		    %>
		    <%=senderNickName %>
	      </td>
	    </tr>   
	    <tr>
	      <th style="width:10%; height:50px">받는 사람</th>
	      <td style="width:100%; height:50px">
	      	<% 
	      	  int findReceiver = message.getReceiver();
		      String receiverNickName = UserSessionUtils.getUserNickName(findReceiver);
		    %>
		    <%=receiverNickName %>
	      </td>
	    </tr>  
	    <tr>
	      <th style="width:10%; height:50px">보낸 날짜</th>
	      <td style="width:100%; height:50px">${message.sendDate}</td>
	    </tr>         
	    <tr style="width:100%; height:400px">
	      <th style="width:10%; height:400px">내용</th>
	      <td style="width:100%; height:400px">${message.content}</td>
	    </tr>
	</table>

</body>
</html>