<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Petmunity</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
  /*.container {
     position: absolute;
     width : 50%
   }
   table {
      width : 30%
      
   }*/
   .container .btn {
     position: absolute;;
     top: 50%;
     left: 95%;
     transform: translate(-70%, -70%);
     -ms-transform: translate(-70%, -70%);
     background-color: #5fbee3;
     color: white;
     font-size: 1px;
     padding: 12px 24px;
     border: none;
     cursor: pointer;
     border-radius: 5px;
     text-align: center;
   }
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
		
	.h {
  		margin:auto;
  		float: right;
  		text-align: right; /* Quirks Mode �� ���� ��� ���� */
	}
   .detail {
      background-color : #e8e8e8;
      padding: 20px 0px 30px 100px;
   }
   /*.image {
      position:relative;
      margin: 50px;
   }*/
   /*.login {
      text-decoration-line:none;
      font-size:10px;
      
   }
   .navbar-nav mr-auto {
   		margin:auto;
  		float: right;
  		text-align: center; /* Quirks Mode �� ���� ��� ���� 
   }*/
</style>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
   
<%-- <div class="image" align="center">
	<a href="../../main/main1.jsp">
		  <img src="<c:url value='/images/facebook_cover_photo_5.png' />" style="width:100%"/></a>	
	<a href="../../main/main1.jsp">
		  <img src="<c:url value='/images/facebook_cover_photo_5.png' />" style="width:100%"/></a>	
	<a href="../../main/main1.jsp">
		  <img src="<c:url value='/images/facebook_cover_photo_5.png' />" style="width:100%"/></a>	
	<a href="../../main/main1.jsp">
		  <img src="<c:url value='/images/facebook_cover_photo_5.png' />" style="width:100%"/></a>	  
</div> --%>
  <div class="detail">
      <br>copyright 2021. WH. All rights reserved.
   </div>
</body>
</html>