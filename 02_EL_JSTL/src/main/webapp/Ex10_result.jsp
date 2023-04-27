<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

Ex10_result.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	String[] fruit = request.getParameterValues("fruit");
	
	if(fruit != null){
		for(String f : fruit){
			out.print(f + " ");
		}
		out.print("<br>");
		for(int i=0; i<fruit.length; i++){
			out.print(fruit[i] + " ");
		}
	}
%>
<br>

이름 : ${param.name} <br>
과일 : ${param.fruit} <br> <!-- 처음에 선택한 값 하나만 들어온다. -->

여러 값을 가져오는 것으로 paramValues 라는 것이 있음. 마치 request의 getParameterValues 와 같음<br>
paramValues.fruit 으로 한다면 마찬가지로 배열의 주소가 나온다. 따라서 반복문을 사용해야 함. <br>

선택한 과일 개수 : ${fn:length(paramValues.fruit)}<br><br>


<c:set var="flen" value="${fn:length(paramValues.fruit)}"/>


개수 0 인지 아닌지<br>
<c:if test="${flen==0}">
	선택한 과일 없음
</c:if>
<c:if test="${flen!=0}">
	<!-- 일반 for문 -->
	<c:forEach var="i" begin="0" end="${flen-1}">
		${paramValues.fruit[i]}
	</c:forEach>
</c:if>


<br>

<!-- 확장 for문 -->
<c:forEach var="f" items="${paramValues.fruit}" varStatus="status">
	${f} / ${status.first} / ${status.last} / ${status.count} <br>
</c:forEach>

<BR>또는<BR>
<c:set var="pfruit" value="${paramValues.fruit}"/>
<c:forEach var="f" items="${pfruit}" varStatus="status">
	${f}
	<c:if test="${!status.last}">
	,
	</c:if>
</c:forEach>
