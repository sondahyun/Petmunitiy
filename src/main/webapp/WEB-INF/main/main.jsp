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
   @font-face {
		font-family: 'Y_Spotlight';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	.group_main_table1{
		border : none;
	  	border-collapse : collapse;
	  	border-radius : 10px;
	    margin:auto;
	    float:center;
	    text-align:center;
	    width:200px;
	    height: 250px;
	    font-family: 'Y_Spotlight';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
		font-weight: normal;
		font-style: normal; 
		font-size: 12pt; 
		color: Black; 
		background-color: #e8e8e8;
		line-height: 22px;
		table-layout: fixed;
	}
	.pic2{
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	float:center;
		width:300px;
		height:150px;
	}
	.pic_td2, .content_writer1, .content_say1 {
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	width:50px;
	  	float:center;
	  	height:20px;
	}
	.pic_td2, .content_writer2, .content_say2 {
		/* border : 1px solid black;
	  	border-collapse : collapse; */
	  	width:140px;
		height:20px;
		float:center;
		text-align:center;
  	}
  	.content_say2 {
  		display : block;
		text-overflow: ellipsis;
		white-space: nowrap; 
		overflow : hidden;
		width: 50%;
  	}
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
<table style="width:100%">
	<tr>
		<td class="myPage_mini" style="width:30%">
			<%@include file="/WEB-INF/myPage/myPage_include.jsp" %>
		</td> 
		
		<td align="left" style="width:80%">
		<table>
		<tr>
		<td>
		<table class="group_main_table1">
		<a class="nav-link" href="<c:url value='/community/adopt_community/adopt_community' />">입양/임보 게시판</a>
                  <tr></tr>
                  <tr class="pic2">
                     <td class="pic_td2" colspan=2>
                        <a href="<c:url value='/community/group_community/group_content'>
                              <c:param name='postId' value='${item.postId}'/></c:url>"> 사진 </a>
                     </td>
                  </tr>
                  <tr class="content_writer">
                     <td class="content_writer1">작성자</td>
                     <td class="content_writer2">${item.loginId}</td> <!-- 작성자 나타내기 -->
                  </tr>
                  <tr class="content_say">
                     <td class="content_say1">글</td>
                     <td class="content_say2">${item.postContent}</td> <!-- 게시글 불러오기 -->
                  </tr>
              </table>
              </td>
		</tr>
		
		<tr>
		<td>
		<table class="group_main_table1">
		<a class="nav-link" href="<c:url value='/community/petstar_community/petstar_community' />">펫스타그램 게시판</a>
				<tr></tr>
                  <tr class="pic2">
                     <td class="pic_td2" colspan=2>
                        <a href="<c:url value='/community/group_community/group_content'>
                              <c:param name='postId' value='${item.postId}'/></c:url>"> 사진 </a>
                     </td>
                  </tr>
                  <tr class="content_writer">
                     <td class="content_writer1">작성자</td>
                     <td class="content_writer2">${item.loginId}</td> <!-- 작성자 나타내기 -->
                  </tr>
                  <tr class="content_say">
                     <td class="content_say1">글</td>
                     <td class="content_say2">${item.postContent}</td> <!-- 게시글 불러오기 -->
                  </tr>
              </table>
              </td>
		</tr>
		<tr>
		<td><a class="nav-link" href="<c:url value='/community/group_community/group_community' />">정보 게시판</a></td>
		</tr>
		<td class="main">
		<table class="list_table">
	      <colgroup>
	         <col width="15%" />
	         <col width="45%" />
	         <col width="20%" />
	         <col width="20%" />
	      </colgroup>
	      <thead>
	      <tr>
	        <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
	        <th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>등록일자</th>
	      </tr>
	      </thead>
	      <c:forEach var="item" items="${p0List}">
	         <tr>
	         <td>${item.postId }</td>
	          <td>
	             <a href="<c:url value='/community/info_community/info_content'>
	                   	<c:param name='postId' value='${item.postId}'/>
	                  </c:url>">
	             ${item.postTitle}</a>
	          </td>
	           <td>
	             ${item.loginId}
	           </td>
	           <td>
	              ${item.postDate}
	           </td>
	         </tr>
	     </c:forEach> 
		</table>
		</td>
		</table>
		</td>
	</tr>
</table>  

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
      <br>copyright 2022. Cloud.
   </div>
</body>
</html>