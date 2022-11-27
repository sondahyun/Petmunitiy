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
	    margin:auto;
	    float:center;
	    text-align:center;
	    width:150px;
	    font-family: 'Y_Spotlight';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
		font-weight: normal;
		font-style: normal; 
		font-size: 12pt; 
		color: Black; 
		background-color: Beige;
		line-height: 22px;
	}
</style>
<table class="adopt_main_table">
	<tr class="pic">
		<td class="pic_td" colspan=2> 사진 </td>
	</tr>
	<tr>
		<td>
			<!-- <input class="btn" type="button" value="ABOUT" onClick="location.href='/myPage/about.jsp';"> -->
			<a class="nav-link" href="<c:url value='/myPage/about' />">ABOUT</a>
		</td>
	</tr>
</table>