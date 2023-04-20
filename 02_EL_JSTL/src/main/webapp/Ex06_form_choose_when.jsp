<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex06_form_choose_when.jsp<br>

<form action="Ex06_result_choose_when.jsp" method="post">
	좋아하는 음식 선택
	<select name="food">
		<option value="피자">피자</option>
		<option value="호떡">호떡</option>
		<option value="붕어빵">붕어빵</option>
		<option value="치킨">치킨</option>
	</select>
	<br><br>
	<input type="submit" value='전송'>
</form>