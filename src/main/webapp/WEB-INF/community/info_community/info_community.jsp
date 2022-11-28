<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>community</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<!-- <style>
table {
   width: 100%;
   border: 1px solid;
}

table1 {
   width: 20%;
   border: 1px solid;
}

table2 {
   width: 70%;
   border: 1px solid;
}

.td1 {
   width: 20%;
}
</style> -->
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
   <table>
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