<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

Ex12_forTokens.jsp<br>

<c:set var="str" value="가나/다라*마바/사/아"/>

Stringtokenizer : 자바에서 끊어내는 기능을 하는 클래스! split은 메서드임<br>

\${str } : ${str}<br>

forTokens : Stringtokenizer 처럼 반복해서 문자열을 끊어내는 역할을 함.<br>
one 변수에 해당 데이터들이 들어간다.<br>
<c:forTokens var="one" items="${str}" delims="/*" varStatus="status">
	${status.index} / ${status.count} / ${one }<br>
</c:forTokens>



















