<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/btn.css' />" type="text/css">
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<br>
<div>
<div class="list-search">
    <form name="frmSearch" action="" onsubmit="return false;">
        <input type="hidden" name="searchdate" id="searchdate" value="all">
        <div class="select_component    is_selected" style="width: 144px" id="divSearchDate">
            <a href="#" onclick="nhn.search.toggleBoxLayer('divSearchDate');return false;" id="currentSearchDate" class="select_box">전체기간</a>
            <ul class="select_list" style="width:291px;max-height:295px;">
                <li><a href="#" onclick="applySearchOption('searchdate', 'all', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">전체기간</a></li>
                <li><a href="#" onclick="applySearchOption('searchdate', '1d', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1일</a></li>
                <li><a href="#" onclick="applySearchOption('searchdate', '1w', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1주</a></li>
                <li><a href="#" onclick="applySearchOption('searchdate', '1m', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1개월</a></li>
                <li><a href="#" onclick="applySearchOption('searchdate', '6m', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">6개월</a></li>
                <li><a href="#" onclick="applySearchOption('searchdate', '1y', 'currentSearchDate', this);nhn.search.toggleBoxLayer('divSearchDate');return false;">1년</a></li>
                <li id="date_input_area">
                    <div id="date_enter" class="date_enter">
                        <span id="explain_period" class="tit">기간 입력</span>

                        
                            
                            
                                <input type="text" id="input_1" maxlength="10" value="2017-12-26">
                                <input type="text" id="input_2" maxlength="10" value="2018-01-12">
                            
                        
                        <button id="btn_set" class="btn_set">설정</button>
                    </div>
                </li>
            </ul>
        </div>
<div class="select_component" style="width: 144px" id="divSearchBy">
            <a href="#" onclick="nhn.search.toggleBoxLayer('divSearchBy');return false;" id="currentSearchBy" class="select_box">게시글 + 댓글</a>
                <ul class="select_list">
                    <li><a href="#" onclick="applySearchOption('searchBy', '0', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'post_comment'});return false;">게시글 + 댓글</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '1', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'title'});return false;">제목만</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '3', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'writer'});return false;">글작성자</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '4', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'comment'});return false;">댓글내용</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '5', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'comment_writer'});return false;">댓글작성자</a></li>
                </ul>
            
        </div>
        <input type="hidden" name="searchBy" id="searchBy" value="0">
        <div class="select_component" style="width: 144px" id="divSearchBy">
               <a href="#" onclick="nhn.search.toggleBoxLayer('divSearchBy');return false;" id="currentSearchBy" class="select_box">게시글 + 댓글</a>
                <ul class="select_list">
                    <li><a href="#" onclick="applySearchOption('searchBy', '0', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'post_comment'});return false;">게시글 + 댓글</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '1', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'title'});return false;">제목만</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '3', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'writer'});return false;">글작성자</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '4', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'comment'});return false;">댓글내용</a></li>
                    <li><a href="#" onclick="applySearchOption('searchBy', '5', 'currentSearchBy', this);nhn.search.toggleBoxLayer('divSearchBy');oBAStatSender.sendByKey('PC_4161_254', {dropdown_menu: 'comment_writer'});return false;">댓글작성자</a></li>
                </ul>
            
        </div>

        <div class="input_search_area">
            <div class="input_component" style="width: 200px">
                <input type="text" id="query" name="query" placeholder="검색어를 입력해주세요" value="" onkeydown="if (event.keyCode == 13) {nhn.search.goSearch(this,false);clickcr(this, 'sch.bsearch','','',event)}">
            </div>
            <button onclick="nhn.search.goSearch(this,false);clickcr(this, 'sch.bsearch','','',event); return false;" class="btn-search-green">검색</button>
        </div>
    </form>
</div>
</div>
<div>
	<!-- <input type="date" style="width: 240" name="startDate" > -->
	<button class="btn1" >날짜</button>
    <input class="srch" type="text" placeholder="검색어를 입력하세요.">
    <button class="btn" >검색</button>
</div>

<!-- 테이블 종료 -->

</body>
</html>