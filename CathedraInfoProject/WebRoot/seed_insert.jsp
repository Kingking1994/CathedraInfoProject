<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加站点</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/system.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>

  </head>
  
    <%--这段代码是判断用户是否已经登录，防止直接进入后台 --%>
  <%
  if(session.getAttribute("login") == null  ){
  response.sendRedirect("index.jsp");
  }
   %>

<body>

  
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");//解决了中文乱码问题
   %>
  
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <ul class="navbar-list clearfix">
                <li><a class="on" href="sys_manage.jsp">后台首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="javascript:void(0)">管理员</a></li>
                <li><a href="javascript:void(0)">修改密码</a></li>
                <li><a href="index.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="javascript:void(0)"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="sys_manage.jsp"><i class="icon-font">&#xe008;</i>站点管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="javascript:void(0)"><i class="icon-font">&#xe017;</i>系统设置</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i>首页<span class="crumb-step">&gt;</span><a class="crumb-name" href="sys_manage.jsp">站点管理</a><span class="">&gt;</span><span>添加站点</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                    <table class="insert-tab" width="100%">
						<form action="servlet/SeedInsertServlet" method="post">
							<tr><td><input style="width:500px" type="text" id="college" name="college" placeholder="输入college" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="start_url" name="start_url" placeholder="输入start_url" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="url_xpath" name="url_xpath" placeholder="输入url_xpath" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="word" name="word" placeholder="输入word" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="title" name="title" placeholder="输入title" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="speaker" name="speaker" placeholder="输入speaker" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="venue" name="venue" placeholder="输入venue" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="time" name="time" placeholder="输入time" /></td></tr>
							<tr><td><input style="width:500px" type="text" id="text_xpath" name="text_xpath" placeholder="输入text_xpath" /></td></tr>
							<tr><td><input  style="width:100px" type="submit" name="addweb" value="添加"  /></td></tr>
			</form>
  </table>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>
