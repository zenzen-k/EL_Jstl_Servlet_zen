<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
getRequest.jsp<br>

<script>
	function movePage() {
		//alert(1);
		location.href = "request.do";
	}
</script>


<a href="request.do">링크</a> <br><br>

<input type="button" value="GET 요청" onclick="movePage()"/><br><br>

<form action="request.do" method="get">
	<input type="submit" value="get방식 호출">
</form>



<form action="request.do" method="post">
	<input type="submit" value="post방식 호출">
</form>