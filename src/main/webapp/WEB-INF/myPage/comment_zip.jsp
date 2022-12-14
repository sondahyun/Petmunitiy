<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<CommentInformation> c0List = (ArrayList<CommentInformation>)request.getAttribute("c0List");
	ArrayList<String> p0List = (ArrayList<String>)request.getAttribute("p0List");
	ArrayList<CommentPetstargram> c2List = (ArrayList<CommentPetstargram>)request.getAttribute("c2List");
	ArrayList<String> p2List = (ArrayList<String>)request.getAttribute("p2List");
	String loginId = (String)request.getAttribute("loginId");
%>

<!DOCTYPE html>
<html>
<head>
<title>myPage</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
	<table style="width:100%">
	<tr>
		<td style="width:15%"><%@include file="/WEB-INF/myPage/myPage_info_mini.jsp"%>
		</td>
		<%--<td width="90%">
		<%@include file="/WEB-INF/myPage/myPage_info.jsp"%></td>  --> --%>
		<td style="width:85%" class="main">
			<table style="margin-top:0px;">
			<tr>
				<td>
					<!-- <select name=phone1>
							<option value=0 selected>전체 커뮤니티</option>
							<option value=0 selected>입양/임보 커뮤니티</option>
							<option value=1>펫스타그램 커뮤니티</option>
							<option value=2>그룹 커뮤니티</option>
							<option value=3>정보 커뮤니티</option>
					</select>  -->
					&nbsp;
					<!--  <select name=phone1>
						<option value=0 selected>전체게시판</option>
						<option value=0 selected>입양/임보 게시판</option>
						<option value=1>펫스타그램 게시판</option>
						<option value=2>그룹 게시판</option>
						<option value=3>정보 게시판</option>
					</select> -->
					<%-- <c:if test="${registerFailed}">value="${user.phone}"</c:if> --%>
					<!-- <input type="date" style="width: 240" name="startDate" > -->
					<!-- <input type="date" style="width: 240" name="userBirth" >-<input type="date" style="width: 240" name="userBirth" >
	 				&nbsp; -->
				    <!-- <input class="srch" type="text" placeholder="검색어를 입력하세요."> -->
				    <!--  <button class="btn" >검색</button> -->
				</td>
			</tr>
			<tr>
				<td>
				정보 커뮤니티 댓글
				<%if (c0List.isEmpty()){%>
					<p>작성한 댓글이 없습니다</p>
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
							<c:forEach var="c0" items="${c0List}" varStatus = "status">
							<tr>
								<td>${c0.commentId}</td>
								<td>
									<a href="<c:url value='/community/info_community/info_content'>
						              	<c:param name='postId' value='${c0.postId}'/>
						              	</c:url>">${p0List[status.index]}
						            </a>
						        </td>					        
								<td>${loginId}</td>
								<td>${c0.commentDate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				<%}%>
				</td>
			</tr>
			<tr>
				<td>
					펫스타그램 커뮤니티 댓글
					<%if (c2List.isEmpty()){%>
						<p>작성한 댓글이 없습니다</p>
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
								<c:forEach var="c2" items="${c2List}" varStatus = "status">
								<tr>
									<td>${c2.commentId}</td>
									<td>
										<a href="<c:url value='/community/petstar_community/petstar_content'>
							              	<c:param name='postId' value='${c2.postId}'/>
							              	</c:url>">${p2List[status.index]}
							            </a>
							        </td>					        
									<td>${loginId}</td>
									<td>${c2.commentDate}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					<%}%>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</body>

</html>