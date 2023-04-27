package myPkg;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("*.mb")
//@WebServlet({"/insert.mb","/update.mb","/delete.mb","/select.mb"})
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
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
		// 한글처리를 안해줘서 글자수가 커진다.
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		//int len = conPath.length();
		//String command = uri.substring(len); len변수에 넣어도 되지만 바로 넣어도 ㄱㅊ
		String command = uri.substring(conPath.length());
		
		System.out.println("method : " + request.getMethod()); // 어떤 요청인지 출력함
		
		MemberDao mdao = new MemberDao();
		String viewPage = "Ex01_memberTo.jsp";
		
		if(command.equals("/insert.mb")) {
			System.out.println("insert 요청");
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			
			MemberBean mb = new MemberBean(0, name, password);
			mdao.insertData(mb);
		}
		else if(command.equals("/update.mb")) {
			System.out.println("update 요청");
			
			String name = request.getParameter("name");
			int no = Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");
			
			MemberBean mb = new MemberBean(no, name, password);
			mdao.updateMember(mb);
			
			viewPage = "list.mb";
		}
		else if(command.equals("/delete.mb")) {
			System.out.println("delete 요청");
			// 번호받고 다오 가서 삭제하고 memberList.jsp로 
			String no = request.getParameter("no");
			//System.out.println("no : " + no);
			mdao.deleteMember(no);
			
			// 또 챙겨가줘야한다. 같은코드 다시 쓰던지 list서블릿 호출하던지~~~
			viewPage = "/list.mb";
		}
		else if(command.equals("/list.mb")) {
			//System.out.println("list 요청(select)");
			// memberTo.jsp -> memberList.jsp
			ArrayList<MemberBean> lists = mdao.getAllMember();
			// 가져온 목록을 보내기 위해서 속성으로 설정함!
			request.setAttribute("lists", lists);
			viewPage = "Ex01_memberList.jsp";
		}
		else if(command.equals("/updateForm.mb")) {
			//수정폼으로 갈때 데이터 가져가게끔. 목록보기(수정클릭) -> 번호가지고 옴
			String no = request.getParameter("no");
			MemberBean mb = mdao.getOneMember(no);
			request.setAttribute("mb", mb);
			viewPage = "Ex01_memberUpdateForm.jsp";
		}
		
		// 이동할거임
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}//doProcess

}
