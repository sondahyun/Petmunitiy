<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<PostInformation> p0List = (ArrayList<PostInformation>)request.getAttribute("p0List");
	ArrayList<PostGroup> p1List = (ArrayList<PostGroup>)request.getAttribute("p1List");
%>

<!DOCTYPE html>
<html>
<head>
<title>myPage</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
	<table style="width:100%">
	<tr>
			<td width="5%"><%@include file="/WEB-INF/myPage/myPage_info_mini.jsp"%>
			</td>
			<%--<td width="90%">
			<%@include file="/WEB-INF/myPage/myPage_info.jsp"%></td>  --> --%>
			<td>
			</td>
	
	<td class="main">
		<table style="margin-top:0px;">
		<tr>
			<td>
				<!--  <select name=phone1>
					<option value=0 selected>전체게시판</option>
					<option value=0 selected>입양/임보 게시판</option>
					<option value=1>펫스타그램 게시판</option>
					<option value=2>그룹 게시판</option>
					<option value=3>정보 게시판</option>
				</select> -->
				<%-- <c:if test="${registerFailed}">value="${user.phone}"</c:if> --%>
				<!-- <input type="date" style="width: 240" name="startDate" > -->
				<select name=phone1>
					<option value=0 selected>전체 기간</option>
					<option value=0 selected>1일</option>
					<option value=1>2일</option>
					<option value=2>3일</option>
					<option value=3>4일</option>
					<option value=3>직접 기간 입력하기
<%-- 	 						<input type="date" style="width: 5%" name="startDay >-<input type="date" style="width: 5%" name="endDay" >
 --%> 	 <!-- 제이쿼리 -->				
 					</option>
				</select> 
			    <input class="srch" type="text" placeholder="검색어를 입력하세요.">
			    <button class="btn" >검색</button>
			</td>
		<tr>
		<tr>
			<td>
				정보 커뮤니티
				<%if (p0List.isEmpty()){%>
					<p>작성글이 없습니다</p>
				<% }else{ %>
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
							<th>작성글</th>
							<th>이름</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p0" items="${p0List}">
							<tr>
								<td>${p0.postId}</td>
								<td>
					              	<a href="<c:url value='/community/info_community/info_content'>
					              	<c:param name='postId' value='${p0.postId}'/>
					              	</c:url>">
					              	${p0.postTitle}</a>
				           		</td>
								<td>${p0.loginId}</td>
								<td>${p0.postDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%}%>
			</td>
		</tr>
		<tr>
			<td>
				그룹 커뮤니티
				<%if (p1List.isEmpty()){%>
					<p>작성글이 없습니다</p>
				<% }else{ %>
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
							<th>작성글</th>
							<th>이름</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p1" items="${p1List}">
							<tr>
								<td>${p1.postId}</td>
								<td>
					              	<a href="<c:url value='/community/group_community/group_content'>
					              	<c:param name='postId' value='${p1.postId}'/>
					              	</c:url>">
					              	${p1.postTitle}</a>
				           		</td>
								<td>${p1.loginId}</td>
								<td>${p1.postDate}</td>
							</tr>
						</c:forEach>		
					</tbody>
				</table>
				<%}%>
			</td>
		</tr>
		</table>
</body>

</html>