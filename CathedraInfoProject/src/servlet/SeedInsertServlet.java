package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SeedInsertServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SeedInsertServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		boolean flag =SeedInsert(request, response);
		if(flag){
			request.getRequestDispatcher("../sys_manage.jsp").forward(request, response);
		}else{
			response.sendRedirect("../seed_insert.jsp");
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
	
	//返回bool类型，成功为true，失败为false
	public boolean SeedInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
        response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");//解决了中文乱码问题
        
		String start_url =request.getParameter("start_url");
		String college =request.getParameter("college");
		String url_xpath =request.getParameter("url_xpath");
		String word =request.getParameter("word");
		String title =request.getParameter("title");
		String speaker =request.getParameter("speaker");
		String venue =request.getParameter("venue");
		String time =request.getParameter("time");
		String text_xpath =request.getParameter("text_xpath");
		if(start_url!="" && college!="" && url_xpath!=""){
			String values ="values ('"+start_url+"','"+college+"','"+url_xpath+"','"+word+"','"+title+"','"+speaker+"','"+time+"','"+venue+"','"+text_xpath+"')";
			String sql="";
			sql="insert into seeds "+values;
			Connection connection =null;
			PreparedStatement stmt = null;
			try {
				connection = DBHelper.getConnection();
				stmt =connection.prepareStatement(sql);
				stmt.execute("set Names utf8");
				stmt.executeUpdate();
				return true;
			} catch (SQLException se) {
				se.printStackTrace();
				return false;
			}catch (Exception e) {
				e.printStackTrace();
				return false;
			}finally{
				try{
			         if(stmt!=null)
			            stmt.close();
			            stmt =null;
			      }catch(SQLException se){
			    	  se.printStackTrace();
			      }
			}
		}else{
			return false;
		}
	}
	

}
