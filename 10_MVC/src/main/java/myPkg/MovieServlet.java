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
 * Servlet implementation class MovieServlet
 */
@WebServlet("*.mv")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServletContext sc;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		
		MCommand mc;
		if(command.equals("/insert.mv")) {
			System.out.println("insert.mv");
			if(sc.getAttribute("flag").equals("false")) {
				mc = new MInsertCommand();
				mc.execute(request, response);
				sc.setAttribute("flag", "true");
			}
			viewPage = "list.mv";
		}
		else if(command.equals("/delete.mv")) {
			mc = new MDeleteCommand();
			mc.execute(request, response);
			viewPage = "list.mv";
		}
		else if(command.equals("/updateFrom.mv")) {
			System.out.println("updateFrom");
			mc = new MUpdateFormCommand();
			mc.execute(request, response);
			viewPage = "updateForm.jsp";
		}
		else if(command.equals("/update.mv")) {
			mc = new MUpdateCommand();
			mc.execute(request, response);
			viewPage = "list.mv";
		}
		else if(command.equals("/list.mv")) {
			mc = new MListCommand();
			mc.execute(request, response);
			viewPage = "movieList.jsp";
		}
		else if(command.equals("/idcheck.mv")) {
			// form에서 중복체크 -> idcheck함수의 ajax -> idcheck.mv -> MidcheckCommand
			// -> N 또는 Y를 가지고 다시 여기로옴 -> return을 함으로써 /idcheck.mv 요청한곳으로 돌아감.
			
			System.out.println("idcheck.mv");
			mc = new MIdcheckCommand();
			mc.execute(request, response);
			sc.setAttribute("flag", "false");
			// 요청했던 ajax로 돌아가야함. dispatcher를 만나지 못핟로곡!
			return;
		}
		System.out.println("viewPage : " + viewPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
