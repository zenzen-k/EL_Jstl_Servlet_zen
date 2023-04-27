<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>함수 사용</title>
</head>  
<body>
<c:set var="str1" value="      Functions <태그>를 사용합니다." />
<c:set var="str2" value="사용" /> 
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />

str1 = ${str1 }<br><br> 
tokens = ${tokens }<br><br>
length(str1) = ${fn:length(str1)} <br><br> <!-- 공백포함 -->
toUpperCase(str1) = "${fn:toUpperCase(str1)}" <br><br> <!-- 대문자변경 -->
toLowerCase(str1) = "${fn:toLowerCase(str1)}" <br><br> <!-- 소문자변경 -->
substring(str1, 7, 10) = "${fn:substring(str1, 7, 10)}" <br><br> <!-- 7번째부터 9번째까지 문자출력. 0부터 센다 -->
substringAfter(str1, str2) = "${fn:substringAfter(str1, str2)}" <br><br> <!-- str1에서 사용(str2)을 찾아서 그 뒤를 가져온다. --> 
substringBefore(str1, str2) = "${fn:substringBefore(str1, str2)}" <br><br> <!-- str1에서 사용을 찾아서 그앞에를 가져온다 -->
trim(str1) = "${fn:trim(str1)}" <br><br> <!-- 맨앞과 맨뒤의 공백을 지운다. -->
length(trim(str1)) = "${fn:length(fn:trim(str1))}" <br><br> <!-- 앞뒤의 공백 제거 후 문자의 개수를 구함 -->
<!-- 함수안에 함수를 쓸 수 있으며, 사용하기 위해서는 fn:안에 또 fn:을 작성한다/. -->

replace(str1, src, dest) = "${fn:replace(str1, " ", "-")}" <br><br> <!-- str1에서 공백을 - 으로 바꾼다. -->
indexOf(str1, str2) = "${fn:indexOf(str1, str2)}" <br><br>  <!-- str1에서 str2의 시작 인덱스 번호를 나타낸다. 없으면 -1을 출력한다. -->
startsWith(str1, str2) = "${fn:startsWith(str1, 'Fun')}" <br><br> <!-- str1에서 공백을 포함하여 Fun으로 시작하는지를 묻는다. 맞으면 true -->
endsWith(str1, str2) = "${fn:endsWith(str1, "합니다.")}" <br><br> <!-- str1에서 마지막이 합니다로 끝나는지 묻는다. 맞으면 true -->
contains(str1, str2) = "${fn:contains(str1, str2)}" <br><br>  <!-- str1이 str2를 포함하는지 묻는다. 대소문자를 구분한다. 포함하면 true  -->
containsIgnoreCase(str1, str2) = "${fn:containsIgnoreCase(str1, str2)}" <br><br> <!-- 대소문자를 구분하지 않고 지정된 문자가 있는지 확인 -->

<c:set var="array" value="${fn:split(tokens, ',')}" /> <!-- tokens를 쉼표를 구분자로 끊어 array 변수에 저장한다. -->

\${array} : ${array}<br><!-- 주소가 나옴 -->

<c:set var="total" value="0" /> <!-- 자바는 초기화해야지만 누적하지만 jstl은 자동초기화되니까 안해도 ㄱㅊ -->
<c:set var="arrlen" value="${fn:length(array)}"/> <!-- array의 길이를 구한다. -->

<c:forEach var="i" begin="0" end="${arrlen-1}" step="1">
	<c:out value="${array[i]}" />  <!-- 반복하여 array 출력함. -->
</c:forEach>
<br><br>

<c:forEach var="i" begin="0" end="${arrlen-1}" step="1">
	<c:set var="total" value="${total + array[i]}" /> <!-- 반복하여 덧셈함 -->
</c:forEach>

총합 : <c:out value="${total}" /><br><br> <!-- 덧셈 출력 -->

array의 길이 : length(array) = ${fn:length(array)} <br><br> <!-- 10 -->
join(array, "-") = "${fn:join(array, "-")}" <br><br> <!-- array배열을 연결하는데 - 를중ㅇ간에 넣어서 연결. 마지막에는 안붙음 -->


</body>
</html>

