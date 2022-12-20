<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" import="java.util.*" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // @SuppressWarnings("unchecked")
	PostInformation post = (PostInformation)request.getAttribute("post0");
	//Collections.sort(c0List);
%>
<c:set var="pId" value="<%=post.getPostId() %>"/>
<html>
<head>
<title>정보 폼 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/modal.css' />" type="text/css">
<script>
function applyInfo() {
   alert("실행");

   if (form.postTitle.value == "") {
      alert("제목을 입력하십시오.");
      form.postTitle.focus();
      return false;
   }
   
   if (form.postContent.value == "") {
	      alert("내용을 입력하십시오.");
	      form.postContent.focus();
	      return false;
	}
   
   //프론트팀 전달
   /* var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   //""
   if(emailExp.test(form.email.value)==false) {
      alert("이메일 형식이 올바르지 않습니다.");
      form.email.focus();
      return false;
   }
   //동작?
   var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
   if(phoneExp.test(form.phone.value)==false) {
      alert("전화번호 형식이 올바르지 않습니다.");
      form.phone.focus();
      return false;
   } */
   //form.method="post";
   form.submit();
}

function userList(targetUri) {
   form.action = targetUri;
   form.submit();   //get
}

</script>
</head>
<body>   
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->
<form name="form" method="POST" action="<c:url value='/community/info_community/info_content_update' />" enctype="multipart/form-data">
<table style="width:100%">
	<tr>		
		<td style="width:100%">
		<br>
		<h3>정보 폼</h3>
		<br>
		   <table style="background-color: #848484; width: 100%; margin-top:0px">
			    <tr>
			    	<td style="height:40%; width:15%; align:center; background-color:#E6E6E6;" >이미지</td>
			    	<td style="width:50%">
				<!-- <a href="<c:url value='/main/main' />"> -->
					<img src="<c:url value='/upload/${post.fileName}'/>" />
					<input type="file" style="width: 60%" name="userNickname" >			
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
			      <td style="height:40%; width:100%; align:center; background-color:#ffffff; padding-left: 10">
			        <input type="text" style="width: 60%" value="${post.PostContent}" name="userNickname" >			      
			      </td>
			    </tr>
		    </table>
		 </td>
	</tr>
	<tr>
		<td>
			<br><input type="submit" class="btn" value="게시글 수정">
		</td>
	</tr>
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
</form>
</body>
</html>