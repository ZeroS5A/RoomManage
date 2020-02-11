<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>Manage</title>      
    <base href="<%=basePath%>">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
	<link href="source/css/dashboard.css" rel="stylesheet">
	<script type="text/javascript" src="source/js/jquery-3.4.0.js"></script>
	<script type="text/javascript" src="source/js/vue.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <style type="text/css">
	  body{

	  }
	  #logininfo{
		  color: aliceblue;
		  float: right;
	  }
	  /* !important 表示此样式优先于内置样式*/
	  .nav-1{
		  font-size: 15px !important;
	  }
	    /*鼠标浮动*/
	  .nav-1 a:hover{
		  background-color:#353333 !important;
	  }
	    /*已访问*/
	  .nav-1 a:visited{
		  background-color:#353333 !important;
	  }
	  .active-1 a:focus{
		  color:aliceblue !important;
	  }
	</style>	
  <body onLoad="load()">
	<%
	  	String msg = request.getParameter("msg");
	  	
	  	if(msg !=null && msg.equals("1")){
	  %>
		<script type="text/javascript" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/RoomManage/WebRoot/index.jsp">
			alert("成功修改房价");
		</script>
	  <%
	  	}else if(msg !=null && msg.equals("2")){
	  %>
		<script type="text/javascript">
			alert("成功添加房间");
		</script>
	  <%
	  	}else if(msg !=null && msg.equals("3")){
	  %>
		<script type="text/javascript">
			alert("成功删除房间");
		</script>
	  <%
	  	}
	  %>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">Manage</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" >
          <ul class="nav navbar-nav"style="float: left">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#contact">Help</a></li>
          </ul>
			
		  <ul class="nav navbar-nav"style="float: right">
            <li class="active dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("user") %><span class="caret"></a>
				<ul class="dropdown-menu" role="menu">
					<li class="dropdown-header">Account</li>
					<li><a href="servlet\exit">Logout</a></li>
					<li class="divider"></li>
				</ul>
				</li>
            <li><a>About</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

     <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<p style="color:cornsilk; font-size: 25px;">ManageCenter</p>
          <ul class="nav nav-1 nav-sidebar">
            <li><a href="manage/manage.jsp#">Main</a></li>
            <li><a href="manage/search.jsp#">Search</a></li>
            <li><a href="manage/inport.jsp#">MoveIn</a></li>
            <li><a href="manage/export.jsp#">MoveOut</a></li>
          </ul>
          <ul class="nav nav-1 nav-sidebar">
            <li><a href="manage/manage.jsp#">水电</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header" id="C1"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;<%=basePath%><small id="C2"></small></h1>
          <!--<h2 class="sub-header">Section title</h2>-->
		  <div id="content">		
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">已出租占比：<small id="pgs2" style="font-size: 15px;"></small>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月可收入：￥<small id="pgs3" style="font-size: 15px;"></h3>
				</div>
				<div class="panel-body">
					<div class="progress progress-striped active">
					<div class="progress-bar" role="progressbar" aria-valuenow="60" 
					aria-valuemin="0" aria-valuemax="100" style="width: 0%;" id="pgs">	
					</div>
					<span class="sr-only">40% 完成</span>
					</div>
				</div>
			</div>
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h3 class="panel-title">此处可修改房间租金</h3>
				</div>
				<div class="panel-body">
					<form action="servlet/roomtable1?2" method = "post">
					<p><label style="font-size: 15px">选择需要修改的房间：</label>
						<select id="msg" class="btn btn-default dropdown-toggle" style="width: auto" name="room">
							<option v-for="rm in room" onClick="selroom();">{{rm.room}}</option>
						</select>
						
						<input type="text" placeholder="输入修改后的价格" style="width:auto;height: auto" name="price">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-warning">修改</button>
					</p>
					</form>
					<div style="height: 250px; overflow: auto; margin-bottom: 20px">
						<table class="table table-striped table-hover" id="t1">
						  <thead>
							<tr>
							  <th>房间</th>
							  <th>租金</th>
							  <th>状态</th>
							</tr>
						  </thead>
						  <tbody>
							<tr v-for="rm in room" @click="msg(rm)">		<!-- v-for vue方法,把数组对应为一组元素-->
							  <td>{{rm.room}}</td>
							  <td>￥{{rm.price}}</td>
							  <td>{{rm.state}}</td>
							</tr>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="panel-title">此处可增/删房间</h3>
				</div>
				<div class="panel-body">
					<div class="well col-sm-6" style="height: 100px"><label>增加：</label>
						<form action="servlet/roomtable1?3" method = "post">
						<input type="text" placeholder="输入要增加房间的号码" name="roomadd">
						<button class=" btn btn-success">增加</button>
						</form>
					</div>
					<div class="well col-sm-6" style="height: 100px"><label>删除：</label><br>
						<form action="servlet/roomtable1?4" method = "post">
						<select id="msg2" class="btn btn-default dropdown-toggle" style="width: auto" name="roomdel">
							<option v-for="rm in room">{{rm.room}}</option>
						</select>
						<button class=" btn btn-danger">删除</button>
						</form>
					</div>
				</div>
			</div>
		  </div>
		  <script type="text/javascript">
			  $(function(){
				  $.ajax({
					  type:'get',
					  url:'servlet/roomtable1?1',
					  success:function(rs){
						  //alert(rs);
						  var arr=rs.split(",");
						  var a= document.getElementById("pgs");
						  var b = document.getElementById('pgs2');
						  var c = document.getElementById('pgs3');
						  a.style.width=arr[0];
						  b.innerHTML = arr[0];
						  c.innerHTML = arr[1];
					  },
					  error:function(){
						  alert("servlet error")
					  }
				  })
				  $.ajax({
						type:'get',					//get或post
						url:'servlet/roomtable?3',
						success: function(json){	//请求成功返回数据
								show(json);
						},
						error: function(json){
							alert(JSON.stringify(json));
						}
					});
					function show(json){
						// vue 进行渲染
						var obj=JSON.parse(json);
						//使用JSON.parse把传回的String类型转位json类型
						new Vue({
							el: '#msg',
							data:{
									room:obj,
								 },
							methods:{
								msg:function(rm){
									alert("this");
								}
							}
						});
						new Vue({
							el: '#msg2',
							data:{
									room:obj,
								 },
						});
						new Vue({
							el: '#t1',
							data:{
									room:obj,
								 },
						});
					}
			  });
		  </script>
        </div>
      </div>
    </div>
	<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		function load(){
			if(<%=session.getAttribute("user")%>==null){
				window.location.href="index.jsp";
				alert("登录已过期！请重新登录");
			}
		}
	</script>
  </body>
</html>
