<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" import="model.*"
	import="java.util.*" import="controller.user.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
@SuppressWarnings("unchecked")
PostPetstargram p2 = (PostPetstargram) request.getAttribute("p2");

ArrayList<CommentPetstargram> c2List = (ArrayList<CommentPetstargram>) request.getAttribute("c2List");
if (c2List != null)
	Collections.sort(c2List);
%>
<c:set var="pId" value="${p2.postId}" />
<c:set var="uId" value="<%= UserSessionUtils.getLoginUserId(session) %>"/>
<html>
<head>
<title>펫스타그램 폼</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />"
	type="text/css">
</head>
<body>
	<%@include file="/WEB-INF/navbar.jsp"%><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
	<!-- registration form  -->

	<table style="width: 100%">
		<tr>
			<td style="width: 100%"><br>
				<h3>펫스타그램 폼</h3><br>
				
				<br>
				<table
					style="background-color: #848484; width: 100%; margin-top: 0px">
					<tr>
						<td
							style="height: 40%; width: 15%; align: center; background-color: #E6E6E6;">이미지</td>
						<td style="width: 50%">
							<!-- <a href="<c:url value='/main/main' />"> --> <img
							src="<c:url value='/images/linkedin_profile_image.png' />"
							style="width: 500px; height: 500px" />
						</td>
					</tr>
					<tr style="height: 40%; width: 100%">
						<td
							style="height: 40%; width: 15%; align: center; background-color: #E6E6E6;">제목</td>
						<td
							style="height: 40%; width: 100%; align: center; background-color: #ffffff; padding-left: 10">
							<input type="text" style="width: 240" name="name" value="${p2.postTitle}">
						</td>
					</tr>
					<tr style="height: 40%; width: 100%">
						<td
							style="height: 40%; width: 15%; align: center; background-color: #E6E6E6;">작성자</td>
						<td
							style="height: 40%; width: 100%; align: center; background-color: #ffffff; padding-left: 10">
							<!-- 작성자 정보 가져오기 -->
							<% String logName = p2.getLoginId(); %>
							<c:set var="loginName" value="<%=UserSessionUtils.getUserNickName(logName) %>"/>
							${loginName}
						</td>
					</tr>
					<tr style="height: 40%; width: 100%">
						<td
							style="height: 40%; width: 15%; align: center; background-color: #E6E6E6;">종</td>
						<td
							style="height: 40%; width: 100%; align: center; background-color: #ffffff; padding-left: 10">
							<input type="text" style="width: 240" name="name" value="${p2.kind}">
						</td>
					</tr>
					<tr style="height: 40%; width: 100%">
						<td
							style="height: 40%; width: 15%; align: center; background-color: #E6E6E6;">작성일자</td>
						<td
							style="height: 40%; width: 100%; align: center; background-color: #ffffff; padding-left: 10">
							<!-- 작성일자 정보 가져오기 --> ${p2.postDate}
						</td>
					</tr>
					<tr style="height: 40%; width: 100%">
						<td
							style="height: 40%; width: 15%; align: center; background-color: E6E6E6;">내용</td> 
						<td
							style="height: 40%; width: 100%; align: center; background-color: ffffff; padding-left: 10">
							<input type="text" style="width: 240" name="name" value="${p2.postContent}">
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>