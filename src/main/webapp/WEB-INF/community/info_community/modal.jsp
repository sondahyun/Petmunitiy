<!--입양, 임보 펫 정보-->
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>정보 게시글</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
</head>
<body>   
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
<!-- registration form  -->

<!--<h2>회원가입</h2>  -->
		  		<div id="container">
			        <h2>Lorem Ipsum</h2>
			        <button id="btn-modal">모달 창 열기 버튼</button>
			        <div id="lorem-ipsum"></div>
			    </div>
			    <div id="modal" class="modal-overlay">
			        <div class="modal-window">
			            <div class="title">
			                <h2>모달</h2>
			            </div>
			            <div class="close-area">X</div>
			            <div class="content">
			                <p>가나다라마바사 아자차카타파하</p>
			                <p>가나다라마바사 아자차카타파하</p>
			                <p>가나다라마바사 아자차카타파하</p>
			                <p>가나다라마바사 아자차카타파하</p>
			                
			            </div>
			        </div>
			    </div>
			    <script>
			        const loremIpsum = document.getElementById("lorem-ipsum")
			        fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
			            .then(response => response.text())
			            .then(result => loremIpsum.innerHTML = result)
			    </script>

</body>
</html>