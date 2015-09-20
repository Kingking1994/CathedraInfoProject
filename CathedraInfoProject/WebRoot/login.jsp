<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/admin_login.css">


  </head>
  
  <%
  request.setCharacterEncoding("utf-8");
   %>
  
  <body>
<div class="admin_login_wrap">
    <h1>后台管理</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="dologin.jsp" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="user">用户名：</label>
                        <input type="text" name="username" value="" id="user" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <label for="pwd">密码：</label>
                        <input type="password" name="password" value="" id="pwd" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <input type="submit" tabindex="3" value="登录" class="btn btn-primary" />
                    </li>
                </ul>
            </form>
        </div>       
    </div>
</div>
</body>
</html>
