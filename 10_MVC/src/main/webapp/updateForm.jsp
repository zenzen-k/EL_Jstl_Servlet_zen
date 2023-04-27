<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<Br>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String[] time = {"08~10", "10~12", "12~14", "14~16", "16~18", "18~20"};
	String[] genre = {"공포", "다큐", "액션", "애니메이션"};
%>

<h3>영화 선호도 조사</h3>
<form name="myform" action="update.mv">
<input type="hidden" name="num" value="${mb.num}">
<table border="1">
	<tr>
		<td>아이디 : </td>
		<td>
			<input type="text" name="id" value="${mb.id}">
		</td>
	</tr>
	
	<tr>
		<td>이름 </td>
		<td><input type="text" name="name" value="${mb.name}"></td>
	</tr>
	
	<tr>
		<td>나이 </td>
		<td><input type="text" name="age" value="${mb.age}"></td>
	</tr>
	
	<tr>
		<td>좋아하는 장르 </td>
		<td>
			<c:forEach var="genre" items="<%=genre%>">
				<input type="checkbox" name="genre" value="${genre}" <c:if test="${fn:contains(mb.genre,genre)}">checked</c:if>> ${genre} 
			</c:forEach>
		</td>
	</tr>
	
	<tr>
		<td>즐겨보는 시간대 </td>
		<td>
		<select name="time">
			<c:forEach var="time" items="<%=time%>">
				<option value="${time}" <c:if test="${fn:contains(mb.time,time)}">selected</c:if>>${time}</option>
			</c:forEach>
		</select>
		</td>
	</tr>
	
	<tr>
		<td>동반 관객수 </td>
		<td>
			<c:forEach var="i" begin="1" end="5">
				<input type="radio" name="partner" value="${i}" <c:if test="${i==mb.partner}">checked</c:if>> ${i} 
			</c:forEach>
		</td>
	</tr>
	
	<tr>
		<td>영화관 개선사항</td>
		<td><textarea rows="4" cols="40" name="memo">${mb.memo}</textarea></td>
	</tr>
	 
	<tr>
		<td colspan="2" style="text-align: center">
			<input type="submit" value="수정하기" id="sub">
		</td>
	</tr>
</table>
</form>