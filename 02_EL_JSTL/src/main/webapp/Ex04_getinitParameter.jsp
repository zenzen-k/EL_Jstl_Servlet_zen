<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04.jsp<br>


<%
	int age = 20;
	out.println("age : " + age + "<br>");
	// age는 현재화일에서만 사용할 수 있고 다른 페이지에서 사용불가능함
	
	//다른곳에서도 사용하려면 application을 사용해야 한다.
	// ServletContext application = new ServletContext();
	// 해당 파일을 실행하면 a_age가 생성된당! 해당 프로젝트당 한개가 만들어짐~@~@
	application.setAttribute("a_age", age);
%>

myname : <%=application.getInitParameter("myname")%> <br>
mybirth : <%=application.getInitParameter("mybirth")%> <br>

<ul>
<%
	Enumeration<String> initEnum = application.getInitParameterNames(); // 여러개의 값이 들어있을 때 사용함
	while(initEnum.hasMoreElements()){ // 데이터가 있으면 true
		String pName = initEnum.nextElement();
	%>
		<li><%=pName%> : <%=application.getInitParameter(pName)%></li>
	<%
	}
%>
</ul>

<br><br>


저의 이름은 ${initParam.myname}이고
저의 생일은 ${initParam.mybirth}입니다.