<%@page import="entity.Seeds"%>
<%@page import="dao.SeedsDAO"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>站点管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/system.css" />
<script type="text/javascript" src="js/libs/modernizr.min.js"></script>

<script type="text/javascript">
	function myFunction() {
		window.alert("整个过程大约要五分钟，请耐心等待。");
	}
</script>

</head>

<%--这段代码是判断用户是否已经登录，防止直接进入后台 --%>
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("index.jsp");
	}
%>

<%
	request.setCharacterEncoding("utf-8");
%>

<body>

	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<ul class="navbar-list clearfix">
					<li><a class="on" href="sys_manage.jsp">后台首页</a>
					</li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li><a href="javascript:void(0)">管理员</a>
					</li>
					<li><a href="javascript:void(0)">修改密码</a>
					</li>
					<li><a href="index.jsp">退出</a>
					</li>
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
					<li><a href="javascript:void(0)"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a href="sys_manage.jsp"><i class="icon-font">&#xe008;</i>站点管理</a>
							</li>
						</ul></li>
					<li><a href="javascript:void(0)"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="javascript:void(0)"><i class="icon-font">&#xe017;</i>系统设置</a>
							</li>

						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i>首页<span class="crumb-step">&gt;</span><span
						class="crumb-name">站点管理</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="javascript:void(0)" method="post">
						<table class="search-tab">
							<th width="70">关键字:</th>
							<td><input class="common-text" placeholder="关键字"
								name="keywords" value="" id="" type="text">
							</td>
							<td><input class="btn btn-primary btn2" name="sub"
								value="查询" type="submit">
							</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<a href="seed_insert.jsp"><i class="icon-font"></i>添加站点</a> <a
								id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
							<a id="updateOrd" href="progressbar.jsp"
								onclick="myFunction();"><i class="icon-font"></i>启动爬虫，更新数据库</a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%" id="webmanage">
							<tr>
								<th>college</th>
								<th>start_url</th>
								<th>url_xpath</th>
								<th>word</th>
								<th>title</th>
								<th>speaker</th>
								<th>venue</th>
								<th>time</th>
								<th>text_xpath</th>
							</tr>

							<!-- 循环开始 -->
							<%
								SeedsDAO seedsDAO = new SeedsDAO();
								ArrayList<Seeds> list = new ArrayList<Seeds>();
								list = seedsDAO.getAllSeeds();
								if (list != null && list.size() > 0) {
									for (int i = 0; i < list.size(); i++) {
										Seeds seed = list.get(i);
							%>

							<tr>
								<td><%=seed.getCollege()%></td>
								<td><a href="<%=seed.getStart_url()%>" target="_blank"><%=seed.getStart_url()%></a>
								</td>
								<td><%=seed.getUrl_xpath()%></td>
								<td><%=seed.getWord()%></td>
								<td><%=seed.getTitle()%></td>
								<td><%=seed.getSpeaker()%></td>
								<td><%=seed.getVenue()%></td>
								<td><%=seed.getTime()%></td>
								<td><%=seed.getText_xpath()%></td>

							</tr>
							<%
								}
								}
							%>
							<!-- 循环结束 -->

						</table>

					</div>
				</form>
			</div>
		</div>
		<!--/main-->
	</div>

</body>


</html>
