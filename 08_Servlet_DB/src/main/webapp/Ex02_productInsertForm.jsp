<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

Ex02_productInsertForm.jsp<br>

<%
	// ServletContext application = new ServletContext();
	application.setAttribute("flag", "false");
	// form으로 오면 false.
	System.out.println(application.getAttribute("flag"));
%>

<h3>상품 등록 폼</h3>
<form action="insert.prd" method="post">
	상품명 : <input type='text' name="name" value="포도"><br>
	가격 : <input type='text' name="price" value="1000"><br>
	<input type="submit" value="전송">
</form>