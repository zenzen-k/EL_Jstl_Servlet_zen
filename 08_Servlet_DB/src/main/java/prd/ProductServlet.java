package prd;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("*.prd")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServletContext sc;
	String flag;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// ServletConfig : 서블릿당하나
		// ServletContext : 프로젝트당 하나
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
		// UnsupportedEncodingException -> jsp에서는 알아서 예외처리해주지만 java에서는 해주어야 한당
		// java.io.IOException 의 자식이므로 IOException만 해도 ㅇㅋ
		
		String uri = request.getRequestURI();
		String conpath = request.getContextPath();
		String command = uri.substring(conpath.length());
		String method = request.getMethod();
		System.out.println("command : " + command + " , method : " + method);
		
		
		String pageView = null;
		ProductDao pdao = new ProductDao();
		
		if(command.equals("/insert.prd")) {
			flag = (String)sc.getAttribute("flag");
			
			if(flag.equals("false")) {
				// 아까 요청했기 때문에 새로고침할때 똑같은 내용이 request에 들어가있따.
				String name = request.getParameter("name");
				int price = Integer.parseInt(request.getParameter("price"));
				
				ProductBean pb = new ProductBean(0, name, price);
				pdao.insertProduct(pb);
				
				sc.setAttribute("flag", "true");
				//sc.setInitParameter("flag", "false");
			}
			
			// 꼭 거쳐야 하는 것은 아니다.
			//pageView = "Ex02_productInsertDo.jsp";
			pageView = "list.prd"; // 서블릿으로 다시 가서 service메서드 -> get/post -> doProcess
		}
		else if(command.equals("/delete.prd")) {
			String num = request.getParameter("num");
			pdao.deleteProduct(num);
			
			pageView = "/list.prd"; // 해도 ㄱㅊ 안해도 ㄱㅊ
		}
		else if(command.equals("/list.prd")) {
			ArrayList<ProductBean> lists = pdao.getAllProduct();
			request.setAttribute("lists", lists);
			
			pageView = "Ex02_productList.jsp";
		}
		else if(command.equals("/updateForm.prd")) {
			String num = request.getParameter("num");
			ProductBean pb = pdao.getOneProduct(num);
			request.setAttribute("pb", pb);
			
			pageView = "Ex02_productUpdateForm.jsp";
		}
		else if(command.equals("/update.prd")) {
			int num = Integer.parseInt(request.getParameter("num"));
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			
			ProductBean pb = new ProductBean(num, name, price);
			pdao.updateProduct(pb);
			
			pageView = "list.prd";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageView);
		dispatcher.forward(request, response); //ServletException, IOException
		System.out.println("===============================");
		
	}

}
