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
	.pop-teambox{
		 margin: 0 auto;
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
<div class="pop-teambox" style="margin-top: 0px;">
  
    <div id="pop_container">
      <ul class="tabs">
        <li class="active site-font-color" rel="tab1" onclick="location.href='/ilos/message/received_list_pop_form.acl'">쪽지</li>
      
      
       
      </ul>
          
      <div class="tab_container">
        <div id="tab1" class="tab_content" style="display: block;">
          <ul>
            
            <li><span><a class="site-link" href="/ilos/message/received_list_pop_form.acl">받은쪽지</a></span></li>
            <li><span><a class="site-link" href="/ilos/message/sent_list_pop_form.acl">보낸쪽지</a></span></li>
          
          </ul>
        </div>
        
        
      </div>
    </div>
    
  <div class="pop-questionbox ">
      <div class="writeMsgWrap">
        <table class="bbswrite writeWrap" border="1">
          <caption>쪽지쓰기 게시판 내용 작성하기</caption>
          <colgroup>
            <col style="width:73px;">
            <col>
          </colgroup>
          <tbody>
            <tr>
              <th scope="row"><label for="wrtTitle">제목</label></th>
              <td><input id="wrtTitle" type="text" class="txttype02" name="txtTitle" maxlength="256" value=""></td>
            </tr>
            <tr>
              <th scope="row"><div id="recvBtn" onclick="recvPop(); return false;" title="회원 상세보기 (새창으로 연결)">받는사람</div></th>
              <td>
                <div id="id_list" style="float: left;"></div>
              </td>
            </tr>          
            
          
            <tr>
              <th scope="row"><label for="wrtContent">내용</label></th>
              <td class="app-opinion"><textarea id="wrtContent" name="content" class="textarea02" style="font-size: 12px;" onkeyup="fc_chk_byte(this,2000);_lec(this);"></textarea></td>
            </tr>
          </tbody>
        </table>
      </div>
    <div class="pop-txtmessage2">
    <!-- <p class="pl04">* 수신자 입력은 회원 검색 후 아이디를 클릭해 주시기 바랍니다.</p> --> 
    <p class="pl04">* 현재 <strong id="ext_len">0</strong>byte 입력했습니다. 전체 <strong>2000</strong>byte 까지 입력 가능합니다.</p> 
    </div>
      <!-- [S]Button -->
      <div class="bbs-rbutton02" style="margin-top: 10px;">
        <div class="site_button" id="sendBtn">전송</div>
        <div class="site_button" id="listBtn">목록</div>
      </div>
      <!-- [E]Button -->
    </div>
    
  </div>

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