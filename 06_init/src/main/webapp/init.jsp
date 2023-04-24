<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

company : <%=application.getInitParameter("company")%><br>
singer : <%=application.getInitParameter("singer")%><br>
<!-- ServletContext application = new ServletContext() -->
<!-- application은 ServletContext객체를 관리하는 참조변수다  -->

company : ${initParam.company}<br>
singer : ${initParam.singer}<br>


<%
	config.getInitParameter("abc");
%>