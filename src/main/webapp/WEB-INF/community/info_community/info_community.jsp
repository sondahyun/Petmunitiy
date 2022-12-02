<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
@SuppressWarnings("unchecked")
List<PostInformation> p0List = (List<PostInformation>)request.getAttribute("p0List");
Collections.sort(p0List);
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>community</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<table style="width:100%">
<tr>
	<td class="myPage_mini">
		<%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
	</td>
	
	<td class="main">
	<table class="list_table">
      <tr>
        <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
        <th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>등록일자</th>
      </tr>
      <c:forEach var="item" items="${p0List}">
         <tr>
         <td>${item.postId }</td>
           <td>
              <a href="<c:url value='/main/main'>
                     <%-- <c:param name='postId' value='${item.postId}'/> --%>
                   </c:url>">
              ${item.postTitle}</a>
           </td>
           <td>
             ${item.loginId}
           </td>
           <td>
              ${item.postDate}
           </td>
         </tr>
     </c:forEach>
     </table>  
      </td>
   </table>
</body>

</html>