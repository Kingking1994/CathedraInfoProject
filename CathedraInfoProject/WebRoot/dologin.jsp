<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%--这是登录逻辑管理 --%>

        <%
        
        request.setCharacterEncoding("utf-8");
        
        String username="";
        String password="";
        
        username = request.getParameter("username");
        password = request.getParameter("password");
        //默认用户名为admin，密码为admin
        //这里要使用equals（）函数进行比较，如果使用 == 来判断，却无法比较
        if(username.equals("admin") && password.equals("admin")){
        //设置session，用来判断是否处在登录状态，增加安全性，以免用户跳过登录界面进入后台管理
        session.setAttribute("login", "login");
        response.sendRedirect("sys_manage.jsp");
        }else{
        response.sendRedirect("login.jsp");
        }
        
         %>
