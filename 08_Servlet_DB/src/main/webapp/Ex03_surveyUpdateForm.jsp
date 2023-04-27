<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

Ex03_surveyUpdateForm.jsp<br>
<% 
	String[] satis = {"매우만족","만족","보통","불만족","매우불만족"};
	String[] part = {"JAVA","Spring","UML","JDBC","서블릿","JSP"};
	String[] howto = {"email", "우편"};
%>
	
<form action="update.sv" method="post"> 
	<input type="hidden" name="no" value="${sb.no}">
	 과정 만족도 설문<br>
	 아래 항목을 입력해 주세요.<P>
	
	 <b>개인 정보 :</b><br>
	이름 　　　　<input type="text" name="name" value="${sb.name}"><br>
	소속 회사　　<input type="text" name="company" value="${sb.company}"><br>
	이메일 주소　<input type="text" name="email" value="${sb.email}"><br>
	<p>
	<b>본 교육 과정을 수강하고 과정에 만족도를 선택해 주세요.</b><br>
	<c:set var="s" value="<%=satis%>"/>
	<c:forEach var="s" items="${s}">
		<% 
			// jstl 쓰니까 주석 자꾸 안먹어서 jsp로 바꿔서 주석 함
			// ${s==sb.satisfaction ? "checked" : ""}  %> 
		<input type="radio" name="satisfaction" value="${s}" <c:if test="${s==sb.satisfaction}">checked</c:if>>${s}
	</c:forEach>
	<p>
	<b>관심있는 분야는 무엇입니까?</b><br>
	<% //자바에서 사용한 변수를 사용하기 위해 jstl로 설정해주는 작업 %> 
	<c:set var="p" value="<%=part%>"/>
	<% // <c:forEach var="p" items="JAVA,Spring,UML,JDBC,서블릿,JSP"> 이렇게 직접 넣을수도 있다.%> 
	<% 
		//배열에서 직접 써도 된다.
		//<c:forEach var="p" items="< %=part% >" varStatus="status">
	%> 
	<% // 혹시 안될까봐 이름 다 다르게 했는데 다 part로 써도 문제가 없다. %>
	<c:forEach var="p" items="${p}" varStatus="status">
		<input type="checkbox" name="part" value="${p}" <c:forEach var="selectP" items="${sb.part}">${p==selectP ? "checked" : ""}</c:forEach>>${p}
		<c:if test="${status.index==2}"><br></c:if> <!-- 한줄에 3개씩 보이도록 -->
	</c:forEach>
	<% /*
		<c:if test="${fn:contains(sb.part, p)} }"> 
		나는 Bean에서 String[]으로 받았기 때문에 for문을 한번 더 썼지만, 
		만약 Bean에서 배열이 아닌 그냥 String으로 담으면 포함하고 있는지 여부를 묻고 checked를 작성한다.*/
	%>
	<p>
	정보 발송 방법 
	<%// 두개밖에 없어서 각각해도 ㄱㅊ  %> 
	<select name="howto">
		<c:set var="howto" value="<%=howto%>"/>
		<c:forEach var="h" items="${howto}">
			<option value="${h}" <c:if test="${sb.howto == h}">selected</c:if>>${h}</option>
		</c:forEach>
	</select>
	
	<p>
	<input type="checkbox" name="agree" <c:if test="${sb.agree==1}">checked</c:if> value="1"> 정보 발송에 동의합니다.<br>
	<input type="submit" value="전송">
</form>