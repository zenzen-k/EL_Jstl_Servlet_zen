<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

insertForm.jsp => result_내이름.jsp<br>
<!-- 서블릿으로 이동 -> result_김아연.jsp 로 이동
parameter, 속성, Bean 등 다양한 방식으로 출력 ㄱ ㄱ  
url 맵핑 설정도 다양하게 ㄱ ㄱ -->


<%
	String[] hobby = {"달리기","수영","등산","영화"};
%>
 
<h2>회원가입</h2>
<form name="myform" action="person2" method="post">
	<span>아이디:</span> 
	<input type="text" name="id">&nbsp;
	<p>
	
	<span>비밀번호:</span> 
	<input type="password" name="passwd"><p>
	
	<span>이름:</span> 
	<input type="text" name="name"><p>
	<span>생년월일:</span>
		<select name="year">
			<c:set var="year" value="2023"/>
			<c:forEach var="i" begin="0" end="93" step="1">
				<option value="${year-i}">${year-i}</option>
			</c:forEach>
		</select>년&nbsp;
		<select name="month" id="month">
			<c:forEach var="i" begin="1" end="12">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>월&nbsp;
		<select name="day" id="day">
			<c:forEach var="i" begin="1" end="31">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>일
		<p>
	<span>취미: </span> 
		<c:set var="hobby" value="<%=hobby%>"/>
		<c:set var="hobby" value="<%=hobby%>"/>
		<c:forEach var="h" items="${hobby}">
			<input type="checkbox" name="hobby" value="${h}">${h}
		</c:forEach>
	<br><br>
	[성적 입력]<br>
	<span>C언어: </span><input type="text" name="c" style="width: 70px">&nbsp;
	<span>JAVA: </span><input type="text" name="java" style="width: 70px">&nbsp;
	<span>JSP: </span><input type="text" name="jsp" style="width: 70px"> 
	<p>
	<input type="submit" value="가입하기" id="sub" onClick=""> 
</form>
