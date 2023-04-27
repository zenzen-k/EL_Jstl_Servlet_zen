package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BUpdateFormCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		BookDao bdao = BookDao.getInstance();
		BookBean bb = bdao.getOneBook(no);
		request.setAttribute("bb", bb);
	}
	
}
