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
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>5</td>
				<td><a href = "post.jsp" class = "postTitle">안녕하세요!!</a></td>
				<td>고양이(cat)</td>
				<td>2022-11-19</td>
			</tr>
			<tr>
				<td>4</td>
				<td><a href = "post.jsp" class = "postTitle">반가워요ㅎㅎ</a></td>
				<td>사자(lion)</td>
				<td>2022-11-12</td>
			</tr>
			<tr>
				<td>3</td>
				<td><a href = "post.jsp" class = "postTitle">입양 원해요</a></td>
				<td>토끼(rabbit)</td>
				<td>2022-9-19</td>
			</tr>
			<tr>
				<td>2</td>
				<td><a href = "post.jsp" class = "postTitle">안녕안녕</a></td>
				<td>판다(panda)</td>
				<td>2022-9-9</td>
			</tr>
			<tr>
				<td>1</td>
				<td><a href = "post.jsp" class = "postTitle">안녕하세요</a></td>
				<td>판다(panda)</td>
				<td>2022-8-19</td>
			</tr>
		</tbody>
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
   </table> -->
</body>

</html>