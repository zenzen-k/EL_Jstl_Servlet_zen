<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 

지시어의 종류

- page 지시어
- include 지시어
- taglib 지시어

 -->

Ex05_result.jsp<br>

<!-- 
	만약 ${kor}으로 하면 빈칸나옴 오류는 아님ㄴ ㄴ
 -->
국어 : ${param.kor}<br>
영어 : ${param.eng}<br>
수학 : ${param['math']}<br>

<!-- var : 변수  -->
<!-- 즉 k = 10; 이런식으로. -->
<c:set var="k" value="${param.kor}"/>
<c:out value="k"/>
<c:out value="${k}"/>
<c:out value="${param.kor}"/><br>


<c:set var="kor" value="${param.kor}"/>
<c:set var="eng" value="${param.eng}"/>
<c:set var="math" value="${param.math}"/>


<c:set var="sum" value="${param.kor + param.eng + param['math']}"/>
<c:set var="sum1" value="${param.kor} + ${param.eng} + ${param['math']}"/>
<c:set var="sum2" value="${kor + eng + math}"/>
합계1 : ${sum} <br>
합계2 : <c:out value="${sum}"/><br>
합계3 : ${sum1} <br>
합계4 : ${sum2} <br>

<c:set var="avg1" value="${sum/3}"/>
<c:set var="avg2" value="${(kor + eng + math)/3}"/>
<c:set var="avg3" value="${(param.kor + param.eng + param.math)/3}"/>
평균1 : ${avg1}<br>
평균2 : ${avg2}<br>
평균3 : <c:out value="${avg3}"/><br>

<hr>
<br>
학점 구하기 <br>

<!-- if(avg>=90){

} else if(avg>=80){ // 80~89

} -->

<!-- test 에 조건이 들어간다. else문이 존재하지 않음. 다 작성해주ㅝ야함 -->
<c:if test="${avg1>=90}">
A학점 <!-- c:out을 써도됨 -->
</c:if>
<c:if test="${avg1>=80 and avg1<90}">
<!-- and, && 모두 가능하다 -->
B학점
</c:if>
<c:if test="${avg1>=70 && avg1<80}">
C학점
</c:if>
<c:if test="${avg1>=60 and avg1<70}">
D학점
</c:if>
<c:if test="${avg1<60}">
F학점
</c:if>

<hr>
<c:choose>
	<c:when test="${avg1>=90}">A학점</c:when>
	<c:when test="${avg1>=80}">B학점</c:when>
	<c:when test="${avg1>=70}">C학점</c:when>
	<c:when test="${avg1>=60}">D학점</c:when>
	<c:otherwise>F학점</c:otherwise>
</c:choose>
