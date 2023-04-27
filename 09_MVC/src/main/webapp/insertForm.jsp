<%@page import="myPkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>
<h2>도서 등록</h2>
<form action="insert.bk" method="post">
	제목 : <input type="text" name="title"><br>
	저자 : <input type="text" name="author"><br>
	가격 : <input type="text" name="price"><br>
	<input type="submit" value="등록"><br>
	<!-- value 안써도 ㄱㅊ 기본이 제출 -->
</form>

<%
	application.setAttribute("flag", "false");
%>