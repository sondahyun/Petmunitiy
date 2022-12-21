<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	@SuppressWarnings("unchecked")
	ArrayList<PostAdoption> p3List = (ArrayList<PostAdoption>)request.getAttribute("p3List");
	Collections.sort(p3List); 
	System.out.println(p3List.size());
	
	if(session.getAttribute("postId")!=null)
		session.removeAttribute("postId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입양/임보 게시판 메인화면</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
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
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<table style="width:100%">
	<% if(session.getAttribute("loginId") != null) {%>
	<tr>
		<td colspan="3">
			<a style="float:right" href="<c:url value='/community/adopt_community/add_content' />">폼 작성</a>
		</td>
	</tr>
	<%} %>
	<tr>
		<td class="myPage_mini">
			<%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
		</td>
		
		<td class="main">
			<table>
				<%int cnt=0; %>
				<c:forEach var="item" varStatus="i" items="${p3List}">
				<c:if test="${i.index%3==0}"><tr></c:if>
				<td>
				<table class="adopt_main_table1">
					<tr>
						
					</tr>
					<tr class="pic1">
						<td class="pic_td1" colspan=2>
							<a href="<c:url value='/community/adopt_community/adopt_info'>
										<c:param name='postId' value='${item.postId}'/></c:url>"> 사진 </a>
						</td>
					</tr>
					<tr class="spec1">
						<td class="spec_td1">종</td>
						<td class="spec_td2">${item.animal["kind"]} </td>
					</tr>
					<tr class="gender">
						<td class="gender_td1">성별</td>
						<td class="gender_td2">${item.animal["gender"]}</td>
					</tr>
					<tr class="age1">
						<td class="age_td1">나이</td>
						<td class="age_td2">${item.animal["age"]}</td>
					</tr>
				</table>
				
				</td>
				<c:if test="${i.index%3==2 and i.index!=0}"></c:if>
				</c:forEach>
			</table>
		</td>
	</tr>
</table>

<!-- 테이블 종료 -->

</body>
</html>