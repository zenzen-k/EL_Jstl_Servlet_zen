<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
basic<br>

<a href="insert.do">insert</a>
<hr>

<a href="http://localhost:8080<%=request.getContextPath()%>/update.do">update</a>
<!-- http://localhost:8080/<%=request.getContextPath()%>/update.do
	에서 8080 뒤에 / 는 뺴도 ㄱㅊ
 -->
<hr>

<a href="http://localhost:8080/07_URLPattern/delete.do">delete</a>
<hr>

<a href="<%=request.getContextPath()%>/select.do">select</a>
<hr>

