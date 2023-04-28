<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style>
	body{
		text-align: center;
	}
	table{
		margin: auto;
		width: 700px;
	}
</style>


<b>글목록(전체 글:${count})</b>
<table>
	<tr>
		<td align="right" bgcolor="#b0e0e6">
			<a href="insertForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<c:if test="${count==0}">
	<table>
		<tr>
			<td align="center" bgcolor="#b0e0e6">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>
</c:if>
<c:if test="${count!=0}">
	<table>
		<tr height="30" bgcolor="#5f9ea0">
			<th>번 호</th>
			<th>제 목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조 회</th>
			<th>IP</th>
		</tr>
		
		<c:forEach var="bb" items="${lists}">
			<tr height="30" align="center" bgcolor="#b0e0e6">
			<td>	
				<c:set var="number" value="${number-1}"/>
				<c:out value="${number}"/>
			</td>
			<td align="left">
				<c:set var="wid" value="20"/>
				<c:if test="${bb.re_level > 0}">
					<c:set var="wid" value="${20 * bb.re_level}"/>
					<img src="images/level.gif" width="${wid}" height="10">
					<img src="images/re.gif">
				</c:if>
				<a href="content.bd?num=${bb.num}&pageNum=${pageNum}">${bb.subject}</a>
				<c:if test="${bb.readcount>=10}">
					<img src="images/hot.gif" width="15">
				</c:if>
			</td>
			<td>${bb.writer}</td>
			<td>${bb.reg_date}</td>
			<td>${bb.readcount}</td>
			<td>${bb.ip}</td>
		</tr>
		</c:forEach>
		
	</table>
</c:if>


<c:if test="${count>0}">
	<%-- <fmt:parseNumber var="x" value="${count/pageSize}" integerOnly="true"/>
	<c:set var="pageCount" value="${x + (count%pageSize==0? 0 : 1)}"/>
	<c:set var="pageBlock" value="3"/>
	
	<fmt:parseNumber var="x" value="${(currentPage-1) / pageBlock}" integerOnly="true"/>
	<c:set var="startPage" value="${(x * pageBlock ) +1}"/>
	<c:set var="endPage" value="${startPage + pageBlock - 1}"/> --%>
	
	<c:if test="${pageCount < endPage}">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if>
	
	<c:if test="${startPage > 3}">
		<a href="list.bd?pageNum=${startPage-3}%>">[이전]</a>	
	</c:if>
		
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="list.bd?pageNum=${i}">[${i}]</a>	
	</c:forEach>
	
	<c:if test="${endPage < pageCount}">
		<a href="list.bd?pageNum=${endPage+1}">[다음]</a>
	</c:if>
</c:if>

