<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String[] kind = {"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
%>
	<h1>도서 정보 입력</h1>
	<form name="myform" action="Ex_result_김아연.jsp" method="post">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="buy"> </td>
			</tr>

			<tr>
				<td>배송비</td>
				<td>
				 <%
				 	for(int i=0;i<kind.length;i++){
				 %>
				 	<%=kind[i] %> <input type="radio" name="kind" value="<%=kind[i] %>"> 
				 <%	
				 	}
				 %>
				</td>
			</tr>
			<tr>
				<td>구입가능 서점</td>
			
				<td>
				<%
				 		for(int i=0;i<bookstore.length;i++){
				 			
				 	%>
				 		<%=bookstore[i] %>  <input type="checkbox" name="bookstore" value="<%=bookstore[i] %>">
				 	<%
				 		}
				 	%> 
				 
				</td>
				
			</tr>
			<tr>
				<td>보유수량</td>
				<td>
					<select name="count">
						<option value="선택">선택</option>
						 <%
						 	for(int i=1;i<=5;i++){
						%>
								<option value="<%=i%>"><%=i%></option>
						<%						 		
						 	}
						 %>
					</select>
				</td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="전송"> 
		<input type="reset"	value="취소">
	</form>


