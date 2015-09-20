package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NotificationsDAO;
import entity.Notifications;

//排序类
public class SortServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SortServlet() {
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

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			response.setContentType("text/html;charset=utf-8");
			String sort ="";
			sort = request.getParameter("sort");
			if(sort.equals("sort1")){//按照举行时间排序，排序对象为数据库里的所有对象
				request.getRequestDispatcher("../sort1.jsp").forward(request, response);
				
			}if(sort.equals("sort2")){//按照发布时间排序，排序对象为数据库里的所有对象,首页默认按照发布时间排序
				request.getRequestDispatcher("../index.jsp").forward(request, response);
				
			}if(sort.equals("sort3")){//按照举行时间排序，排序对象为搜索结果的所有对象
				request.getRequestDispatcher("../sort3.jsp").forward(request, response);
				
			}if(sort.equals("sort4")){//按照发布时间排序，排序对象为搜索结果的所有对象，搜索结果也是默认按照发布时间排序
				request.getRequestDispatcher("../search.jsp").forward(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	//按照举行时间排序
	//参数s是返回  查询符合条件的所有对象  sql语句
	public ArrayList<Notifications> OderByTime(String s){

		ArrayList<Notifications> list = new ArrayList<Notifications>();
		String sql ="("+s+")"+" order by time DESC;";//按照降序排序
		NotificationsDAO notifiDAO = new NotificationsDAO();
		return notifiDAO.getResourceBySQL(sql, list);
	}
	
	//按照发布时间排序
	//参数s是返回  查询符合条件的所有对象  sql语句
    public ArrayList<Notifications> OderByNotify_time(String s){

	    ArrayList<Notifications> list = new ArrayList<Notifications>();
		String sql ="("+s+")"+ " order by notify_time DESC;";//按照降序排序
		NotificationsDAO notifiDAO = new NotificationsDAO();
		return notifiDAO.getResourceBySQL(sql, list);
	}

}