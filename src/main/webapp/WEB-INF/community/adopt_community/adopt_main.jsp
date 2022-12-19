<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
@SuppressWarnings("unchecked")
AdoptionAnimal animal = (AdoptionAnimal)session.getAttribute("adoptAnimal");
if(animal != null)
	System.out.println("aA2");
%>
<style>
	@font-face {
		font-family: 'Y_Spotlight';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	.adopt_main_table1{
		border : none;
	  	border-collapse : collapse;
	  	border-radius : 10px;
	    margin:auto;
	    float:center;
	    text-align:center;
	    width:200px;
	    font-family: 'Y_Spotlight';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
		font-weight: normal;
		font-style: normal; 
		font-size: 12pt; 
		color: Black; 
		background-color: #e8e8e8;
		line-height: 22px;
	}
	.pic1{
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	float:center;
		width:200px;
		height:150px;
	}
	.pic_td1, .spec_td1, .gender_td1, .age_td1 {
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	width:60px;
	  	float:center;
	  	height:20px;
	}
	.pic_td2, .spec_td2, .gender_td2, .age_td2 {
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	width:140px;
		height:20px;
		float:center;
		text-align:center;
	}
	.spec1, .gender1, .age1 {
		width:60px;
		height:20px;
		text-align:center;
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	float:center;
	}
</style>
<table class="adopt_main_table1">
	<tr>
		
	</tr>
	<tr class="pic1">
		<td class="pic_td1" colspan=2> 사진 </td>
	</tr>
	<tr class="spec">
      <td class="spec_td">종</td>
      <td class="spec_td"><%=animal.getKind() %></td>
   </tr>
   <tr class="gender">
      <td class="gender_td">성별</td>
      <td class="gender_td"><%=animal.getGender() %></td>
   </tr>
   <tr class="age">
      <td class="age_td">나이</td>
      <td class="age_td"><%=animal.getAge() %></td>
   </tr>
</table>