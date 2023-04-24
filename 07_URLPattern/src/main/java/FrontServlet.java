

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontServlet
 */

// /insert.do, /update.do, /delete.do /select.do
// 모두 여기서 처리할수 있도록.
// 여러개의 요청을 하나의 서블릿에서 처리하고 싶을 떈 { }
//@WebServlet({"/insert.do", "/update.do", "/delete.do", "/select.do"})
@WebServlet("*.do")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("doGet");
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		doProcess(request,response);
	}
	
	// get. post 모두 여기로 온다!
	// 요청에 따라 해야할 일이 다르므로 이를 처리하기 위함
	private void doProcess(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String conPath = request.getContextPath();
		int len = conPath.length();
		String command = uri.substring(len);
		
		System.out.println("uri : " + uri);
		System.out.println("url : " + url);
		System.out.println("conPath : " + conPath);
		System.out.println("len : " + len);
		System.out.println("command : " + command);
		
		if(command.equals("/insert.do")) {
			System.out.println("insert요청 들어옴");
		}
		else if(command.equals("/update.do")) {
			System.out.println("update요청 들어옴");
		}
		else if(command.equals("/delete.do")) {
			System.out.println("delete요청 들어옴");
		}
		else{
			System.out.println("select요청 들어옴");
		}
		System.out.println("---------------------------");
	}
	
	
}
