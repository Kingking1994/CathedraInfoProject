<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="entity.Notifications" %>
<%@ page import="dao.NotificationsDAO" %>
<%@ page import="servlet.SortServlet" %>
<%@ page import="dao.SeedsDAO" %>
<%@ page import="entity.Seeds" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/main.css">
	
 <%--该页面是搜索结果，首页默认显示搜索结果有效对象，并默认为按照发布时间排序 --%>
 
    <%
	//设置字符集为utf-8
	request.setCharacterEncoding("utf-8");
    %>
 
<div>


    <div class="first-head-div">
        <div class="second-head-div">
            <img  style="margin-left:20px;" src="image/home.png"/>
            <a href="" class="website-home">网站首页</a>
            <div style="float:right">
                <a onclick="window.external.AddFavorite(location.href,document.title);">加入收藏</a>
                <span>
                    <a class="phone">188 1412 2680</a>
                </span>
            </div>
        </div>
    </div>



    <div class="first-top-div">
    	<div class="second-top-div">听讲座 品人生</div>
    	<!-- 登录入口 -->
    	<div class="admin_login">
    	<a href="login.jsp">管理员登录</a>
    	</div>
        <div class="search">
        <!-- 搜索关键字表单 -->
            <form action="servlet/SearchServlet">
                <input class="text" name="search" type="text" placeholder="输入关键字搜索" />
                <input class="btn" type="submit" value="" />
            </form>
        </div>
    </div>  



    <div class="second-div">

<!-- 排序表单 -->
        <div class="first-div clearfix unstyled" style="width:200px">
            <li><a class="three-d">
                时间筛选
            <span class="three-d-box"><span class="front">时间筛选</span><span class="back">时间筛选</span></span></a>
            <ul class="clearfix unstyled drop-menu">
                <li><a href="servlet/SortServlet?sort=sort4" class="three-d">
                    讲座发布时间优先
                <span class="three-d-box"><span class="front">讲座发布时间优先</span><span class="back">讲座发布时间优先</span></span>
                </a></li>
                <li><a href="servlet/SortServlet?sort=sort3" class="three-d">
                    讲座举行时间优先
                <span class="three-d-box"><span class="front">讲座举行时间优先</span><span class="back">讲座举行时间优先</span></span>
                </a></li>
            </ul>
            </li>	
        </div>


<!-- 信息列表 -->
        <div class="allmessage">
        
        <%!
        //一个页面显示4条信息
        public static final int pageSize =4;
        int pageCount;
        //初始化当前页面为首页
        int curPage =1;
         %>

        <%
		//举行时间的格式，包括时分秒
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//发布时间格式
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
		SortServlet sortServlet = new SortServlet();
		ArrayList<Notifications> list =sortServlet.OderByNotify_time((String)session.getAttribute("searchSQL"));
		int size=list.size();
        if(list!=null&&size>0){
		//如果一页能够放4条记录，则即可获得需要分几页
        pageCount = (size%pageSize==0)?(size/pageSize):(size/pageSize+1);
        String tmp = request.getParameter("curPage");
        if(tmp==null || tmp.equals("0")){//判断是否超出首页
        tmp="1";
        }
        curPage = Integer.parseInt(tmp);
        if(curPage>=pageCount) curPage = pageCount;
        for(int i=(curPage-1)*pageSize;i<curPage*pageSize;i++){
        //判断是否超出尾页
        if(i >=size) break;
		Notifications notifi=list.get(i);
		 %>


<%--循环开始 --%>
        	<div class="message">
					<h2 class="title">
						<a href="javascript:void(0)"style='text-decoration:none;'>
							  <%=notifi.getTitle() %></a></h2>
					<div class="short">
						<ul>                
							<li class="time"><%=sdf1.format(new Date(notifi.getTime().getTime())) %></li>
							<li class="place"><%=notifi.getCollege() %>&nbsp&nbsp<%=notifi.getVenue() %></li>
							<li class="person"><%=notifi.getSpeaker() %></li>
						</ul>
					</div>
					<div class="notify_time">
						<lable><%=sdf2.format(new Date(notifi.getNotify_time().getTime())) %></lable>
					</div>
					<div class="messege_url">
						<lable><a href="<%=notifi.getUrl()%>" target="_blank">查看全文</a></lable>
					</div>
				</div>
				
<%--循环结束 --%>
           <%
			}
			}else{
			
			 %>
			 <div class="message">
			 <h1>对不起，没有找到相关结果！</h1>
			 </div>	 
			 <%
			 }
			  %>

        </div>
        
     <div id="pagelist">
    <ul>
    <li><a href="search.jsp?curPage=1">首页</a></li>
    <li><a href="search.jsp?curPage=<%= curPage -1%>">上页</a></li>
	<li class="pageinfo">第<%=curPage %>页</li>
    <li><a href="search.jsp?curPage=<%= curPage +1 %>">下页</a></li>
    <li><a href="search.jsp?curPage=<%= pageCount %>">尾页</a></li>
    <li class="pageinfo">共<%= pageCount %>页</li>
   </ul>
   </div>


        <div class="website">
            <h2>已有站点</h2>
            <hr />

            <div class="list">
                <ul>
         <%
        SeedsDAO seedsDAO = new SeedsDAO();
		ArrayList<Seeds> seedslist =new ArrayList<Seeds>();
		seedslist= seedsDAO.getAllSeeds();
		if(seedslist != null && seedslist.size() > 0){
		for(int i=0;i<seedslist.size();i++){
		Seeds seed=seedslist.get(i);
         %>
                
                    <li><a href="servlet/SearchServlet?search=<%=seed.getCollege()%>"><%=seed.getCollege() %></a></li>
         <%
          }
          } 
         %>                    
                </ul>
                
            </div>
        </div>
        

		<a class="backtop" href="javascript:scroll(0,0)" style="display: inline;"></a>

    </div>
    
</div>    
</body>
</html>
