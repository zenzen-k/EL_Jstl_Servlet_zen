<%@page import="myPkg.Member"%>
<%@page import="myPkg.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//request.setCharacterEncoding("utf-8"); 생략가능
	Member mb = (Member)request.getAttribute("mb");
%>

이름1 : <%=request.getParameter("name") %><br>
나이1 : <%=request.getParameter("age") %><br>
성별1 : <%=request.getParameter("gender") %><br>
취미1 : 
<%
	String[] hobby = request.getParameterValues("hobby");
	for(String h : hobby){
		out.print(h + " ");
	}
%><br>

<hr>

이름2 : <%=mb.getName()%><br>
나이2 : <%=mb.getAge()%><br>
성별2 : <%=mb.getGender()%><br>
취미2 : 
<%
	for(String h : mb.getHobby()){
		out.print(h + " ");
	}
%><br>

<hr>

이름3 : <%=request.getAttribute("name")%><br>
나이3 : <%=request.getAttribute("age")%><br>
성별3 : <%=request.getAttribute("gender")%><br>
취미3 : 
<%
	String[] ho = (String[])request.getAttribute("hobby");
	for(String h : ho){
		out.print(h + " ");
}
%><br>

<hr>

이름4 : ${requestScope.name}<br>
나이4 : ${requestScope.age}<br>
성별4 : ${requestScope.gender}<br>
취미4 : 
<c:forEach var="hobby" items="${requestScope.hobby}" varStatus="status">
	${hobby}
	<c:if test="${!status.last}">
	,
	</c:if>
</c:forEach>
<br>

<hr>

<!-- toString 오버라이딩 안해서 mb는 주소가나온당 -->
이름5 : ${requestScope.mb.name}<br>
나이5 : ${requestScope.mb.age}<br>
성별5 : ${requestScope.mb.gender}<br>
취미5 : 
<c:forEach var="hobby" items="${requestScope.mb.hobby}" varStatus="status">
	${hobby}
	<c:if test="${!status.last}">,</c:if>
</c:forEach>
<br>

<hr>
<!-- toString 오버라이딩 해쥬기 -->
${requestScope.mb}<br>