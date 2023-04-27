<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

Ex09_forEach.jsp<br>

1~10 출력하기<br>
<c:forEach var="i" begin="1" end="10">
	${i}
</c:forEach>
<br>

<%
	String[] movieList = {"슬램덩크", "스즈메", "아바타", "신세계"};
	for(int i=0; i<movieList.length; i++){
		out.print(movieList[i] + " ");
	}
	out.print("<br>");
	for(String movie : movieList){
		out.print(movie + " ");
	}
%>
<hr>

<c:set var="mlist" value="<%=movieList%>"/>
방의 개수를 구하는 함수가 있다.<br>
배열의 길이 : ${fn:length(mlist)} <br>
<c:forEach var="i" begin="0" end="${fn:length(mlist)-1}" step="1">
	<%-- ${movieList[i]} EL코드에는 자바 변수 사용불가 --%>
	${mlist[i]}
</c:forEach>

<%
	//PageContext pageContext = new PageContext();
	pageContext.setAttribute("mlist2", movieList);
	//request.setAttribute(arg0, arg1);
%>
<br>
<c:forEach var="i" begin="0" end="${fn:length(mlist)-1}" step="1">
	<%-- ${movieList[i]} EL코드에는 자바 변수 사용불가 --%>
	${mlist2[i]}
</c:forEach>
<br>

<!-- 반복대상은 items 를 사용하며 아까와 마찬가지로 c:set으로 설정한 뒤 작성한다. -->
<c:forEach var="movie" items="${mlist}">
	${movie}
</c:forEach>



















