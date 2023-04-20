<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01.el.jsp</title>
</head>
<body>
	<%
	out.print("age:" + application.getAttribute("a_age"));
	%>

	Hello<br>
	<%="Hello"%><br>
	<%out.print("Hello<br>");%>
	${"Hello"}<br>
	$('작업대상')<br>
	${3+4}<br> 
	${"3"+"4"}<br> 
	${"3+4"}<br>
	
	\${3+4} = ${3+4}<br>
	${3+4} = ${3+4} <br>
	
	${10 == 20} <br>
	${10 eq 20} <br>
	
	${10 != 20} <br>
	${10 ne 20} <br>
	
</body>
</html>