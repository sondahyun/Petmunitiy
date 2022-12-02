<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <%-- <table style="background-color: #848484; width: 100%">
	 <!--<center>-->
	 <tr height="40">
		<td width="90%" bgcolor="ffffff" style="padding-left: 10">
			<input type="text" style="width: 240" name="userNickname" >
				 	<c:if test="${registerFailed}">value="${user.userNickname}"</c:if>
		</td>
	 </tr>
	</table>
	<table>
		<tr align="center">
			<td align="left">
			<input class="btn" type="button" value="등록" onClick="userCreate()"> &nbsp;
			</td>
		 </tr>
	</table> --%>
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

</body>
</html>