<%@page import="java.util.Enumeration"%>
<%@page import="myPkg.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
form.jsp(이름입력함) -> FormServlet(form 요청처리를 위해 서블릿 갔다가 deispatcher에 의해) -> move.jsp<br>
<br>
<%
	request.setCharacterEncoding("UTF-8");
%>

name1 : <%=request.getParameter("name")%><br>
name2 : <%=request.getAttribute("name")%><br>
age1 : <%=request.getParameter("age")%><br>
age2 : <%=request.getAttribute("age")%><br>
<br><br>

<%
Person p = (Person)request.getAttribute("ps");
%>
이름:<%=p.getName()%><br>
나이:<%=p.getAge() %><br>
몸무게:<%=p.getWeight()%><br>



