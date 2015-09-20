package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NotificationsDAO;
import entity.Notifications;

//������
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
			if(sort.equals("sort1")){//���վ���ʱ�������������Ϊ���ݿ�������ж���
				request.getRequestDispatcher("../sort1.jsp").forward(request, response);
				
			}if(sort.equals("sort2")){//���շ���ʱ�������������Ϊ���ݿ�������ж���,��ҳĬ�ϰ��շ���ʱ������
				request.getRequestDispatcher("../index.jsp").forward(request, response);
				
			}if(sort.equals("sort3")){//���վ���ʱ�������������Ϊ������������ж���
				request.getRequestDispatcher("../sort3.jsp").forward(request, response);
				
			}if(sort.equals("sort4")){//���շ���ʱ�������������Ϊ������������ж����������Ҳ��Ĭ�ϰ��շ���ʱ������
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
	
	//���վ���ʱ������
	//����s�Ƿ���  ��ѯ�������������ж���  sql���
	public ArrayList<Notifications> OderByTime(String s){

		ArrayList<Notifications> list = new ArrayList<Notifications>();
		String sql ="("+s+")"+" order by time DESC;";//���ս�������
		NotificationsDAO notifiDAO = new NotificationsDAO();
		return notifiDAO.getResourceBySQL(sql, list);
	}
	
	//���շ���ʱ������
	//����s�Ƿ���  ��ѯ�������������ж���  sql���
    public ArrayList<Notifications> OderByNotify_time(String s){

	    ArrayList<Notifications> list = new ArrayList<Notifications>();
		String sql ="("+s+")"+ " order by notify_time DESC;";//���ս�������
		NotificationsDAO notifiDAO = new NotificationsDAO();
		return notifiDAO.getResourceBySQL(sql, list);
	}

}