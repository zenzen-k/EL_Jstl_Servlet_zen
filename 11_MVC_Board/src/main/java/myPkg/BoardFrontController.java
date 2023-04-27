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
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bd")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServletContext sc;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		System.out.println("command : " + command);
		

		BoardCommand bcommand;

		if(command.equals("/insert.bd")) {
			if(sc.getAttribute("flag").equals("false")) {
				bcommand = new BoardInsertCommand();
				bcommand.execute(request, response);
				sc.setAttribute("flag", "true");
			}
			viewPage = "list.bd";
		}
		else if(command.equals("/content.bd")) {
			bcommand = new BoardContentCommand();
			bcommand.execute(request, response);
			viewPage = "content.jsp";
		}
		/*
		 * else if(command.equals("/deleteForm.bd")) { bcommand = new
		 * BoardDeleteFormCommand(); bcommand.execute(request, response); viewPage =
		 * "deleteForm.jsp"; }
		 */
		else if(command.equals("/delete.bd")) {
			bcommand = new BoardDeleteCommand();
			bcommand.execute(request, response);
			
			int cnt = (Integer)request.getAttribute("cnt");
			
			if(cnt != 1){
				response.getWriter().append("<script>alert('비밀번호가 일치하지 않습니다');history.go(-1);</script>");
				return;
			}
			
			viewPage = "list.bd?pageNum=" + request.getAttribute("pageNum");
		}
		else if(command.equals("/updateForm.bd")) {
			bcommand = new BoardUpdateFormCommand();
			bcommand.execute(request, response);
			viewPage = "updateForm.jsp";
		}
		else if(command.equals("/update.bd")) {
			bcommand = new BoardUpdateCommand();
			bcommand.execute(request, response);
			
			int cnt = (Integer)request.getAttribute("cnt");
			
			if(cnt != 1){
				response.getWriter().append("<script>alert('비밀번호가 일치하지 않습니다');history.go(-1);</script>");
				return;
			}
			viewPage = "list.bd";
		}
		else if(command.equals("/list.bd")) {
			bcommand = new BoardListCommand();
			bcommand.execute(request, response);
			viewPage = "boardList.jsp";
		}
		/*
		 * else if(command.equals("/replyForm.bd")) { bcommand = new
		 * BoardReplyFormCommand(); bcommand.execute(request, response); viewPage =
		 * "replyForm.jsp"; }
		 */
		else if(command.equals("/reply.bd")) {
			if(sc.getAttribute("flag").equals("false")) {
				bcommand = new BoardReplyCommand();
				bcommand.execute(request, response);
				sc.setAttribute("flag", "true");
			}
			viewPage = "list.bd";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
