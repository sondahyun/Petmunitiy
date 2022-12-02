<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	@font-face {
		font-family: 'Y_Spotlight';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	body {
		font-family: 'Y_Spotlight';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	nav {
		 background-color : #e8e8e8;
     	 /*padding: 10px 0px 30px 100px;*/
	}	
	.h {
  		argin:auto;
  		float: right;
  		text-align: right; /* Quirks Mode �� ���� ��� ���� */
	}
	td {
		width : 20%;
		text-align : center;
	}
	header {
		background-color : #e8e8e8;
     	/*padding: 10px 0px 30px 100px;*/
	}
	table {
		/*border: 1px solid #bcbcbc;*/
	}
	/
	/*.navbar-nav mr-auto {
		width : 100%;
	}*/
</style>
	<header>
		<table class="h" >
			<%if(session.getAttribute("loginId") == null) {%>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/user/login/form' />">로그인</a>
	    		</td>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/user/register' />">회원가입</a>
	    		</td>
	    	</th>
	    	<%
			}
			else 
			{  
			%>
			<th>
	    		<td>
	    			<a class="nav-link" href="<c:url value='/user/logout' />">로그아웃 </a>
	    		</td>
	    	</th>
	 	  <%
			} %>
		</table>
		<a href="<c:url value='/main/main' />">
		  <img src="<c:url value='/images/facebook_cover_photo_5.png' />" style="width:100%"/></a>		
   </header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" >
	  <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button> -->
	  <div class="collapse navbar-collapse" id="navbarText">
	    
	      
	    <table class="navbar-nav mr-auto" style="width:100%">
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/community/adopt_community/adopt_community' />">입양/임보 게시판</a>
	    		</td>
	    	</th>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/community/petstar_community/petstar_community' />">펫스타그램</a>
	    		</td>
	    	</th>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/community/group_community/group_community' />">그룹게시판</a>
	    		</td>
	    	</th>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/community/info_community/info_community' />">정보게시판</a>
	    		</td>
	    	</th>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/search/search' />">검색</a>
	    		</td>
	    	</th>
	    <%-- <%if(session.getAttribute("userId") == null) {%>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/user/login/form' />">로그인</a>
	    		</td>
	    	</th>
	    	<th>
	    		<td class="nav-item">
	    			<a class="nav-link" href="<c:url value='/user/register' />">회원가입</a>
	    		</td>
	    	</th>
	    <%
		}
		else 
		{  
		%>
			<th>
	    		<td>
	    			<a class="nav-link" href="<c:url value='/user/logout' />">로그아웃 </a>
	    		</td>
	    	</th>
	    <%
		} %> --%>
	    </table>
	   <%--  <ul class="navbar-nav mr-auto">	
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/community1' />">입양/임보 게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/community2' />">펫스타그램</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/community3' />">그룹게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/community4' />">공지게시판</a>
	      </li>
	 	  <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/search' />">검색</a>
	      </li>
	    
	<%if(session.getAttribute("userId") == null) {%>
	
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/user/login/form' />">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/user/register' />">회원가입</a>
	      </li>
	      
	       
	<%
	}
	else 
	{  
	%>
	       <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/user/logout' />">로그아웃 </a>
	      </li>
	<%
	} %> 
	     
	    </ul>--%>
	  </div>
	</nav>
  

 	
