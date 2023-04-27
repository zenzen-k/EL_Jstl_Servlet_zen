<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

memberForm.jsp(입력, 회원가입) -> servlet(다오입력하고 memberTo.jsp) -> 
memberTo.jsp(버튼클릭) -> Ex01_memberList.jsp (servlet에서 ArrayList request 속성으로 가져옴)<br>

<!-- <h3>회원 목록보기(${fn:length(requestScope.lists)}개)</h3> -->
<h3>회원 목록보기(${fn:length(lists)}개)</h3>
<!-- 안써도 ㄱㅊ page부터 찾고 없으면 request로 옴! -->

<!-- 원래는 멤버객체만들어서 반복출력했었음. -->
<!-- 이제는 다른 방밥!@@##! 모든 DB 호출은 서블릿에서!! -->


<!-- 확장 for문 -->
<table border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>비번</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	
	<c:if test="${fn:length(lists)<0}">
		조회할 목록이 없습니다.
	</c:if>
	<c:if test="${fn:length(lists)>0}">
		<c:forEach var="l" items="${requestScope.lists}">
			<tr>
				<td>${l.no}</td>
				<td>${l.name}</td>
				<td>${l.password}</td>
				<td><a href="delete.mb?no=${l.no}">삭제</a></td>
				<td><a href="updateForm.mb?no=${l.no}">수정</a></td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<!-- 일반 for문 -->
<table border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>비번</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>
	
	<c:if test="${fn:length(lists)<0}">
		조회할 목록이 없습니다.
	</c:if>
	<c:if test="${fn:length(lists)>0}">
		<c:forEach var="i" begin="0" end="${fn:length(lists)-1}">
			<tr>
				<td>${requestScope.lists[i].no}</td>
				<td>${lists[i].getName()}</td>
				<td>${lists[i].password}</td>
				<!-- <td>${lists[i]['password']}</td> -->
				<td><a href="delete.mb?no=${lists[i].no}">삭제</a></td>
				<td><a href="updateForm.mb?no=${lists[i].no}">수정</a></td>
			</tr>
		</c:forEach>
	</c:if>
</table>


<hr>

<a href="Ex01_memberForm.jsp">삽입</a>