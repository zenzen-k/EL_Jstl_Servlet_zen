package myPkg;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("*.bk")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ServletContext sc;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		sc = config.getServletContext();
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
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		System.out.println("command : " + command);
		
		// 부모가 인터페이스인 BCommand 이므로 하나로 만들어서 관리해도 된다.
		BCommand bcommand;
		if(command.equals("/insert.bk")) {
			if(sc.getAttribute("flag").equals("false")) {
				bcommand = new BInsertCommand();
				bcommand.execute(request, response);
				sc.setAttribute("flag", "true");
			}
			viewPage = "/list.bk";
		}
		else if(command.equals("/delete.bk")) {
			bcommand = new BDeleteCommand();
			bcommand.execute(request, response);
			viewPage = "list.bk";
		}
		else if(command.equals("/updateForm.bk")) {
			bcommand = new BUpdateFormCommand();
			bcommand.execute(request, response);
			viewPage = "updateForm.jsp";
		}
		else if(command.equals("/update.bk")) {
			bcommand = new BUpdateCommand();
			bcommand.execute(request, response);
			viewPage = "list.bk";
		}
		else if(command.equals("/list.bk")) {
			// 원래는 여기서 dao 만들고 ~~ 속성설정해서 넘겼었다.
			bcommand = new BListCommand();
			bcommand.execute(request, response);
			viewPage = "bookList.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
