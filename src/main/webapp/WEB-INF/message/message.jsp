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
        text-align: right; /* Quirks Mode                  */
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
        text-align: center; /* Quirks Mode                  
   }*/
</style>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<div id="popwrap03">
  <div></div>
  <div ox">
  
    <div id="pop_container" class="">
      <ul>
        <li rel="tab1" onclick="location.href='/ilos/message/received_list_pop_form.acl'">쪽지</li>
      
      
        
      </ul>
      
      <div>
        <div id="tab1" class="tab_content" style="display: block;">
          <ul>
            
            <li><span style="font-weight: bold;">받은쪽지</span></li>
            <li><span><a href="/ilos/message/sent_list_pop_form.acl">보낸쪽지</a></span></li>
            <li style="float: right; padding: 5px 0px;">             
                <span><a href="/ilos/message/insert_pop_form.acl">쪽지쓰기</a></span>
                                 
            </li>
          </ul>
        </div>
      
      </div>
    </div>
    <div>
      <select name="newMessgeChk" id="newMessgeChk" style="width:80px; margin-right: 10px;">
        <option value="" selected="">전체</option>
        <option value="N">읽음</option>
        <option value="Y">읽지않음</option>
      </select>
      <input type="text" id="SCH_VAL" name="SCH_VAL" class="txttype" title="검색어를 입력하세요." value="" style="width: 134px;">
      
      <div id="sch_btn" title="검색">search</div>
      
      <div>
        <div onclick="msgCntChange();">
          <div>목록 개수 <img src="/ilos/images/common/lnb/arrow_bottom.png" style="float: right; width: 8px; margin: 6px 3px 0 5px;"></div>
        </div>
        <div id="messageCnt" style="display:none;">
        
          <div>10</div>
        
          <div>20</div>
        
          <div>30</div>
        
          <div>50</div>
        
          <div>100</div>
              
        </div>
      </div>     
       
    </div>
    
    <div>
      <table border="1" summary="받은쪽지 목록(아이디,이름,제목,날짜 항목)">
        <caption>받은쪽지 목록</caption>
        <colgroup>
          <col style="width:40px;">
          <col style="width:80px;">
          <col>
          <col style="width:120px;">
        </colgroup>
        <thead>
          <tr>
            <th scope="col" class="first"><label style="display: inline;"><input type="checkbox" id="allchk" name="allchk" value="Y" class="chktype01"></label></th>
            <th scope="col">보낸사람</th>
            <th scope="col">제목</th>
            <th scope="col" class="last">날짜</th>
          </tr>
        </thead>
        <tbody>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="1047829" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('1047829', 'L6FDUYT4Z4DEU');" style="font-weight:normal"></a>
            </td>
            <td>
            
            </td>
          </tr>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="1030660" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('1030660', 'L6FDUYT4Z4DEU');" style="font-weight:normal"></a>
            </td>
            <td>
            
            
            </td>
          </tr>
        
          <tr>
            <td class="chk"><input type="checkbox" id="wrtInform" name="wrtInform" value="1029025" class="chktype01"></td>
            <td></td>
            <td class="left " style="letter-spacing:-1px;">
              <a class="site-link " href="javascript:viewPage('1029025', 'L6FDUYT4Z4DEU');" style="font-weight:normal"></a>
            </td>
            <td class="number last">
            </td>
          </tr>
        
          <tr>
            <td class="chk"><input type="checkbox" id="wrtInform" name="wrtInform" value="1029019" class="chktype01"></td>
            <td></td>
            <td class="left msg-cancel" style="letter-spacing:-1px;">
              <a class="site-link " href="javascript:viewPage('1029019', 'L6FDUYT4Z4DEU');" style="font-weight:normal"></a>
            </td>
            <td class="number last">
            
              <span class="site-color"> </span>
            
            </td>
          </tr>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="1029012" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('1029012', 'L6FDUYT4Z4DEU');" style="font-weight:normal"></a>
            </td>
            <td>
            </td>
          </tr>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="1005350" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('1005350', 'L6FDUYT4Z4DEU');" style="font-weight:normal"></a>
            </td>
            <td>
            </td>
          </tr>
        
          <tr>
            <td ><input type="checkbox" id="wrtInform" name="wrtInform" value="997764" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a  href="javascript:viewPage('997764', 'QETFSZYMA6WY2');" style="font-weight:normal"></a>
            </td>
            <td>
            </td>
          </tr>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="901797" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('901797', 'B6XVV2UGCCVYU');" style="font-weight:normal"></a>
            </td>
            <td>
            </td>
          </tr>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="899106" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('899106', 'NE4PIHPNAXJGC');" style="font-weight:normal"></a>
            </td>
            <td>
            </td>
          </tr>
        
          <tr>
            <td><input type="checkbox" id="wrtInform" name="wrtInform" value="896350" class="chktype01"></td>
            <td></td>
            <td style="letter-spacing:-1px;">
              <a href="javascript:viewPage('896350', 'B6XVV2UGCCVYU');" style="font-weight:normal"></a>
            </td>
            <td>
            
            </td>
          </tr>
           
           
 
        </tbody>
      </table>
    </div>
    <!-- [S]Paging -->
     





 


 
  <div class="paging"> 


<span class="prev">
  
  <img src="/ilos/images/common/btn/paging_first.gif" alt="처음 목록으로">
  
  <img src="/ilos/images/common/btn/paging_prev.gif" alt="이전 10페이지 보기">
&nbsp;</span> 

  
    
      <em title="현재 선택 목록"> <strong class="site-font-color">1</strong> </em> 
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('11')">2</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('21')">3</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('31')">4</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('41')">5</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('51')">6</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('61')">7</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('71')">8</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('81')">9</a>&nbsp;
    
  
    
      &nbsp;<a class="site-link" href="javascript:listPage('91')">10</a>&nbsp;
    
  


  <span class="next">&nbsp;
  <a href="javascript:listPage('101');"><img src="/ilos/images/common/btn/paging_next.gif" alt="다음 10페이지 보기"></a>&nbsp;
  
  <a href="javascript:listPage('121')"><img src="/ilos/images/common/btn/paging_last.gif" alt="마지막 목록으로"></a>
  
  </span>

  </div>
  
                   
    <!-- [E]Paging -->
    <div class="bbs-rbutton-paging" style="margin-top:10px">
      <div class="site_button" id="deleteBtn" style="display: none;">삭제</div>
      <div class="site_button" id="closeBtn">닫기</div>
    </div>
  </div>
  <div class="pop-team-inbtm mt20"></div>
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