<!--펫스타그램 게시글 미리보기-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	@font-face {
		font-family: 'Y_Spotlight';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/Y_Spotlight.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	.petstar_main_table1{
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
</style>
<table class="petstar_main_table1">
	<tr>
		
	</tr>
	<tr class="pic2">
		<td class="pic_td2" colspan=2> 사진 </td>
	</tr>
	<tr class="content_writer">
		<td class="content_writer1">작성자</td>
		<td class="content_writer2"><%out.print(session.getAttribute("userId"));%></td> <!-- 작성자 나타내기 -->
	</tr>
	<tr class="content_say">
		<td class="content_say1">글</td>
		<td class="content_say2">안녕하세요 여러분 반갑습니다~ 펫스타그램 처음이라 떨려요~</td> <!-- 게시글 불러오기 -->
	</tr>
</table>