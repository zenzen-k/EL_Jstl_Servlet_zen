<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
Ex07_forEach.jsp<br>

<!-- 반복문 태그! -->

<c:forEach var="cnt" begin="1" end="10" step="2" varStatus="status">
	${cnt} / ${status.first} / ${status.last} / ${status.begin} / ${status.end} / ${status.index} / ${status.count} <br>
	<c:set var="sum" value="${sum + cnt}"/>
</c:forEach>

합계 : <c:out value="${sum}"/><br>

또는<br>
<c:set var="sum2" value="0"/>
<c:forEach var="cnt2" begin="1" end="10" step="2" varStatus="status">
	<c:set var="sum2" value="${sum2 + cnt2}"/>
</c:forEach>
합계2 : ${sum2}<br>

<hr>
1~10 사이의 수 중 짝수의 합 구하기<br>

<c:forEach var="i" begin="1" end="10">
	<c:if test="1~10 사이의 수 중 짝수의 합 구하기<br>

<c:forEach var="i" begin="1" end="10">
	<c:if test="${(i % 2)==0}">
		<c:set var="sum3" value="${sum3 + i}"/>
	</c:if>
</c:forEach>

짝수의 합 : ${sum3} <br>">
		<c:set var="sum3" value="${sum3 + i}"/>
	</c:if>
</c:forEach>

짝수의 합 : ${sum3} <br>