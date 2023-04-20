<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="Ex08_result_김아연.jsp" method="post">

<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>몸무게</td>
		<td><input type="text" name="weight"></td>
	</tr>
	<tr>
		<td>키</td>
		<td><input type="text" name="height"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			남 <input type="radio" name="gender" value="man">
			여 <input type="radio" name="gender" value="woman">
		</td>
	</tr>
	<tr>
		<td>취미</td>
		<td>
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="요리">요리
			<input type="checkbox" name="hobby" value="게임">게임
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<select name="addr">
				<option value="">선택</option>
				<option value="서울">서울</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="전송하기"></td>
	</tr>
</table>

</form>