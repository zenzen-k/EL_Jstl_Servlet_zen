<%@page import="myPkg.PersonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h4>-- 1번 속성으로 받기 --</h4>
아이디 : <%=request.getAttribute("id")%><br>
비밀번호 : <%=request.getAttribute("passwd")%><br>
이름 : <%=request.getAttribute("name")%><br>
생년월일 : <%=request.getAttribute("year")%>년 <%=request.getAttribute("month")%>월 <%=request.getAttribute("day")%>일<br>
취미 : 
<%
String[] hobby = (String[])request.getAttribute("hobby");
%>
<c:forEach var="h" items="${hobby}" varStatus="status">
	${h}
	<c:if test="${!status.last}">,</c:if>
</c:forEach><br>
[성적]<br>
c언어 : <%=request.getAttribute("c")%>점<br>
java : <%=request.getAttribute("java")%>점<br>
jsp : <%=request.getAttribute("jsp")%>점<br>




<hr>
<h4>-- 2번 BEAN으로 받기 --</h4>
<% PersonBean pb = (PersonBean)request.getAttribute("pb"); %>

아이디 : <%=pb.getId()%><br>
비밀번호 : <%=pb.getPasswd() %><br>
이름 : <%=pb.getName() %><br>
생년월일 : <%=pb.getYear() %>년 <%=pb.getMonth() %>월 <%=pb.getDay() %>일<br>
취미 : 
<%
	for(String h : pb.getHobby()){
		out.print(h + " ");
	}
%><br>
[성적]<br>
c언어 : <%=pb.getC() %><br>
java : <%=pb.getJava() %><br>
jsp : <%=pb.getJsp() %><br>




<hr>
<h4>-- 3번 parameter로 받기 --</h4>
아이디 : <%=request.getParameter("id") %><br>
비밀번호 : <%=request.getParameter("passwd") %><br>
이름 : <%=request.getParameter("name") %><br>
생년월일 : <%=request.getParameter("year") %>년 <%=request.getParameter("month") %>월 <%=request.getParameter("day") %>일<br>
취미 : 
<%
	String[] hb = request.getParameterValues("hobby");
	for(String h : hb){
		out.print(h + " ");
	}
%><br>
[성적]<br>
c언어 : <%=request.getParameter("c") %><br>
java : <%=request.getParameter("java") %><br>
jsp : <%=request.getParameter("jsp") %><br>




<hr>
<h4>-- 4번 EL로 받기 --</h4>
아이디 : ${param.id}<br>
비밀번호 : ${param.passwd}<br>
이름 : ${param.name}<br>
생년월일 : ${param.year}년 ${param.month}월 ${param.day}일<br>
취미 : 
<c:forEach var="h" items="${hobby}" varStatus="status">
	${h}
	<c:if test="${!status.last}">,</c:if>
</c:forEach><br>
[성적]<br>
c언어 : ${param.c}<br>
java : ${param.java}<br>
jsp : ${param.jsp}<br>




<hr>
<h4>-- 5번 requestScope로 받기 --</h4>
아이디 : ${requestScope.id}<br>
비밀번호 : ${requestScope.passwd}<br>
이름 : ${requestScope.name}<br>
생년월일 : ${requestScope.year}년 ${requestScope.month}월 ${requestScope.day}일<br>
취미 : 
<c:forEach var="h" items="${requestScope.hobby}">
	${h}
</c:forEach><br>

[성적]<br>
c언어 : ${requestScope.c}<br>
java : ${requestScope.java}<br>
jsp : ${requestScope.jsp}<br>