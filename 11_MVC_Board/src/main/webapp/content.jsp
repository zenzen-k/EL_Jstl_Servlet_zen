<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style type="text/css">
	body, table{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		width: 500px;
		height: 50px;
	}
	td:nth-child(odd) {
		background-color: #b0e0e6;
	}
	td{
		width: 25%;
		height: 30px;
	}
</style>
list.jsp -> controller(content.bd pageNum parameter) ->content.jsp (${param.pageNum} / ${requestScope.pageNum})<br>


<b>글내용 보기</b>
<form name="contentForm">
<table>
	<tr>
		<td>글번호</td>
		<td>${bb.num}</td>
		<td>조회수</td>
		<td>${bb.readcount}</td>
	</tr>
	
	<tr>
		<td>작성자</td>
		<td>${bb.writer}</td>
		<td>작성일</td>
		<td>
			<fmt:formatDate value="${bb.reg_date}" type="date" pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	
	<tr>
		<td>글제목</td>
		<td colspan="3">${bb.subject}</td>
	</tr>
	
	<tr>
		<td>글내용</td>
		<td colspan="3" align="left"><pre>${bb.content}</pre></td>
	</tr>
	
	<tr>
		<td colspan="4" align="right">
			<input type="button" value="글수정" onClick="location.href='updateForm.bd?num=${bb.num}&pageNum=${param.pageNum}'">
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=${bb.num}&pageNum=${param.pageNum}'">
			<input type="button" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=${bb.ref}&re_step=${bb.re_step}&re_level=${bb.re_level}&pageNum=${param.pageNum}'">
			<input type="button" value="글목록" onclick="location.href='list.bd?pageNum=${param.pageNum}'">
		</td>
	</tr>
</table>
</form>
