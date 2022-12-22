<%@page contentType="text/html; charset=utf-8" import="model.*"
	import="java.util.*" import="controller.user.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<PostInformation> p0List = (ArrayList<PostInformation>)request.getAttribute("p0List");
	ArrayList<PostPetstargram> p2List = (ArrayList<PostPetstargram>)request.getAttribute("p2List");
	ArrayList<PostAdoption> p3List = (ArrayList<PostAdoption>)request.getAttribute("p3List");
%>
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
	    height: 200px;
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
		width:200px;
		height:130px;
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
	  	width:50px;
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
		<a class="nav-link" href="<c:url value='/community/adopt_community/adopt_community' />">입양/임보 게시판</a>
			<table>
        		<tr></tr>
	         <%if(p3List.isEmpty()) {%>
	         	<tr><td>작성한 글이 없습니다.</td></tr>
	         <%} else{ %>
	         	<tr>
         		<c:set var="topN" value="false"/>
         		<% int index = 0; %>
	         	<c:forEach var="p3" items="${p3List}" varStatus="i">
	                <td>
	                <table class="group_main_table1">
	                	<tr>	
	                		<td>
	                			<c:if test="${i.index > 5}"><c:set var="topN" value="true"/></c:if>
								<c:if test="${topN==false}">
								<%
									String find3User = p3List.get(index).getLoginId();									
								%>
									<c:set var="userName3" value="<%=UserSessionUtils.getUserNickName(find3User) %>"/>
					                <tr class="pic2">
					                	<td class="pic_td2" colspan=2>
						                 <a href="<c:url value='/community/adopt_community/adopt_info'>
						                          <c:param name='postId' value='${p3.postId}'/></c:url>"> 사진 </a>
						                </td>
						            </tr>
						            <tr class="content_writer">
						                <td class="content_writer1">작성자</td>
						                <td class="content_writer2">${userName3}</td> <!-- 작성자 나타내기 -->
						            </tr>
						            <tr class="content_say">
						                <td class="content_say1">글</td>
						                <td class="content_say2">${p3.postTitle}</td> <!-- 게시글 불러오기 -->
						            </tr>
					            </c:if>
					            <%index++; %>   
					           </td>
					        </tr>
					  </table> 
					  </td>
		     	</c:forEach>
          <%} %>
          		</tr>
              </table>
          </td>
	</tr>
		
	<tr>
		<td>
		<a class="nav-link" href="<c:url value='/community/petstar_community/petstar_community' />">펫스타그램 게시판</a>
		<table>
				<tr></tr>
				<%if(p2List.isEmpty()) {%>
         		<tr>
         			<td colspan=6>작성한 글이 없습니다.</td>
         		</tr>
         		
         		<%} else{ %>
         		<tr>
         			
	         		<c:set var="topN" value="false"/>
	         		<% int index2 = 0; %>
		         	<c:forEach var="p2" items="${p2List}" varStatus="i">
		         	<td>
		         		<table class="group_main_table1">
		                <c:if test="${i.index > 5}"><c:set var="topN" value="true"/></c:if>
						<c:if test="${topN==false}">
						<%
							String find2User = p2List.get(index2).getLoginId();	
							String file2 = p2List.get(index2).getFileName();									
						%>
						<c:set var="userName2" value="<%=UserSessionUtils.getUserNickName(find2User) %>"/>
		                  <tr class="pic2">
		                     <td class="pic_td2" colspan=2>
		                     <%if(file2 != null) {%>
								<a href="<c:url value='/community/petstar_community/petstar_content'>
										<c:param name='postId' value='${p2.postId}'/></c:url>">  
										<img src="<c:url value='/upload/${p2.fileName}'/>" style="width:200px; height:200px" />		
								</a>	
							<%} else{%>
								<a href="<c:url value='/community/petstar_community/petstar_content'>
	                              <c:param name='postId' value='${p2.postId}'/></c:url>"> 					
	                              <img src="<c:url value='/images/linkedin_profile_image.png'/>" style="width:200px; height:200px" />		
							 	</a>
						 <%} %>
		                     </td>
		                  </tr>
		                  <tr class="content_writer">
		                     <td class="content_writer1">작성자</td>
		                     <td class="content_writer2">${userName2}</td> <!-- 작성자 나타내기 -->
		                  </tr>
		                  <tr class="content_say">
		                     <td class="content_say1">글</td>
		                     <td class="content_say2">${p2.postTitle}</td> <!-- 게시글 불러오기 -->
		                  </tr>
		                  </c:if>
		                  <%index2++; %>
	                  	</table>
	                  </td>
	                  </c:forEach>
                  <%} %>
                  </tr>
         </table>
        </td>
	</tr>
	<tr>
		<td>
		<a class="nav-link" href="<c:url value='/community/info_community/info_community' />">정보 게시판</a>
		<table>
				<tr></tr>
				<%if(p0List.isEmpty()) {%>
         		<tr>
         			<td colspan=6>작성한 글이 없습니다.</td>
         		</tr>
         		
         		<%} else{ %>
         		<tr>
	         		<c:set var="topN" value="false"/>
	         		<% int index3 = 0; %>
		         	<c:forEach var="p0" items="${p0List}" varStatus="i">
		         	<td>
		         		<table class="group_main_table1">
		                <c:if test="${i.index > 4}"><c:set var="topN" value="true"/></c:if>
						<c:if test="${topN==false}">
							<%
								String find0User = p0List.get(index3).getLoginId();	
								String file0 = p0List.get(index3).getFileName();									
							%>
							<c:set var="userName0" value="<%=UserSessionUtils.getUserNickName(find0User) %>"/>
			                  <tr class="pic2">
			                     <td class="pic_td2" colspan=2>
			                     <%if(file0 != null) {%>
									<a href="<c:url value='/community/info_community/info_content'>
											<c:param name='postId' value='${p0.postId}'/></c:url>">  
											<img src="<c:url value='/upload/${p0.fileName}'/>" style="width:200px; height:200px" />		
									</a>	
								<%} else{%>
									<a href="<c:url value='/community/info_community/info_content'>
		                              <c:param name='postId' value='${p0.postId}'/></c:url>"> 					
		                              <img src="<c:url value='/images/linkedin_profile_image.png'/>" style="width:200px; height:200px" />		
								 	</a>
							 <%} %>
			                     </td>
			                  </tr>
			                  <tr class="content_writer">
			                     <td class="content_writer1">작성자</td>
			                     <td class="content_writer2">${userName0}</td> <!-- 작성자 나타내기 -->
			                  </tr>
			                  <tr class="content_say">
			                     <td class="content_say1">글</td>
			                     <td class="content_say2">${p0.postTitle}</td> <!-- 게시글 불러오기 -->
			                  </tr>
			                  </c:if>
		                  <%index3++; %>
	                  	</table>
	                  </td>
	                  </c:forEach>
                  <%} %>
                  </tr>
         </table>
        </td>
	</tr>
</table>  
</td></tr></table>

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