<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


Ex02_productList.jsp<br>

<table border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>가격</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	
	<c:forEach var="lists" items="${lists}">
		<tr>
			<td>${lists.num}</td>
			<td>${lists['name']}</td>
			<td>${lists.price}</td>
			<td><a href="updateForm.prd?num=${lists.num}">수정</a></td>
			<td><a href="delete.prd?num=${lists.num}">삭제</a></td>
		</tr>
	</c:forEach>
</table>

<a href="Ex02_productInsertForm.jsp">상품 등록</a>