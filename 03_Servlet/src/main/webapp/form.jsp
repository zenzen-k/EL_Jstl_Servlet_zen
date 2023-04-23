<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
form의 형태
<form>
	<input type="submit" value="전송">
</form>

1. form.jsp 실행을 요청함 (run as - run on server  / ctrl + f11 / 브라우저에 직접 입력하여 요청가능)
2. 결과를 웹브라우저에 출력한다.

1-2. 나의 요청을 server 즉 설치했던 아파치톰캣이 



[servlet 동작순서] 
1. 객체가 생성되며 생성자가 자동호출된다. -> 요청시 맨 처음 단 한번 수행
2. init 메서드 자동호출 -> 요청시 맨 처음 단 한번 수행
3. doGet / doPost 둘중 하나 자동호출 -> 요청 마다 수행한다.
4. 수정 또는 서버의 종료발생시 destroy 자동호출

-> 새로고침하면 doGet이 호출된다.

-> 만약 수정하고 새로고침을 한다면 서버를 재로드 하기 때문에 생성자부터 다시 실행된다.

요청명(/hello)은 클래스명(HelloServlet)과 같은걸로 기본설정되지만 보안상 좋지 않기 때문에 변경해주는 것이 좋다.
/hello.xyz 같은 기존에 없는 확장자형태로 작성하면 굿