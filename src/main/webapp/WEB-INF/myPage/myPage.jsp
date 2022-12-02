<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>myPage</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %><!-- 화면 로드 시 서버로부터 커뮤니티 목록을 가져와 commSelect 메뉴 생성 -->
   <table>
      <tr>
         <td width="5%"><%@include file="/WEB-INF/myPage/myPage_info_mini.jsp"%>
         </td>
         <td width="90%"><%@include file="/WEB-INF/myPage/myPage_info.jsp"%>
         </td>
   </table>
</body>

</html>