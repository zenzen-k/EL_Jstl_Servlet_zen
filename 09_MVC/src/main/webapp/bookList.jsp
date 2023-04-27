<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

bookList<br>

<table border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>저자</td>
		<td>가격</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	
	<c:forEach var="lists" items="${lists}">
		<tr>
			<td>${lists.no}</td>
			<td>${lists.title}</td>
			<td>${lists.author}</td>
			<td>${lists.price}</td>
			<td><a href="updateForm.bk?no=${lists.no}">수정</a></td>
			<td><a href="delete.bk?no=${lists.no}">삭제</a></td>
		</tr>
	</c:forEach>
</table>
<br>
<a href="insertForm.jsp">삽입</a>