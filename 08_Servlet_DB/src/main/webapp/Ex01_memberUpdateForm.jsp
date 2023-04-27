<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_memberUpdateForm.jsp<br>


<h3 align="center">회원수정</h3>

<form action="update.mb" method="post">
	<input type="hidden" name="no" value="${mb.getNo()}"> 
	<table border="1" align="center" width="80%">
		<tr>
			<td>이름</td>
			<td><input type='text' name="name" value="${mb.name}"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type='password' name="password" value="${requestScope.mb.password}"></td>
			<!-- 
			${mb.password}
			${requestScope.mb.password}
			${mb['password']}
			${mb.getPassword()}
			 -->
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원수정">
			</td>
		</tr>
	</table>
</form>