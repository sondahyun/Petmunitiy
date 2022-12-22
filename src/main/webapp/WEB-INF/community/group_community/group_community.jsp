<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked")
   ArrayList<PostGroup> p1List = (ArrayList<PostGroup>)request.getAttribute("p1List");
   Collections.sort(p1List);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>그룹 커뮤니티</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">
</head>
<style>
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
       height: 250px;
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
      width:300px;
      height:150px;
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
        width:140px;
      height:20px;
      float:center;
      text-align:center;
     }
     /* .content_say2 {
        display : block;
      text-overflow: ellipsis;
      white-space: nowrap; 
      overflow : hidden;
      width: 50%;
     } */
</style>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<table style="width:100%">
   <% if(session.getAttribute("loginId") != null) {%>
   <tr>
      <td colspan="3">
         <a style="float:right" href="<c:url value='/community/group_community/add_content' />">모임 생성</a>
      </td>
   </tr>
   <%} %>
   <tr>
      <td class="myPage_mini">
         <%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
      </td>
      
      <td class="main">
         <table>
            <%-- <%int cnt=0; %> --%>
            <% int index = 0; %>
            <c:forEach var="item" varStatus="i" items="${p1List}">
            <%
				String file = p1List.get(index).getFileName();									
			%>
            <%-- <%
               if(cnt%3==1)
                  out.println("<tr>");
            %> --%>
            <c:if test="${i.index%3==0}"><tr></c:if>
            <td>
               <table class="group_main_table1">
                  <tr></tr>
                  <tr class="pic2">
                     <td class="pic_td2" colspan=2>
                     	<%if(file != null) {%>
                        <a href="<c:url value='/community/group_community/group_content'>
                              <c:param name='postId' value='${item.postId}'/></c:url>"> 					
                              <img src="<c:url value='/upload/${item.fileName}'/>" style="width:200px; height:200px" />		
						 </a>
						 <%} else{%>
						 <a href="<c:url value='/community/group_community/group_content'>
                              <c:param name='postId' value='${item.postId}'/></c:url>"> 					
                              <img src="<c:url value='/images/linkedin_profile_image.png'/>" style="width:200px; height:200px" />		
						 </a>
						 <%} %>
                     </td>
                  </tr>
                  <tr class="content_writer">
                     <td class="content_writer1">모임 개설자</td>
                     <td class="content_writer2">${item.loginId}</td> <!-- 작성자 나타내기 -->
                  </tr>
                  <tr class="content_say">
                     <td class="content_say1">모임명</td>
                     <td class="content_say2">${item.postTitle}</td> <!-- 게시글 불러오기 -->
                  </tr>
                  <%-- <tr>
                  		<td class="btn" colspan=2>
							<a class="nav-link" href="<c:url value='/community/group_community/group_join'>
							<c:param name='headCount' value='${item.headCount}'/>
							<c:param name='postId' value='${item.postId}'/> 
							<c:param name='postTitle' value='${item.postTitle}'/> 
							</c:url>">모임 가입하기</a>
						</td>
				 </tr>--%>
               </table> 
            </td>
            <%-- <%
               if(cnt%3==0 && cnt!=0)
                  out.println("</tr>");
               cnt++;
            %> --%>
               <c:if test="${i.index%3==2 and i.index!=0}"></tr></c:if>
               <%index++; %>
            </c:forEach>
         </table>
      </td>
   </tr>
</table>
<!-- 테이블 종료 -->

</body>
</html>