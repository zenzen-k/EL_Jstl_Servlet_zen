<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<table border=1>
	<caption>param 사용</caption>
	<tr>
		<td>제목</td>
		<td>${param.title}</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${param.author}</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td>${param.publisher}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${param.price}</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td>${param.buy}</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>
			<c:if test="${param.kind == null}">
				배송비 체크 누락
			</c:if>
			<c:if test="${param.kind != null}">
				${param.kind}
			</c:if>
		</td>
	</tr>
	<tr>
		<td>구입가능 서점</td>
		<td>
			<c:if test="${empty paramValues.bookstore}">
				구입가능 서점 체크 누락
			</c:if>
			<c:if test="${paramValues.kind != null}">
				<c:forEach var="i" begin="0" end="${fn:length(paramValues.bookstore)-1}">
					${paramValues.bookstore[i]}
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td>
			<c:if test="${param.count == '선택'}">
				보유수량 체크 누락
			</c:if>
			<c:if test="${param.count != '선택'}">
				${param.count}
			</c:if>
		</td>
	</tr>
</table>



<jsp:useBean id="bb" class="myPkg.BookBean"/>
<jsp:setProperty property="*" name="bb"/>
<table border=1>
	<caption>bean 사용 - jsp</caption>
	<tr>
		<td>제목</td>
		<td>
			<%
			if(bb.getTitle() != null){
			%>
			<jsp:getProperty name="bb" property="title"/>
			<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>
			<%
			if(bb.getAuthor() != null){
			%>
			<jsp:getProperty name="bb" property="author"/>
			<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td>
			<%
			if(bb.getPublisher() != null){
			%>
			<jsp:getProperty name="bb" property="publisher"/>
			<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>
			<%
			if(bb.getPrice() != 0){
			%>
			<jsp:getProperty name="bb" property="price"/>
			<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td>
			<%
			if(bb.getBuy() != null){
			%>
			<jsp:getProperty name="bb" property="buy"/>
			<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>
			<%
			if(bb.getKind() == null){
			%>
				배송비 체크 누락
			<%
			}else{
				%>
				<jsp:getProperty name="bb" property="kind"/>	
				<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td>구입가능 서점</td>
		<td>
			<%
			if(bb.getBookstore() == null){
			%>
				구입가능 서점 체크 누락
			<%
			}else{
				for(String sb : bb.getBookstore()){
					out.print(sb + " ");
				}
			}
			%>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td>
			<%
			if(bb.getCount() == null){
			%>
				보유수량 체크 누락
			<%
			}else{
				%>
				<jsp:getProperty name="bb" property="count"/>	
				<%
			}
			%>
		</td>
	</tr>
</table>



<c:set var="bb2" value="<%=new myPkg.BookBean() %>"/>
<c:set target="${bb2}" property="title" value="${param.title}"/>
<c:set target="${bb2}" property="author" value="${param.author}"/>
<c:set target="${bb2}" property="publisher" value="${param.publisher}"/>
<c:set target="${bb2}" property="price" value="${param.price}"/>
<c:set target="${bb2}" property="buy" value="${param.buy}"/>
<c:set target="${bb2}" property="kind" value="${param.kind}"/>
<c:set target="${bb2}" property="bookstore" value="${paramValues.bookstore}"/>
<c:set target="${bb2}" property="count" value="${param.count}"/>

<table border=1>
	<caption>bean 사용 - jstl</caption>
	<tr>
		<td>제목</td>
		<td><c:out value="${bb2.title}"/></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><c:out value="${bb2.author}"/></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><c:out value="${bb2.publisher}"/></td>
	</tr>
	<tr>
		<td>가격</td>
		<td>
			<c:if test="${bb2.price != 0}">
				<c:out value="${bb2.price}"/>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td><c:out value="${bb2.buy}"/></td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>
			<c:if test="${bb2.kind == null}">
				배송비 체크 누락
			</c:if>
			<c:if test="${bb2.kind != null}">
				<c:out value="${bb2.kind}"/>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>구입가능 서점</td>
		<td>
			<c:if test="${empty paramValues.bookstore}">
				구입가능 서점 체크 누락
			</c:if>
			<c:if test="${not empty paramValues.bookstore}">
				<c:forEach var="k" items="${bb2.bookstore}">
					${k}
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td>
			<c:if test="${param.count == '선택'}">
				보유수량 체크 누락
			</c:if>
			<c:if test="${param.count != '선택'}">
				${bb2.count}
			</c:if>
		</td>
	</tr>
</table>