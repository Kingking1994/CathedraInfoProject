package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NotificationsDAO;
import entity.Notifications;

public class SearchServlet extends HttpServlet {

	
	/**
	 * Constructor of the object.
	 */
	public SearchServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
		//把查询sql语句放入session里
		try {
			HttpSession session = request.getSession();
			String searchSQL = getSQLByRequest(request, response);
			//这里一定要判断searchSQL是否为空，因为页面跳转的时候发生了两次页面跳转，那么就会产生两次请求
			//第二次的请求所获得的result为空，那么searchSQL就为空
			//无法为后面的jsp页面获取searchSQL，从而排序的时候无法获取对象
			if(searchSQL !=null){
			session.setAttribute("searchSQL", searchSQL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//跳转到查询结果页面
		request.getRequestDispatcher("../search.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	
	public String getSQLByRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		try {
			response.setContentType("text/html;charset=utf-8");
			String result = "";
			result = request.getParameter("search");
			//在title里匹配查找,在college里匹配查找,在speaker里匹配查找,在venue里匹配查找
			String sql="select * from notifications where title like '%"+result+"%' or college like '%"+result+"%' or speaker like '%"+result+"%' or venue like '%"+result+"%'";	
			return sql;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public ArrayList<Notifications> getSearchResult(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException{
	
		ArrayList<Notifications> list = new ArrayList<Notifications>();
		NotificationsDAO notifiDAO = new NotificationsDAO();
		String sql = getSQLByRequest(request, response);
		return notifiDAO.getResourceBySQL(sql, list);		
	}


}
