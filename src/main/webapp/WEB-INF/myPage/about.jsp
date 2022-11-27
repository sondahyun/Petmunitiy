<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Petmunity</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<div> 
   <a href="#" onclick="nhn.search.toggleBoxLayer('divSearchDate');return false;">전체기간</a>
    <ul class="select_list" style="width:291px;max-height:295px;">
         <li><a href="#" onclick="applySearchOption('searchdate', 'all', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">전체기간</a></li>
         <li><a href="#" onclick="applySearchOption('searchdate', '1d', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1일</a></li>
         <li><a href="#" onclick="applySearchOption('searchdate', '1w', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1주</a></li>
         <li><a href="#" onclick="applySearchOption('searchdate', '1m', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1개월</a></li>
         <li><a href="#" onclick="applySearchOption('searchdate', '6m', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">6개월</a></li>
         <li><a href="#" onclick="applySearchOption('searchdate', '1y', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1년</a></li>
    </ul>
</div>
<div class="detail">
    <br>copyright 2021. WH. All rights reserved.
</div>
</body>
</html>