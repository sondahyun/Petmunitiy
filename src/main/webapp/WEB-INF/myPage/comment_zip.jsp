<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<CommentInformation> c0List = (ArrayList<CommentInformation>)request.getAttribute("c0List");
	ArrayList<String> p0List = (ArrayList<String>)request.getAttribute("p0List");
	ArrayList<CommentGroup> c1List = (ArrayList<CommentGroup>)request.getAttribute("c1List");
	ArrayList<String> p1List = (ArrayList<String>)request.getAttribute("p1List");
	ArrayList<CommentPetstargram> c2List = (ArrayList<CommentPetstargram>)request.getAttribute("c2List");
	ArrayList<String> p2List = (ArrayList<String>)request.getAttribute("p2List");
	ArrayList<CommentAdoption> c3List = (ArrayList<CommentAdoption>)request.getAttribute("c3List");
	ArrayList<String> p3List = (ArrayList<String>)request.getAttribute("p3List");
	String loginId = (String)request.getAttribute("loginId");
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
			<select name=phone1>
					<option value=0 selected>전체 커뮤니티</option>
					<option value=0 <c:if test="${check == 입양/임보 커뮤니티}"> selected</c:if>>입양/임보 커뮤니티</option>
					<option value=1 <c:if test="${check == 펫스타그램 커뮤니티}"> selected</c:if>>펫스타그램 커뮤니티</option>
					<option value=2 <c:if test="${check == 그룹 커뮤니티}"> selected</c:if>>그룹 커뮤니티</option>
					<option value=3 <c:if test="${check == 정보 커뮤니티}"> selected</c:if>>정보 커뮤니티</option>
				</select> 
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
				그룹 커뮤니티 댓글
				<%if (c1List.isEmpty()){%>
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
							<c:forEach var="c1" items="${c1List}" varStatus = "status">
							<tr>
								<td>${c1.commentId}</td>
								<td>
									<a href="<c:url value='/community/group_community/group_content'>
						              	<c:param name='postId' value='${c1.postId}'/>
						              	</c:url>">${p1List[status.index]}
						            </a>
						        </td>					        
								<td>${loginId}</td>
								<td>${c1.commentDate}</td>
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
		<tr>
			<td>
				입양/임보 커뮤니티 댓글
				<%if (c3List.isEmpty()){%>
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
							<c:forEach var="c3" items="${c3List}" varStatus = "status">
							<tr>
								<td>${c3.commentId}</td>
								<td>
									<a href="<c:url value='/community/adopt_community/adopt_info'>
						              	<c:param name='postId' value='${c3.postId}'/>
						              	</c:url>">${p3List[status.index]}
						            </a>
						        </td>					        
								<td>${loginId}</td>
								<td>${c3.commentDate}</td>
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