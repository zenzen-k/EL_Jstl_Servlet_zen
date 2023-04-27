<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

Ex03_surveyList.jsp<br>

<table border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>소속회사</td>
		<td>이메일</td>
		<td>과정만족도</td>
		<td>관심분야</td>
		<td>정보발송방법</td>
		<td>정보발송동의</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	
	<c:forEach var="sur" items="${list}">
		<tr>
			<td>${sur.no}</td>
			<td>${sur.name}</td>
			<td>${sur.company}</td>
			<td>${sur.email}</td>
			<td>${sur.satisfaction}</td>
			<td>
				<c:forEach var="part" items="${sur.part}" varStatus="status">
					${part}
					<c:if test="${!status.last}">,</c:if>
				</c:forEach>
			</td>
			<td>${sur.howto}</td>
			<td>
				<c:if test="${sur.agree == 1}">동의함</c:if>
				<c:if test="${sur.agree == 0}">동의안함</c:if>
			</td>
			<td><a href="delete.sv?no=${sur.no}">삭제</a></td>
			<td><a href="updateForm.sv?no=${sur.no}">수정</a></td>
		</tr>
	</c:forEach>
	
</table>

<a href="Ex03_surveyInsertForm.jsp">삽입</a>