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
<h4>-- 4번 EL로 받기(param객체) --</h4>
아이디 : ${param.id}<br>
비밀번호 : ${param.passwd}<br>
이름 : ${param.name}<br>
생년월일 : ${param.year}년 ${param.month}월 ${param.day}일<br>
취미 : 
<c:forEach var="h" items="${paramValues.hobby}" varStatus="status">
	${h}
	<c:if test="${!status.last}">,</c:if>
</c:forEach><br>
[성적]<br>
c언어 : ${param.c}<br>
java : ${param.java}<br>
jsp : ${param.jsp}<br>




<hr>
<h4>-- 5번 requestScope로 받기(속성) --</h4>
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




<hr>
<h4>-- 6번 requestScope로 받기(속성, BEAN) --</h4>
아이디 : ${requestScope.pb.id}<br>
비밀번호 : ${requestScope.pb.passwd}<br>
이름 : ${requestScope.pb.name}<br>
생년월일 : ${requestScope.pb.year}년 ${requestScope.pb.month}월 ${requestScope.pb.day}일<br>
취미 : 
<c:forEach var="h" items="${requestScope.pb.hobby}">
	${h}
</c:forEach><br>

[성적]<br>
c언어 : ${requestScope.pb.c}<br>
java : ${requestScope.pb.java}<br>
jsp : ${requestScope.pb.jsp}<br>




<hr>
<h4>-- 7번 Bean로 받기(EL) --</h4>
<c:set var="pb2" value="<%=new myPkg.PersonBean() %>"/>
<c:set target="${pb2}" property="id" value="${param.id}"/>
<c:set target="${pb2}" property="passwd" value="${param.passwd}"/>
<c:set target="${pb2}" property="name" value="${param.name}"/>
<c:set target="${pb2}" property="year" value="${param.year}"/>
<c:set target="${pb2}" property="day" value="${param.day}"/>
<c:set target="${pb2}" property="hobby" value="${paramValues.hobby}"/>
<c:set target="${pb2}" property="c" value="${param.c}"/>
<c:set target="${pb2}" property="java" value="${param.java}"/>
<c:set target="${pb2}" property="jsp" value="${param.jsp}"/>

아이디 : ${pb2.id}<br>
비밀번호 : ${pb2.passwd}<br>
이름 : ${pb2.name}<br>
생년월일 : ${pb2.year}년 ${pb2.month}월 ${pb2.day}일<br>
취미 : 
<c:forEach var="h" items="${pb2.hobby}">
	${h}
</c:forEach><br>

[성적]<br>
c언어 : ${pb2.c}<br>
java : ${pb2.java}<br>
jsp : ${pb2.jsp}<br>





<hr>
<%
	// 현재 페이지에서만 사용가능한 변수
	pageContext.setAttribite("id","ha");
	
	//request : 현재페이지에서 설정한 값을 다음 페이지까지 사용하고 싶을 때
	request.setAttribute("id", "haha");
	
	//session : 하나의 웹브라우저를 사용하는 중에 정보가 유지된다.
	session.setAttribute("id", "hahaha");
	
	//application : 해당 프로젝트 안에서는 어디서든 가능하다. 가장 큰 범위.
	application.setAttribute("id", "hahahaha");
%>

${id} 
<!-- 
	가장 범위가 작은것부터 찾아서 적용한다.
	설정한것이 많이서 각각 가져오고 싶다면
	${pageScope}
	${requestScope}
	${sessionScope}
	${applicationScope}
 -->

