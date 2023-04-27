<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
Ex_result_내이름.jsp
<br>
<% request.setCharacterEncoding("utf-8"); %>

<h4>param</h4>

<table border="1">
	<caption>param 사용</caption>
	<tr>
		<th>제목</th>
		<td><c:if test="${param.title == ''}">
	    	제목 누락
	    </c:if> <c:if test="${! (param.title == '') }">
	    	${param.title }
	    </c:if></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><c:if test="${param.author == ''}">
	    	저자 누락
	    </c:if> <c:if test="${! (param.author == '') }">
	    	${param.author }
	    </c:if></td>
	</tr>
	<tr>
		<th>출판사</th>
		<td><c:choose>
				<c:when test="${param['publisher'] eq ''}">
    			출판사 누락
    		</c:when>
				<c:when test="${ not( param['publisher'] eq '')}">
    			${param['publisher'] }
    		</c:when>
			</c:choose></td>
	</tr>
	<tr>
		<th>가격</th>
		<td><c:choose>
				<c:when test="${param.price == ''}">
    			가격 누락
    		</c:when>
				<c:when test="${ not( param.price == '')}">
					<fmt:formatNumber value="${param.price }" pattern="###,###,###" />원<br>
				</c:when>
			</c:choose></td>
	</tr>
	<tr>
		<th>입고일</th>
		<td><c:choose>
				<c:when test="${param.buy == ''}">
    			입고일 누락
    		</c:when>
				<c:when test="${ not( param.buy == '')}">
				${param.buy }
    		</c:when>
			</c:choose></td>
	</tr>
	<tr>
		<th>배송비</th>
		<td><c:if test="${param.kind == null}">
	    	배송비 체크 누락
	    </c:if> <c:if test="${! (param.kind == null) }">
	    	${param.kind }
	    </c:if></td>
	</tr>
	<tr>
		<th>구입가능서점</th>
		<td><c:if test="${ paramValues.bookstore == null}">
	    	구입가능서점 체크 누락
	    </c:if> <%--
	   ${fn:length(paramValues.bookstore) -1}
	    --%> <c:if test="${!( paramValues.bookstore == null ) }">
				<c:forEach var="i" begin="0"
					end="${fn:length(paramValues.bookstore) -1}" varStatus="status">
	    	   ${ paramValues.bookstore[i]}
	    	   <c:if test="${not status.last }">
	    	   /
	    	   </c:if>
				</c:forEach>
			</c:if></td>
	</tr>
	<tr>
		<th>보유수량</th>
		<td><c:if test="${param.count == '선택'}">
	    	보유수량 체크 누락
	    </c:if> <c:if test="${not (param.count == '선택') }">
	    	   ${ param.count }권
	    </c:if></td>
	</tr>
</table>
<br>


<jsp:useBean id="pb" class="myPkg.BookBean" />
<jsp:setProperty property="*" name="pb" />
<table border="1">
	<caption>JSP객체 사용</caption>
	<tr>
		<td>제목</td>
		<td><%=pb.getTitle() %></td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${pb.author}</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><%=pb.getPublisher()%></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><%=pb.getPrice() %></td>
	</tr>
	<tr>
		<td>입고일</td>
		<td><%=pb.getBuy() %></td>
	</tr>
	<tr>
		<td>배송비</td>
		<td><c:if test="${pb.kind == null}">
				배송 방식을 선택하지 않았습니다.
			</c:if> <c:if test="${pb.kind != null}">
				${pb.kind}  
			</c:if></td>
	</tr>
	<tr>
		<td>구입가능서점</td>
		<td><c:if test="${empty pb.bookstore}">
				구입가능 서점 체크 누락
			</c:if> <c:if test="${not empty pb.bookstore}">
				<c:forEach var="k" items="${pb.bookstore}">
					${k}
				</c:forEach>
			</c:if></td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td><c:if test="${pb.count eq '선택'}">
	    	보유수량 체크 누락
	    </c:if> <c:if test="${pb.count ne '선택' }">
	    	   ${ pb.count }권
	    </c:if></td>
	</tr>
</table>
<br>

jstl객체  
<!-- myPkg.PersonBean3 bb = new myPkg.PersonBean3(); 
bb.setTitle()-->

<c:set var="bb" value="<%=new myPkg.BookBean() %>"/>
<c:set target="${bb}" property="title" value="${param.title}"/>
<c:set target="${bb}" property="author" value="${param.author}"/>
<c:set target="${bb}" property="publisher" value="${param.publisher}"/>
<c:set target="${bb}" property="price" value="${param.price}"/>
<c:set target="${bb}" property="buy" value="${param.buy}"/>
<c:set target="${bb}" property="kind" value="${param.kind}"/>
<c:set target="${bb}" property="bookstore" value="${paramValues.bookstore}"/>
<c:set target="${bb}" property="count" value="${param.count}"/>

<table border="1">
	<tr>
		<td>제목</td>
		<td>${bb.title}</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${bb.author}</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td>${bb.publisher}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${bb.price}</td>
	</tr>
	<tr>
		<td>입고일</td>
		<td>${bb.buy}</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td><c:if test="${bb.kind==null}">
        배송비 체크누락
       </c:if> <c:if test="${bb.kind!=null}">
        ${bb.kind}
       </c:if></td>
	</tr>
	<tr>
		<td>구입가능 서점</td>
		<td><c:if test="${fn:length(bb.bookstore)==0}">
        구입가능 서점 체크누락
       </c:if> <c:if test="${fn:length(bb.bookstore)!=0}">
				<c:forEach var="bookstore" items="${bb.bookstore}"
					varStatus="status">
					<c:if test="${not status.last}">
          ${bookstore} , 
         </c:if>
					<c:if test="${status.last}">
          ${bookstore}
         </c:if>
				</c:forEach>
			</c:if></td>
	</tr>
	<tr>
		<td>보유수량</td>
		<td><c:if test="${bb.count eq '선택'}">
        보유수량 체크누락
       </c:if> <c:if test="${bb.count !='선택'}">
        ${bb.count}
       </c:if></td>
	</tr>
</table>

