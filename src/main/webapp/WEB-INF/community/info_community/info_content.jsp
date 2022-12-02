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
<table>
	<tr>
		<td style="width:50%">
		<!-- <a href="<c:url value='/main/main' />"> -->
			<img src="<c:url value='/images/linkedin_profile_image.png' />" style="width:500px; height:500px"/>		
		</td>
		
		<td style="width:100%">
		<br>
		<h3>정보 게시글</h3>
		   <table style="background-color: #848484; width: 100%; margin-top:0px">
			    <tr style="height:40%; width:100%">
			      <td style="height:40%; width:15%; align:center; background-color:#E6E6E6;" >작성자</td>
			      <td style="height:40%; width:100%; align:center; background-color:#ffffff; padding-left: 10">
			         <!-- 작성자 정보 가져오기 -->
			      </td>
			    </tr>
			    <tr style="height:40%; width:100%">
			      <td style="height:40%; width:15%; align:center; background-color:E6E6E6;" >내용</td>
			      <td style="height:40%; width:100%; align:center; background-color:ffffff; padding-left: 10">
			         <!-- 내용 정보 가져오기 -->
									         <a>팀명 : 뭉게구름</a>
							<p>
							<a>뭉게뭉게 피어올라 윤곽이 확실하게 나타나는 구름과 같이 뚜렷한 성과물을 낼 수 있도록 노력하는 사람들의 모임</a>
						    <ul>
							    <li>팀장 : 20200940 강승연</li>
							    <li>팀원 : 20200979 손다현</li>
							    <li>팀원 : 20201081 최가람</li>
							    <li>팀원 : 20201018 정재운</li>
						    </ul>
						    <br><br>
						    <a>1. 시스템 개요  -  개발 배경 및 목적,  특징 및 장점</a>  
						    <p>1-1. 개발 배경 및 목적
						    <ul>
						    	<li>반려동물의 사육이 일부의 취미가 아닌 현대 사회의 중요한 문화의 하나로 자리 잡음</li>
						    	<li>반려인이 네이버나 유튜브 등의 검색 사이트에서 정보를 찾아봄 으로써 불편함을 느낌</li>
						    	<li>반려동물을 키우기 위한 진입장벽이 높다고 생각하는 사람들을 위한 커뮤니티 운영</li>
						    	<li>-반려동물에 관심이 있는 사람들, 키우는 사람들끼리 소통할 수 있는 환경 구상</li>
						    </ul>
						    <p>1-2. 특징 및 장점
						    <ul>
						    	<li>GPS, Open API(네이버 지도 or 구글맵)을 이용해 주변 동물병원 정보를 알 수 있음</li>
						    	<li>GPS를 이용해 가까운 반려인과의 소통 가능 & 중고거래 가능</li>
						    	<li>자유롭게 이야기 하는 게시판 (질의응답, 소통)((견종, 묘종별, 주제별, 지역별 게시판 종류 선택 가능)</li>
						    	<li>임시보호 관련 공간 (임보/입양)</li>
						    	<li>초보 반려인이 알아야하는 기본적인 지식 습득 가능한 공간   (초보 반려인을 위한 간단한 메뉴얼)</li>
						    	<li>펫스타그램 (서로의 반려동물을 뽐낼 수 있는 공간)</li>
						    </ul>
			      </td>
			    </tr>
			    <tr> <!-- 댓글 작성 -->
			    	<td colspan="2">
			    		<table style="background-color: #848484; width: 100%; margin-top:0px">
						    <tr style="height:40%; width:100%">
						      <td style="height:40%; width:15%; align:center; background-color:#E6E6E6;" >댓글1</td>
						      <td style="height:40%; width:85%; align:center; background-color:#ffffff; padding-left: 10">
						         <!-- 정보 가져오기 -->
						         <%out.print(session.getAttribute("userId") + ": 너무 예뻐요~");%>
						      </td>
						    </tr>
						    <tr style="height:40%; width:100%">
						      <td style="height:40%; width:15%; align:center; background-color:E6E6E6;" >댓글2</td>
						      <td style="height:40%; width:85%; align:center; background-color:ffffff; padding-left: 10">
						         <!-- 정보 가져오기 -->
								 <%out.print(session.getAttribute("userId") + ": 너무 멋져요~");%>
									
						      </td>
						    </tr>
					    </table>
			    	</td>
			    </tr>
		    </table>
		  </td>
      </tr>
 </table>
</body>
</html>