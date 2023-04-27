<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
loginForm<br>

<form action="login.do" method="post">
	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="text" name="passwd"><br>
	취미 :
		<input type="checkbox" name="hobby" value="운동">운동
		<input type="checkbox" name="hobby" value="공부">공부
		<input type="checkbox" name="hobby" value="영화">영화
	
	<input type="submit" value="로그인">
</form>

login.do 요청 -> myPkg.LoginServelet 이동
웹브라우저에 입력한 아이디 비번 출력하기!