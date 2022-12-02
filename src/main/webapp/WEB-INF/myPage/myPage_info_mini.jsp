<!-- myPage_info_mini 만들기 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
   @font-face {
      font-family: 'Y_Spotlight';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
       font-weight: normal;
       font-style: normal;
   }
   .myPage_mini{
      border : 1px solid black;
        border-collapse : collapse;
      border-radius : 10px;
       text-align:center;
       width:90px;
       height:150px;
       font-family: 'Y_Spotlight';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
      font-weight: normal;
      font-style: normal; 
      font-size: 12pt; 
      color: Black; 
      background-color: White;
      line-height: 22px;
   }
   .pic {
   
   }
   .write, .comment, .scrap, .correction{
      border : 1px solid black;
        border-collapse : collapse;
   }
</style>
<table class="myPage_mini">
   
   <%
   if(session.getAttribute("userId") != null) {// 입양일 경우 
   %>
   <tr>
      <td>
         <a href="<c:url value='/myPage/myPage' />">작성글 모아보기</a> <!-- value 수정하기 -->
      </td>
   </tr> 
   <tr class="comment">
      <td>
         <a href="<c:url value='/myPage/myPage' />">댓글 모아보기</a> <!-- value 수정하기 -->
      </td>
   </tr> 
   <%
   } 
   %>
         
   <tr class="correction">
      <td>
         <!-- <input class="btn" type="button" value="ABOUT" onClick="location.href='/myPage/about.jsp';"> -->
         <a class="nav-link" href="<c:url value='/user/user_update' />">회원정보 수정</a>
      </td>
   </tr>
</table>
