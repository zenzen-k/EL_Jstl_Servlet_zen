<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
resultsum<br>

${param.su1} + ${param.su2} = ${param.su1 + param.su2}<br>
<%=request.getParameter("su1")%> + <%=request.getParameter("su2")%> = <%=Integer.parseInt(request.getParameter("su1"))+Integer.parseInt(request.getParameter("su2"))%><br>
${param.su1} + ${param.su2} = ${requestScope.hap}<br>
${param.su1} + ${param.su2} = ${hap}<br>
