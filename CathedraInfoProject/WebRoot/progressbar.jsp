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

<title>My JSP 'progressbar.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3 ">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
 <style type="text/css">

        body
        {
            font-family: Thoma, Microsoft YaHei, 'Lato', Calibri, Arial, sans-serif;
        }

        #content
        {
            margin: 120px auto;
            width: 80%;
        }

        .loadBar
        {
            width: 600px;
            height: 30px;
            border: 3px solid #212121;
            border-radius: 20px;
            position: relative;
        }

        .loadBar div
        {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .loadBar div span, .loadBar div i
        {
            box-shadow: inset 0 -2px 6px rgba(0, 0, 0, .4);
            width: 0%;
            display: block;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            border-radius: 20px;
        }

        .loadBar div i
        {
            width: 100%;
            -webkit-animation: move .8s linear infinite;
            background: -webkit-linear-gradient(left top, #7ed047 0%, #7ed047 25%, #4ea018 25%, #4ea018 50%, #7ed047 50%, #7ed047 75%, #4ea018 75%, #4ea018 100%);
            background-size: 40px 40px;
        }

        .loadBar .percentNum
        {
            position: absolute;
            top: 100%;
            right: 10%;
            padding: 1px 15px;
            border-bottom-left-radius: 16px;
            border-bottom-right-radius: 16px;
            border: 1px solid #222;
            background-color: #222;
            color: #fff;

        }

        @-webkit-keyframes move
        {
            0%
            {
                background-position: 0 0;
            }
            100%
            {
                background-position: 40px 0;
            }
        }


    </style>


<script type="text/javascript" src="js/libs/jquery-1.8.3.js"></script>

<script type="text/javascript">
	function LoadingBar(id) {
		this.loadbar = $("#" + id);
		this.percentEle = $(".percent", this.loadbar);
		this.percentNumEle = $(".percentNum", this.loadbar);
		this.max = 100;
		this.currentProgress = 0;
	}
	LoadingBar.prototype = {
		constructor : LoadingBar,
		setMax : function(maxVal) {
			this.max = maxVal;
		},
		setProgress : function(val) {
			if (val >= this.max) {
				val = this.max;
			}
			this.currentProgress = parseInt((val / this.max) * 100) + "%";
			this.percentEle.width(this.currentProgress);
			this.percentNumEle.text(this.currentProgress);

		}
	};

	$(function() {

		var loadbar = new LoadingBar("loadBar01");
		var max = 1000;
		loadbar.setMax(max);
		var i = 1000;
		var time = setInterval(function() {
			loadbar.setProgress(i);
			if (i == max) {
				clearInterval(time);
				return;
			}
			i += 10;
		}, 40);
	});
</script>
<script>
	function MyAjaxFunction() {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var flag = xmlhttp.responseText;
				if (flag == "done") {
				    window.location = "sys_manage.jsp";
				}
			}
		}
		xmlhttp.open("GET", "servlet/RunPythonServlet", true);
		xmlhttp.send();
	}
</script>

</head>
<body>

	<%
		response.setCharacterEncoding("utf-8");
	%>

<body onload="MyAjaxFunction()">

	<div style="margin-left:400px;margin-top:200px"
	 id="content">
		<div id="loadBar01" class="loadBar">
			<div>
				<span class="percent"> <i></i> </span>
			</div>
		</div>
		<div id="messge">请等待。。。</div>
	</div>

</body>

</html>
