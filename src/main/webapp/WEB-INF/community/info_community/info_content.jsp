<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   @SuppressWarnings("unchecked")
   PostInformation post = (PostInformation)request.getAttribute("post");
%>
<html>
<head>
<title>정보 게시글</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/modal.css' />" type="text/css">
</head>
<body>   
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->
<table style="width:100%">
	<tr>		
		<td style="width:100%">
		<br>
		<h3>정보 게시글</h3>
		   <table style="background-color: #848484; width: 100%; margin-top:0px">
			    <tr>
			    	<td style="height:40%; width:15%; align:center; background-color:#E6E6E6;" >이미지</td>
			    	<td style="width:50%">
				<!-- <a href="<c:url value='/main/main' />"> -->
					<img src="<c:url value='/images/linkedin_profile_image.png' />" style="width:500px; height:500px"/>		
				</td>
				</tr>
				<tr style="height:40%; width:100%">
			      <td style="height:40%; width:15%; align:center; background-color:#E6E6E6;" >작성자</td>
			      <td style="height:40%; width:100%; align:center; background-color:#ffffff; padding-left: 10">
			        ${post.loginId}
			      </td>
			    </tr>
			    <tr style="height:40%; width:100%">
			      <td style="height:40%; width:15%; align:center; background-color:#E6E6E6;" >작성일자</td>
			      <td style="height:40%; width:100%; align:center; background-color:#ffffff; padding-left: 10">
			        ${post.postDate}
			      </td>
			    </tr>
			    <tr style="height:40%; width:100%">
			      <td style="height:40%; width:15%; align:center; background-color:E6E6E6;" >내용</td>
			      <td style="height:40%; width:100%; align:center; background-color:ffffff; padding-left: 10">
			         ${post.postContent}
			      </td>
			    </tr>
		    </table>
		 </td>
		</tr>
		<tr>
			<td>
				<br>
				 <h3>댓글 작성하기</h3>
				<div class="container">
					<div class="form-group">
						<form method="post" encType = "multipart/form-data"<%--  action="commentAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID%> --%>">
							<table class="table table-striped" style="text-align: center; width:100%; border: 1px solid #dddddd">
								<tr>
									<td style="border-bottom:none; width:10%" valign="middle"><br><br>이름<!-- 이름 --></td>
									<td style="width:80%"><input type="text" style="width:100%; height:80px" class="form-control" placeholder="댓글을 입력하세요." name = "commentText"></td>
									<td style="width:10%"><br><br><input type="submit" class="btn" value="댓글 작성"></td>
								</tr>
								<tr>
									<td colspan="3"><input type="file" name="fileName"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<br>
				 <h3>댓글 목록</h3>
				<div class="container">
					<div class="form-group">
						<form method="post" encType = "multipart/form-data"<%--  action="commentAction.jsp?bbsID=<%= bbsID %>&boardID=<%=boardID%> --%>">
							<table class="table table-striped" style="text-align: center; width:100%; border: 1px solid #dddddd">
								<tr>
									<td style="border-bottom:none; width:10%" valign="middle"><br><br>이름<!-- 이름 --></td>
									<td style="width:80%"><input type="text" style="width:100%; height:40px"></td>
									<% if(session.getAttribute("loginId") != null) {%> <!-- 작성자 = 로그인한 사람일 경우 -->
										<td style="width:10%;"><input type="submit" class="btn" value="댓글 수정"></td>
										<td style="width:10%;"><input type="submit" class="btn" value="댓글 삭제"></td>								
									<%} %>
								</tr>
								<tr>
									<td colspan="3">작성일:</td><td style="width:10%"><br><br></td>									
								</tr>
							</table>
						</form>
					</div>
				</div>
			</td>
		</tr>
		<script>
		
		</script>
		<%-- 모달 이용 
		<tr>
		 <td style="width:100%">
			  	<div id="container">
			        <button id="btn-modal">댓글 작성</button>
			    </div>
			    <div id="modal" class="modal-overlay">
			        <div class="modal-window">
			            <div class="title">
			                <h2>댓글 작성</h2>
			            </div>
			            <div class="close-area">닫기</div>
			            <div class="content">
			            <form name="form" method="POST" action="<c:url value='/user/register' />">	    
			                <c:if test="${registerFailed}">
						      <font color="red"><c:out value="${exception.getMessage()}" /></font>
						    </c:if>  
						    <input type="text" style="width: 60%" name="userNickname" >
									 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
						    <input class="btn" type="button" value="등록" onClick="userCreate()"> &nbsp;
						</form>
			            </div>
			        </div>
			    </div>
			    <script>
				   /*  const loremIpsum = document.getElementById("lorem-ipsum")
				    fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
				        .then(response => response.text())
				        .then(result => loremIpsum.innerHTML = result) */
				    const modal = document.getElementById("modal")
				    function modalOn() {
				        modal.style.display = "flex"
				    }
				    function isModalOn() {
				        return modal.style.display === "flex"
				    }
				    function modalOff() {
				        modal.style.display = "none"
				    }
				    const btnModal = document.getElementById("btn-modal")
				    btnModal.addEventListener("click", e => {
				        modalOn()
				    })
				    const closeBtn = modal.querySelector(".close-area")
				    closeBtn.addEventListener("click", e => {
				        modalOff()
				    })
				    modal.addEventListener("click", e => {
				        const evTarget = e.target
				        if(evTarget.classList.contains("modal-overlay")) {
				            modalOff()
				        }
				    })
				    window.addEventListener("keyup", e => {
				        if(isModalOn() && e.key === "Escape") {
				            modalOff()
				        }
				    })
			    </script>
		  	<table style="background-color: #848484; width: 100%; margin-top:0px">
					<tr style="height:40%; width:100%">
						<td style="height:40%; width:15%; align:center; background-color:#ffffff; padding-left: 10">
						        <!-- 댓글 작성자 정보 가져오기 -->
							<%out.print(session.getAttribute("userId"));%>
						</td>
						<td style="height:40%; width:85%; align:center; background-color:ffffff; padding-left: 10">
							<!-- 댓글 내용 정보 가져오기 -->
						</td>
					</tr>
				</table>
		  </td>
      </tr> --%>
 </table>
</body>
</html>