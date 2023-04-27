<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>
<h4>- JSP -</h4> 
아이디 : <%=request.getParameter("id")%><br>
이름 : <%=request.getParameter("name")%><br>
비번 : <%=request.getParameter("password")%><br>
나이 : <%=request.getParameter("age")%><br>

<h4>- EL -</h4> 
아이디2 : ${param.id}<br> <!-- 여기서 id는 앞에 form 안의 name을 작성한 것 -->
이름2 : ${param["name"]}<br>
비번2 : ${param['password']}<br>
나이2 : ${param.age}<br>


<!-- 만약 "" 나 '' 를 작성하지 않고 param[age] 를 작성한다면 에러는 뜨지 않지만 공백으로 나온다 -->

<!-- 
el 의 param 과 jsp의 reqeust 와 같음.

JSP 내장객체
session
config
response
reqeust
out
application
 -->
 
 
 
<!-- JSP -->
<jsp:useBean id="pb" class="myPkg.PersonBean"/>
<jsp:setProperty property="*" name="pb"/>

<h4>- JAVA Bean -</h4>
아이디3 : <%=pb.getId()%><br>
이름3 : <%=pb.getName()%><br>
비번3 : <%=pb.getPassword()%><br>
나이3 : <%=pb.getAge()%><br>

<h4>- JSP Bean -</h4>
아이디4 : <jsp:getProperty name="pb" property="id"/><br>
이름4 : <jsp:getProperty name="pb" property="name"/><br>
비번4 : <jsp:getProperty name="pb" property="password"/><br>
나이4 : <jsp:getProperty name="pb" property="age"/><br>

<h4>- EL Bean -</h4>
아이디5 : ${pb.id}<br> <!-- pb.getId() 즉 getter 메서드 호출하는것임! -->
이름5 : ${pb['name']}<br>
비번5 : ${pb["password"]}<br>
나이5 : ${pb.age}<br>


<hr>


id비교1 : <%= request.getParameter("id") == "hong" %><br> <!-- false -->
id비교2 : <%= request.getParameter("id").equals("hong") %><br> <!-- true -->
id비교3 : ${param.id == "hong"}<br><!-- true -->
id비교4 : ${param.id eq "hong"}<br><!-- true -->
id비교5 : ${param.id.equals("hong")}<br><!-- true -->











 