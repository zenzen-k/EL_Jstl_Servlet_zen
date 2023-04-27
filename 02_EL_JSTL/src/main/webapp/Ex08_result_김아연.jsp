<%@ page import="myPkg.Person2Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="pb2" class="myPkg.Person2Bean"/>
<jsp:setProperty property="*" name="pb2"/>

<c:if test="${param.name==''}">
	입력한 이름이 없습니다1.
</c:if>
<br>
<c:if test="${param.name==null}">
	입력한 이름이 없습니다2.
</c:if>
<br>
<c:if test="${pb2.name==''}">
	입력한 이름이 없습니다3.
</c:if>
<br>
<c:if test="${pb2.name==null}">
	입력한 이름이 없습니다4.
</c:if>
<br>
<c:if test="${fn:length(pb2.name)==0}">
	입력한 이름이 없습니다5.
</c:if>

<hr>

<c:if test="${param.gender==null}">
	선택한 성별이 없습니다.1
</c:if>
<br>
<c:if test="${param.gender==''}">
	선택한 성별이 없습니다.2
</c:if>
<br>
<c:if test="${pb2.gender==null}">
	선택한 성별이 없습니다.3
</c:if>
<br>
<c:if test="${pb2.gender==''}">
	선택한 성별이 없습니다.4
</c:if>
<br>

<c:choose>
	<c:when test="${empty param.gender}">
		선택한 성별이없습니다.5
	</c:when>
	<c:otherwise>
		${param.gender}
	</c:otherwise>
</c:choose>
<br>
<c:choose>
	<c:when test="${empty pb2.gender}">
		선택한 성별이없습니다.6
	</c:when>
	<c:otherwise>
		${param.gender}
	</c:otherwise>
</c:choose>
<br>

<!-- jsp -->
<h4>- jsp -</h4>
이름 : <%=request.getParameter("name")%><br>
나이 : <%=request.getParameter("age")%><br>
몸무게 : <%=request.getParameter("weight")%><br>
키 : <%=request.getParameter("height")%><br>
성별 : <%=request.getParameter("gender")%><br>

<!-- EL1 -->
<h4>- EL1 -</h4>
이름 : ${param.name}<br>
나이 : ${param["age"]}<br>
몸무게 : ${param['weight']}<br>
키 : ${param.height}<br>
성별 : ${param.gender}<br>

<!-- EL2 -->
<h4>- EL2 -</h4>
<c:set var="name" value="${param.name}"/>
<c:set var="age" value="${param['age']}"/>
<c:set var="weight" value="${param.weight}"/>
<c:set var="height" value="${param.height}"/>
<c:set var="gender" value="${param.gender}"/>
이름 : ${name}<br>
나이 : ${age}<br>
몸무게 : ${weight}<br>
키 : ${height}<br>
성별 : ${gender}<br>

<!-- java Bean -->
<h4>- java Bean -</h4>
<%
	Person2Bean pb = new Person2Bean();
	pb.setName(request.getParameter("name"));
	pb.setAge(Integer.parseInt(request.getParameter("age")));
	pb.setWeight(Integer.parseInt(request.getParameter("weight")));
	pb.setHeight(Integer.parseInt(request.getParameter("height")));
	pb.setGender(request.getParameter("gender"));
%>
이름 : <%=pb.getName()%><br>
나이 : <%=pb.getAge()%><br>
몸무게 : <%=pb.getWeight()%><br>
키 : <%=pb.getHeight()%><br>
성별 : <%=pb.getGender()%><br>


<!-- jsp Bean -->
<h4>- jsp Bean -</h4>

이름 : <jsp:getProperty property="name" name="pb2"/><br>
나이 : <jsp:getProperty property="age" name="pb2"/><br>
몸무게 : <jsp:getProperty property="weight" name="pb2"/><br>
키 : <jsp:getProperty property="height" name="pb2"/><br>
성별 : <jsp:getProperty property="gender" name="pb2"/><br>

<!-- EL Bean -->
<h4>- EL Bean -</h4>
이름 : ${pb2.name}<br>
나이 : ${pb2["age"]}<br>
몸무게 : ${pb2['weight']}<br>
키 : ${pb2.height}<br>
성별 : ${pb2.gender}<br>

<hr>
<!-- java -->
<h4>- java -</h4>
<%
	if(pb.getWeight()>= 50 && pb.getHeight()>=160){
		out.print("놀이기구 탑승 가능합니다.");
	}else{
		out.print("놀이기구 탑승 불가능합니다.");
	}
