<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
@SuppressWarnings("unchecked")
ArrayList<PostInformation> p0List = (ArrayList<PostInformation>)request.getAttribute("p0List");
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
		<th>이름</th>
		<th>등록일자</th>
      </tr>
      </thead>
      <c:forEach var="item" items="${p0List}">
         <tr>
         <td>${item.postId }</td>
           <td>
              <a href="<c:url value='/community/info_community/info_content'>
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
</tr>
</table>
   <!-- <table>
      <td>
         <table id="table1">
            <tr>
               <td><input style="width: 100%" type="button" value="채팅1"
                  width="100%" /></td>
            </tr>
            <tr>
               <td><input style="width: 100%" type="button" value="채팅2" /></td>
            </tr>
            <tr>
               <td><input style="width: 100%" type="button" value="채팅3" /></td>
            </tr>
         </table>
      <td>
         <table id="table2">
            <table>
               <tr>
                  <td><input style="width: 300px" type="text" value="제목1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="작성자1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="날짜1"
                     readonly></td>
               </tr>
            </table>
            <table>
               <tr>
                  <td><input style="width: 300px" type="text" value="제목1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="작성자1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="날짜1"
                     readonly></td>
               </tr>
            </table>
            <table>
               <tr>
                  <td><input style="width: 300px" type="text" value="제목1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="작성자1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="날짜1"
                     readonly></td>
               </tr>
            </table>
            <table>
               <tr>
                  <td><input style="width: 300px" type="text" value="제목1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="작성자1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="날짜1"
                     readonly></td>
               </tr>
            </table>
            <table>
               <tr>
                  <td><input style="width: 300px" type="text" value="제목1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="작성자1"
                     readonly></td>
                  <td><input style="width: 100px" type="text" value="날짜1"
                     readonly></td>
               </tr>
            </table>
         </table>
      </td>
   </table>
</body>

</html>