<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<tr>
							<td>5</td>
							<td><a href = "post.jsp" class = "postTitle">안녕하세요!!</a></td>
							<td>고양이(cat)</td>
							<td>2022-11-19</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href = "post.jsp" class = "postTitle">반가워요ㅎㅎ</a></td>
							<td>사자(lion)</td>
							<td>2022-11-12</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href = "post.jsp" class = "postTitle">입양 원해요</a></td>
							<td>토끼(rabbit)</td>
							<td>2022-9-19</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href = "post.jsp" class = "postTitle">안녕안녕</a></td>
							<td>판다(panda)</td>
							<td>2022-9-9</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href = "post.jsp" class = "postTitle">안녕하세요</a></td>
							<td>판다(panda)</td>
							<td>2022-8-19</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		</table>
</body>

</html>