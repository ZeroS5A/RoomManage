<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>RoomManage-manage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="../source/js/jquery-3.4.0.js"></script>
	<script type="text/javascript" src="bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
	<style type="text/css">
		body{margin="0" padding="0" height: 100%}
		#wrapper{
			margin: 0 auto;
			height: 100%;
		}
		#head{
			height: 5%;
			background-color: black;
			position: relative;
		}
		#head-logo{
			width: 60px;
			height: 5%;
			position: absolute;
			left:30px;
			padding:0px;
		}
		#head-info{
			width: 160px;
			height: 5%;
			position: absolute;
			left:100px;
			padding:0px;
		}
		#head-login{
			height: 5%;
			position: absolute;
			right: 30px;
			color:aqua;
			padding: 0px;
			float: right;
		}
		#main{
			padding:0px;15px;
		}
		#sidebar{
			height: 90%;
			width: 15%;
			background-color:#434343;
			float: left;
			position: relative;
		}
		#sideul{
			list-style: none;
			position: absolute;
			width: 80%;
			top: 15%;
			left: 5%;
			font-size: 1.5em;
		}
		#sideul li:hover{
			color: aliceblue;
		}
		#mainbar{
			height: 90%;
			width: 83%;
			background-color:#FFFFFB;
			padding-right: 2%;
			float: right;
		}
		#foot{
			height: 5%;
			background-color: black;
		}
		.clear{
			clear: both;
		}
	</style>
	
  <body>
  <div id="wrapper">
		<div id="head">
			<div id="head-logo">
				<div style="font-size: 20px;"align="center"><p style="color: aliceblue">Logo</p></div></div>
	  	  <div id="head-info">
				<div style=""><p style="color: aliceblue; font-size: 20px">Manage</p></div>
			</div>
		  <div id="head-login">
			  	<!--	下拉菜单测试
			  	<li class="dropdown">
			  		<a class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("user") %> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a>wqer</a></li>
						<li><a>fsda</a></li>
					</ul>
			  	</li>
				-->
				<div style="font-size: 20px; float: left"><%=session.getAttribute("user") %></div>
				<div style="font-size: 20px; float: left; margin-left: 10px;"><a href="servlet\exit" style="text-decoration: none">Logout</a></div>
			</div>
		</div>
		<div id="main">
			<div id="sidebar">
				<h1 style="text-align: center; font-size: 30px; color: aliceblue;position: absolute; top: 5%; left: 10%">Manu</h1>
			  <div id="sideul">
					<ul>
						<a href="#" style="text-decoration: none"><li style="list-style: none;"><i class="icon-cube"></i>首页</li></a>
						<br>
						<a href="#" style="text-decoration: none"><li style="list-style: none;">样式</li></a>
					</ul>
				</div>
			</div>
			<div id="mainbar">
				<li class="dropdown">
			  		<a class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("user") %> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a>wqer</a></li>
						<li><a>fsda</a></li>
					</ul>
			  	</li>
			</div>
			<div class="clear"></div>
		</div>
		<div id="foot">
			
		</div>
	</div>
  </body>
</html>
