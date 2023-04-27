<%@page import="myPkg.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

Ex11_property.jsp<br>

<%
	Book bk1 = new Book("EL","웬디",2000);
	out.print("bk1.getTitle() : " + bk1.getTitle() + "<br>");
	out.print("bk1 : " + bk1 + "<br>"); 
	// .toString 이 자동으로 붙으니까 참조변수만 적어도 값이 출력된다.
	
	pageContext.setAttribute("bk11", bk1);
%>
<c:set var="bk1" value="<%=bk1%>"/>
<!-- \ 역슬래시는 다음 EL코드나오기전까지 그대로 ㅜㄹ력함 -->
\${bk1.title} : ${bk1.title} <br> <!-- bk1.getTitle() -->
\${bk1} : ${bk1} <br> <!-- bk1.toString() -->

\${bk11.title} : ${bk11.title} <br> 
\${bk11["author"]} : ${bk11["author"]} <br> 
\${bk11} : ${bk11} <br> 


<hr>


JSP객체<br>

<!-- Book bk1 = new Book("EL", "웬디", 2000); -->

<!-- Book bk1 = new Book(); 라서 기본 생성자를 반드시 작성해주어야 한다. -->
<jsp:useBean id="bk2" class="myPkg.Book" />
<!-- 
	bk2.setTitle("EL");
	bk2.setAuthor("웬디");
	bk2.setPrice(2000);
 -->
<jsp:setProperty property="title" name="bk2" value="EL"/>
<jsp:setProperty property="author" name="bk2" value="웬디"/>
<jsp:setProperty property="price" name="bk2" value="2000"/>

\${bk2.title} : ${bk2.title} <br> 
\${bk2["author"]} : ${bk2["author"]} <br> 
\${bk2} : ${bk2} <br>

-> 자바코드와는 다르게 JSP 코드로 설정한건 EL 코드로 바로 사용이 가능하다.(추가적인 c:set을 사용안해도 됨)

<hr>

JSTL 객체 <br>
<c:set var="bk3" value="<%=new myPkg.Book()%>"/>
<c:set target="${bk3}" property="title" value="EL"/>
<c:set target="${bk3}" property="author" value="웬디"/>
<c:set target="${bk3}" property="price" value="2000"/>
\${bk3.title} : ${bk3.title}<br>
\${bk3} : ${bk3}<br>


<c:set var="bk4" value='<%=new myPkg.Book("EL","웬디",2000)%>'/>
\${bk4.title} : ${bk4.title}<br>
\${bk4} : ${bk4}<br>

<c:out value="${bk4.title}"/>


