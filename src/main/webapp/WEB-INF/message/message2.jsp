<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" import="controller.user.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
String check="N";
if(request.getMethod().equals("POST")){
	check = request.getParameter("newMessgeChk");
	System.out.println(check);
}

List<Message> mList = (List<Message>)request.getAttribute("mList");

%>
<html>
<head>
<title>쪽지 목록</title>
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
      
   .h {
        margin:auto;
        float: right;
        text-align: right; /* Quirks Mode                  */
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
<form name = form1 method = post>
<table style="width:80%" align="center">
	<tr>
		<td colspan=2>
			<h3>쪽지</h3><br>
		</td>
	</tr>
	<tr>
		<td colspan=2 align="left">
			<!-- <select name="newMessgeChk" id="newMessgeChk" style="width:100px">
		        <option value="N" selected>보낸쪽지</option>
		        <option value="Y">받은쪽지</option>
		     </select> -->
			<input class="srch" type="text" placeholder="검색어를 입력하세요.">
			<button class="btn" type = "submit">검색</button>
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td align="right"><br>
			<a class="btn" href="<c:url value='/message/message_write' />">쪽지쓰기</a>
		</td>
	</tr>
	<tr>
		<td>
			<a class="nav-link" href="<c:url value='/message/message' />">받은 쪽지함 </a>&ensp;
			<a class="nav-link" href="<c:url value='/message/message2' />">보낸 쪽지함 </a>
		</td>
	</tr>
</table>
</form>
<br>
	<table style="width:80%" align="center" summary="보낸쪽지 목록(아이디,이름,제목,날짜 항목)">
	  <tr>
	  	<td class="main">
			<table class="list_table">
		      <colgroup>
		         <col width="15%" />
		         <col width="45%" />
		         <col width="20%" />
		         <col width="20%" />
		      </colgroup>
		      <thead>
		      <tr>
		        <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
		        <th>번호</th>
				<th>제목</th>
				<th>받는 사람</th>
				<th>날짜</th>
		      </tr>
		      </thead>
		      <% int index = 0; %>
		      <c:forEach var="message" items="${mList}" varStatus = "i">
		      	<% int findSender = mList.get(index).getSender();%>
		         <tr>
		         <td>${message.messageId}</td>
		          <td>
		             <a href="<c:url value='/message/message_content'>
		                   	<c:param name='messageId' value='${message.messageId}'/>
		                  </c:url>">
		             ${message.mTitle}</a>
		          </td>
		           <td>
		           <% 
		             String userNickName = UserSessionUtils.getUserNickName(findSender);
		           %>
		           <%=userNickName %>
		           </td>
		           <td>
		             ${message.sendDate}
		           </td>
		         </tr>
		         <%index++; %>
		     </c:forEach> 
			</table>
		</td>
	  </tr> 
	</table>

<!--  -->
</body>
</html>