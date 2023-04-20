<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

Ex15_fmt.jsp<br>

<c:set var="now" value="<%=new Date()%>"/>
now1 : ${now} <br>

both : 날짜, 시간 모두 형식지정<br>
now2 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>
now3 : <fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="medium"/><br>
<!-- date ㄸ는 time 을 써서 하나만 설정도 가능함 -->
now4 : <fmt:formatDate value="${now}" type="date" dateStyle="medium" timeStyle="medium"/><br>
now4 : <fmt:formatDate value="${now}" type="time" dateStyle="short" timeStyle="short"/><br>
now5 : <fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd hh:mm"/><br>