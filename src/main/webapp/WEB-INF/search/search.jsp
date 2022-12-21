<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<PostInformation> p0List = (ArrayList<PostInformation>)request.getAttribute("p0List");
	ArrayList<PostGroup> p1List = (ArrayList<PostGroup>)request.getAttribute("p1List");
	ArrayList<PostPetstargram> p2List = (ArrayList<PostPetstargram>)request.getAttribute("p2List");
	ArrayList<PostAdoption> p3List = (ArrayList<PostAdoption>)request.getAttribute("p3List");
	
	if(p0List != null) Collections.sort(p0List);
	if(p1List != null) Collections.sort(p1List);
	if(p2List != null) Collections.sort(p2List);
	if(p3List != null) Collections.sort(p3List);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>search</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/list.css' />" type="text/css">
<script>
function search()
{
	if(searchForm.word.value==""){
		alert("검색어를 입력하세요");
		return false;
	}
	if(searchForm.start.value=="" || searchForm.end.value==""){
		alert("날짜조건을 입력하세요");
		return false;
	}
	searchForm.submit();
	
}

</script>
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<form name="searchForm" action="<c:url value='/search/search'/>">
<table style="width:100%">
<tr>
	<td class="myPage_mini">
		<%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
	</td>
	
	<td class="main">
		<table style="margin-top:0px;">
		<tr>
			<td>
				<select name=community>
					<option value=0 selected>전체 커뮤니티</option>
					<option value=1>입양/임보 커뮤니티</option>
					<option value=2>펫스타그램 커뮤니티</option>
					<option value=3>그룹 커뮤니티</option>
					<option value=4>정보 커뮤니티</option>
				</select> 
				&nbsp;
				<%-- <c:if test="${registerFailed}">value="${user.phone}"</c:if> --%>
				<!-- <input type="date" style="width: 240" name="startDate" > -->
				<%-- <select name=phone1>
					<option value=0 selected>전체 기간</option>
					<option value=0 selected>1일</option>
					<option value=1>2일</option>
					<option value=2>3일</option>
					<option value=3>4일</option>
					<option value=3>직접 기간 입력하기
	 						<input type="date" style="width: 5%" name="startDay >-<input type="date" style="width: 5%" name="endDay" >
 	 <!-- 제이쿼리 -->				
 					</option>
				</select> --%>
				
				<input type="date" style="width: 240" name="start" >-<input type="date" style="width: 240" name="end" >
				&nbsp;
			    <input class="srch" type="text" placeholder="검색어를 입력하세요." name="word">
			    <button class="btn" onClick="search()" >검색</button>
			</td>
		<tr>
		<tr>
			<td>
				<tr>
				<td>
					<br>정보 커뮤니티
					<%if (p0List == null || p0List.size()==0){%>
						<tr><td>작성글이 없습니다<br><br></td></tr><hr>
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
						<c:set var="topN" value="false"/>
						<c:set var="size" value="${p0List.size()}"/>
							<c:forEach var="p0" items="${p0List}" varStatus="i">
								<c:if test="${i.index > 9}"><c:set var="topN" value="true"/></c:if>
								<c:if test="${topN==false}">
									<tr>
										<td>${size-i.index}</td>
										<td>
							              	<a href="<c:url value='/community/info_community/info_content'>
							              	<c:param name='postId' value='${p0.postId}'/>
							              	</c:url>">
							              	${p0.postTitle}</a>
						           		</td>
										<td>${p0.loginId}</td>
										<td>${p0.postDate}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<%}%>
				</td>
			</tr>
				<tr>
				<td>
					<br>그룹 커뮤니티
					<%if (p1List == null || p1List.size()==0){%>
						<tr><td>작성글이 없습니다<br><br></td></tr>
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
						<c:set var="topN" value="false"/>
						<c:set var="size" value="${p1List.size()}"/>
							<c:forEach var="p1" items="${p1List}" varStatus="i">
								<c:if test="${i.index > 9}"><c:set var="topN" value="true"/></c:if>
								<c:if test="${topN==false}">
									<tr>
										<td>${size-i.index}</td>
										<td>
							              	<a href="<c:url value='/community/group_community/group_content'>
							              	<c:param name='postId' value='${p1.postId}'/>
							              	</c:url>">
							              	${p1.postTitle}</a>
						           		</td>
										<td>${p1.loginId}</td>
										<td>${p1.postDate}</td>
									</tr>
								</c:if>
							</c:forEach>		
						</tbody>
					</table>
					<%}%>
				</td>
			</tr>
			<tr>
				<td>
					<br>펫스타그램 커뮤니티
					<%if (p2List == null || p2List.size()==0){%>
						<tr><td>작성글이 없습니다<br><br></td></tr><hr>
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
						<c:set var="topN" value="false"/>
						<c:set var="size" value="${p2List.size()}"/>
							<c:forEach var="p2" items="${p2List}" varStatus="i">
								<c:if test="${i.index > 4}"><c:set var="topN" value="true"/></c:if>
								<c:if test="${topN==false}">
									<tr>
										<td>${size-i.index}</td>
										<td>
							              	<a href="<c:url value='/community/petstar_community/petstar_content'>
							              	<c:param name='postId' value='${p2.postId}'/>
							              	</c:url>">
							              	${p2.postTitle}</a>
						           		</td>
										<td>${p2.loginId}</td>
										<td>${p2.postDate}</td>
									</tr>
								</c:if>
							</c:forEach>		
						</tbody>
					</table>
					<%}%>
				</td>
			</tr>
			<tr>
				<td>
					<br>입양/임보 커뮤니티
					<%if (p3List == null || p3List.size()==0){%>
						<tr><td>작성글이 없습니다<br><br></td></tr><hr>
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
						<c:set var="topN" value="false"/>
						<c:set var="size" value="${p3List.size()}"/>
							<c:forEach var="p3" items="${p3List}" varStatus="i">
								<c:if test="${i.index > 9}"><c:set var="topN" value="true"/></c:if>
								<c:if test="${topN==false}">
									<tr>
										<td>${size-i.index}</td>
										<td>
							              	<a href="<c:url value='/community/adopt_community/adopt_info'>
							              	<c:param name='postId' value='${p3.postId}'/>
							              	</c:url>">
							              	${p3.postTitle}</a>
						           		</td>
										<td>${p3.loginId}</td>
										<td>${p3.postDate}</td>
									</tr>
								</c:if>
							</c:forEach>		
						</tbody>
					</table>
					<%}%>
				</td>
			</tr>
			</table>
		</td>
	</tr>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</form>
<!-- 테이블 종료 -->

</body>
</html>