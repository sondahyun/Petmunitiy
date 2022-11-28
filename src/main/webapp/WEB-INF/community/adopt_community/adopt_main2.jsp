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
   .adopt_main_table{
      border : 1px solid black;
        border-collapse : collapse;
       width:300px;
       font-family: 'Y_Spotlight';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
      font-weight: normal;
      font-style: normal; 
      font-size: 12pt; 
      color: Black; 
      background-color: Beige;
      line-height: 22px;
   }
   .pic{
      border : 1px solid black;
        border-collapse : collapse;
        float:center;
      width:300px;
      height:300px;
   }
   .pic_td, .spec_td, .gender_td, .age_td {
      border : 1px solid black;
        border-collapse : collapse;
        margin:auto;
   }
   .spec, .gender, .age {
      width:70px;
      border : 1px solid black;
        border-collapse : collapse;
        margin:auto;
   }
</style>
<table class="adopt_main_table">
   <tr class="pic">
      <td class="pic_td" colspan=2> 사진 </td>
   </tr>
   <tr class="spec">
      <td class="spec_td">종</td>
      <td class="spec_td"></td>
   </tr>
   <tr class="gender">
      <td class="gender_td">성별</td>
      <td class="gender_td"></td>
   </tr>
   <tr class="age">
      <td class="age_td">나이</td>
      <td class="age_td"></td>
   </tr>
</table>