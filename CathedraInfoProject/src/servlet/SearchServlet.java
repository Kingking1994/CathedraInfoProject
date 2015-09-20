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
		
		//�Ѳ�ѯsql������session��
		try {
			HttpSession session = request.getSession();
			String searchSQL = getSQLByRequest(request, response);
			//����һ��Ҫ�ж�searchSQL�Ƿ�Ϊ�գ���Ϊҳ����ת��ʱ����������ҳ����ת����ô�ͻ������������
			//�ڶ��ε���������õ�resultΪ�գ���ôsearchSQL��Ϊ��
			//�޷�Ϊ�����jspҳ���ȡsearchSQL���Ӷ������ʱ���޷���ȡ����
			if(searchSQL !=null){
			session.setAttribute("searchSQL", searchSQL);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//��ת����ѯ���ҳ��
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
			//��title��ƥ�����,��college��ƥ�����,��speaker��ƥ�����,��venue��ƥ�����
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
