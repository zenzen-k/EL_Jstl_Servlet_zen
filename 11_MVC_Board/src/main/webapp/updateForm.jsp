<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
content.jsp(글수정 num) => updateForm.jsp<br>

<%@ include file="color.jsp" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style>
	body{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		width: 500px;
	}
	td:nth-child(1) {
		text-align: center;
		background-color: #b0e0e6;
		width: 15%;
	}
</style>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script> <!-- writeSave 함수호출을 위해서  -->


<b>글수정</b>
<form name="writeForm" action="update.bd" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${bb.num}">
<input type="hidden" name="pageNum" value="${pageNum}">
<table>
	<tr>
		<td>이 름</td>
		<td><input type="text" name="writer" size="30" value="${bb.writer}"></td>
	</tr>
	
	<tr>
		<td>제 목</td>
		<td><input type="text" name="subject" size="56" value="${bb.subject}"></td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" size="56" value="${bb.email}"></td>
	</tr>
	
	<tr>
		<td>내 용</td>
		<td>
			<textarea rows="15" cols="55" name="content">${bb.content}</textarea>
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	
	<tr height="30">
		<td colspan="2" align="center" >
			<input type="submit" value="글수정">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="location.href='list.bd?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>