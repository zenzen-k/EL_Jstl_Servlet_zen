<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
Ex06_result_choose_when.jsp<br>

<% request.setCharacterEncoding("utf-8"); %>
선택한 음식 : ${param.food} <br>

<c:set var="food" value="${param.food}"/>

<c:if test="${param.food == '피자'}">
피자
</c:if>
<c:if test="${param.food eq '붕어빵'}">
붕어빵
</c:if>
<c:if test="${(param.food) == '호떡'}">
호떡
</c:if>
<c:if test="${(param.food) == '치킨'}">
치킨
</c:if>

<hr>

<!-- switch~case 와 비슷한 형태로 choose when 이 있다. -->

<c:choose>
	<c:when test="${param.food == '피자'}">
		피자
	</c:when>
	<c:when test="${param.food == '붕어빵'}">
		붕어빵
	</c:when>
	<c:when test="${param.food == '호떡'}">
		호떡
	</c:when>
	<c:otherwise>
		그 밖의 음식(치킨)
	</c:otherwise>
</c:choose>