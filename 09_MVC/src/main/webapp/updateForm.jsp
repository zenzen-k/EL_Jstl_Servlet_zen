<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>

<h2>도서 수정</h2>
<form action="update.bk" method="post">
	<input type="hidden" name="no" value="${bb.no}">
	제목 : <input type="text" name="title" value="${bb['title']}"><br>
	저자 : <input type="text" name="author" value="${requestScope.bb.author}"><br>
	가격 : <input type="text" name="price" value="${bb.getPrice()}"><br>
	<input type="submit" value="수정"><br>
</form>