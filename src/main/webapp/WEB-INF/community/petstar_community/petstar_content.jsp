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
				
				<!-- 작성자 == 방문자일때 폼 수정 버튼 뜸 -->
				<a class="nav-link" 
				href="<c:url value='/community/petstar_community/petstar_content_update'>
				<c:param name='postId' value='${p2.postId}'/> 
				</c:url>">폼 수정</a>
				
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
							<!-- 제목 정보 가져오기 --> ${p2.postTitle}
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
							<!-- 종 정보 가져오기 --> ${p2.kind}
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
							<!-- 내용 정보 가져오기 --> ${p2.postContent}
						</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><br>
				<h3>댓글 작성하기</h3>
				<div class="container">
					<div class="form-group">
						<form name="cmForm" method="post"
							action="<c:url value='/community/petstar_community/add_comment'>
						<c:param name='postId' value='${p2.postId}'/>
						</c:url>">
							<table class="table table-striped"
								style="text-align: center; width: 100%; border: 1px solid #dddddd">
								<tr>
									<td style="border-bottom: none; width: 10%" valign="middle"><br>
									<%
										int loginUserId = UserSessionUtils.getLoginUserId(session);								
									%>
									<c:set var="lui" value="<%=UserSessionUtils.getUserNickName(loginUserId) %>"/>
									<br>${lui}</td>
									<td style="width: 80%"><input type="text"
										style="width: 100%; height: 80px" name="commentContent"
										class="form-control" placeholder="댓글을 입력하세요."></td>
									<td style="width: 10%"><br>
									<br>
									<input type="submit" class="btn" value="댓글 작성"></td>
								</tr>
								<tr>
									<td colspan="3"><input type="file" name="fileName"></td>
								</tr>
							</table>
						</form>
					</div>
				</div></td>
		</tr>
		<tr>
			<td><br>
				<h3>댓글 목록</h3>
				<div class="container">
					<div class="form-group">
						<table class="table table-striped"
								style="text-align: center; width: 100%; border: 1px solid #dddddd">
								<% int index=0; %>
								<c:forEach var="item" items="${c2List}">
									<%
										int findUser = c2List.get(index).getUserId();									
									%>
									<c:set var="userName" value="<%=UserSessionUtils.getUserNickName(findUser) %>"/>
									<c:if test="${item.postId == pId}">
										<tr>
											<td style="border-bottom: none; width: 10%" valign="middle"><br><br>${userName}</td>
											<c:if test="${uId != item.userId}">
												<td style="width:80%"><input type="text" value="${item.commentContent}" style="width:100%; height:40px" readonly></td>
											</c:if>
											<c:if test="${uId == item.userId}">
												<form name="frmU" method="post" action="<c:url value='/community/petstar_community/update_comment'><c:param name="postId" value="${pId}"></c:param><c:param name='commentId' value='${item.commentId}'></c:param></c:url>">
		                                             <td style="width:80%"><input name="commentContent" type="text" value="${item.commentContent}" style="width:100%; height:40px"></td>
		                                             <td style="width:10%;"><input type="submit" class="btn" value="댓글 수정"></td>
		                                    	</form>
                                    			<form name="frmD" method="post" action="<c:url value='/community/petstar_community/delete_comment'><c:param name="postId" value="${pId}"></c:param><c:param name='commentId' value='${item.commentId}'></c:param></c:url>">
			                                       <td style="width:10%;"><input type="submit" class="btn" value="댓글 삭제"></td>
			                                    </form>
											</c:if>
										</tr>
										<tr>
											<td colspan="3">작성일: ${item.commentDate}</td>
											<td style="width: 10%"><br>
											<br></td>
										</tr>
									</c:if>
									<%index++; %>
								</c:forEach>
							</table>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>