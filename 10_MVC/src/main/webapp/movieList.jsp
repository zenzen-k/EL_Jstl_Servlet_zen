<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
	function allCheck(obj) {
		var row = document.getElementsByName("rowchk");
		
		if(obj.checked){
			for(i=0; i<row.length; i++){
				row[i].checked = true;
			}
		}else{
			for(i=0; i<row.length; i++){
				row[i].checked = false;
			}
		}
	}
	
	function delcheck() {
		var row = document.getElementsByName("rowchk");
		var flag = false;
		for(i=0; i<row.length; i++){
			if(row[i].checked){
				flag = true;
				break;
			}
		}
		
		if(flag){
			document.form.submit();
		}else{
			alert('한개 이상 선택');
			return false
		}
	}
</script>



movieList.jsp<br>

<form action="delete.mv" method="post" name="form">
	<input type="button" value="삭제" onclick="return delcheck()">
	<input type="button" value="추가" onclick="location.href='insertForm.jsp'">
	
	<table border="1">
		<tr>
			<td>
				<input type="checkbox" name="allchk" onclick="allCheck(this)">
			</td>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>나이</td>
			<td>좋아하는 장르</td>
			<td>즐겨보는 시간대</td>
			<td>동반관객수</td>
			<td>개선사항</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		
		<c:forEach var="lists" items="${lists}">
			<tr>
				<td>
					<input type="checkbox" name="rowchk" value="${lists.num}">
				</td>
				<td>${lists.num}</td>
				<td>${lists.id}</td>
				<td>${lists.name}</td>
				<td>${lists.age}</td>
				<td>${lists.genre}</td>
				<td>${lists.time}</td>
				<td>${lists.partner}</td>
				<td>${lists.memo}</td>
				<td><a href="updateFrom.mv?num=${lists.num}">수정</a></td>
				<td><a href="delete.mv?num=${lists.num}">삭제</a></td>
			</tr>
		</c:forEach>
		
	</table>
</form>