%>

<!-- EL1 -->
<h4>- EL1 -</h4>
<c:if test="${param.weight >= 50 and param.height >=160}">
	놀이기구 탑승 가능합니다.
</c:if>
<!-- or 또는 || 로 해쥬기! -->
<c:if test="${param.weight < 50 || param.height < 160}">
	놀이기구 탑승 불가능합니다.
</c:if>

<!-- EL2 -->
<h4>- EL2 -</h4>
<c:if test="${pb2.height >= 160 && pb2.weight >= 50}">
	놀이기구 탑승 가능합니다.
</c:if>
<c:if test="${pb2.height < 160 || pb2.weight < 50}">
	놀이기구 탑승 불가능합니다.
</c:if>

<!-- EL3 -->
<h4>- EL3 -</h4>
<c:if test="${weight >= 50 and height >=160}">
	놀이기구 탑승 가능합니다.
</c:if>
<c:if test="${weight < 50 or height < 160}">
	놀이기구 탑승 불가능합니다.
</c:if>

<!-- EL4 -->
<h4>- EL4 -</h4>
<c:choose>
	<c:when test="${(height >= 160) && (weight >= 50)}">놀이기구 탑승 가능합니다</c:when>
	<c:otherwise>놀이기구 탑승 불가능합니다.</c:otherwise>
</c:choose>



<hr>
취미 : <br>
<c:if test="${fn:length(paramValues.hobby)==0}">
	선택한 취미가 없습니다.1
</c:if>
<br>
<c:if test="${param.hobby==null}">
	선택한 취미가 없습니다.2
</c:if>
<br>
<c:if test="${param.hobby==''}">
	선택한 취미가 없습니다.3
</c:if>
<br>
<c:if test="${pb2.hobby==null}">
	선택한 취미가 없습니다.4
</c:if>
<br>
<c:if test="${pb2.hobby==''}">
	선택한 취미가 없습니다.5
</c:if>
<br>
<c:choose>
	<c:when test="${empty pb2.hobby}">
		선택한 취미가 없습니다.6
	</c:when>
	<c:otherwise>
		취미 O
	</c:otherwise>
</c:choose>
<br>
<c:choose>
	<c:when test="${empty paramValues.hobby}">
		선택한 취미가 없습니다.7
	</c:when>
	<c:otherwise>
		취미 O
	</c:otherwise>
</c:choose>
<br>



<c:set var="hobby" value="${paramValues.hobby}"/>
<c:set var="hlen" value="${fn:length(hobby)}"/>
<c:if test="${hlen != 0}">
	<c:forEach var="i" begin="0" end="${hlen-1}" varStatus="status">
		${hobby[i]} 
		<c:if test="${not status.last}"> , </c:if>
	</c:forEach>
	
	<br>
	<c:forEach var="i" items="${paramValues.hobby}" varStatus="status">
		${i}
		<c:if test="${!status.last}"> , </c:if>
	</c:forEach>
	<br>
	<c:forEach var="i" items="${hobby}" varStatus="status">
		${i}
		<c:if test="${status.last != true}"> , </c:if>
	</c:forEach>
	<br>
	
	<!-- Bean String[] 출력 -->
	Bean<br>
	<c:forEach var="h" items="${pb2.hobby}" varStatus="status">
		${h}
		<c:if test="${!status.last}"> , </c:if>
	</c:forEach>
	<br>
	
	<c:forEach var="i" begin="0" end="${fn:length(pb2.hobby)-1}" varStatus="status">
		${pb2.hobby[i]}
		<c:if test="${not status.last}"> , </c:if>
	</c:forEach>
	<br>
</c:if>



주소 : 
<br>

<c:if test="${param.addr == ''}">
	선택한 항목이 없습니다.
</c:if>
<br>
<c:if test="${param.addr eq ''}">
	선택한 항목이 없습니다.
</c:if>

<br>
<c:if test="${param.addr==null}">
	선택한 주소가 없습니다.1
</c:if>
<br>
<c:if test="${param.addr==''}">
	선택한 주소가 없습니다.2
</c:if>
<br>
<c:if test="${pb2.addr==null}">
	선택한 주소가 없습니다.3
</c:if>
<br>
<c:if test="${pb2.addr==''}">
	선택한 주소가 없습니다.4
</c:if>
<br>


<c:if test="${param.addr != ''}">
	${param.addr}<br>
	${param['addr']}<br>
	${param["addr"]}<br>
</c:if>
