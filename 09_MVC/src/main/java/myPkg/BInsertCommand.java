package myPkg;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BInsertCommand implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 값을 여기서 받ㄴ는다.
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		int price = Integer.parseInt(request.getParameter("price"));
		
		BookBean bb = new BookBean(0, title, author, price);
		
		// dao 객체 생성
		BookDao bdao = BookDao.getInstance();
		bdao.insertBook(bb);
		
		
		// 서블릿이 아닌 여기서 설정해도 된다.
		// ServletContext app = request.getServletContext();
		// app.setAttribute("flag", "true");
	}
}
