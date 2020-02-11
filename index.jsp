<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome to RoomManage</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"20106",secure:"20111"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
	
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"20106",secure:"20111"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
  <style type="text/css">
  	body{margin="0" padding="0"}
	  #wrapper{
		  width:auto;
		  
	  }
	  #head{
		  height: 30px;
		  background-color:black;
	  }
	  #main{
		  margin: 0px auto;
		  border: 1px solid blue;
	  }
	  #login{
		  position: absolute;
		  top: 20%;left: 0;right: 0;bottom: 0;
		  margin: 0 auto;
		  padding: 20px;
	  }
	  #foot{
		  width: 50%;
		  position: absolute;
		  bottom: auto;
	  }
	  .bgimg{

		  height: auto;
		  max-width: 100%;
	  }
	  .head-left{
		  width: 60px;
		  height: 30px;
		  position: absolute;
		  left: 60px;
		  align-content: center;
	  }
	  .head-right{
		  width:auto;
		  height: 30px;
		  position: absolute;
		  right: 60px;
		  align-content: center;
	  }
	  
	  .main-left{
		  width: 30%;
		  height: auto;
		  position: absolute;
		  top: 30%;
		  left: 60px;
	  }
	  
	  .main-right{
		  width: 30%;
		  height: 50%;
		  position: absolute;
		  top: 30%;
		  left: 60%;
	  }
	  .footfont{
		  align-content: center;
		  position: absolute;
		  background-color: aliceblue;
		  bottom: 1px;
	  }
	  .glass{
          position: absolute;
		  top: 0;left: 0;right: 0;bottom: 0;
		  background:url("source/img/login-1.jpg") no-repeat center top / cover fixed;
		  filter: blur(10px);
       }
  </style>
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/RoomManger/WebRoot/index.jsp" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/RoomManage/WebRoot/index.jsp">
	  <!--状态判断  -->
	  <%
	  	String error = request.getParameter("error");
	  	
	  	if(error !=null && error.equals("1")){
	  %>
		<script type="text/javascript" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/RoomManage/WebRoot/index.jsp">
			alert("用户名或密码错误，请重新登录");
		</script>
	  <%
	  	}else if(error !=null && error.equals("2")){
	  %>
		<script type="text/javascript">
			alert("你已经退出登录，请重新登录");
		</script>
	  <%
	  	}
	  %>
	
	<script language="javascript" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/RoomManger/WebRoot/index.jsp">
	  var time=null;
	  var timering=false;

	  function showtime(){
		  var date =new Date();
		  document.clock.thetime.value=now.toString();
		  time=setTimeout("showtiome()",1000);
		  timering=true;
	  }
	</script>
	<div id="wrapper">
		<div id="head">
			<div align="center" class="head-left" style="color: aliceblue">Title</div>
			<div align="center" class="head-right" style="color: aliceblue">Time:
				<%
				   	Date dNow = new Date( );
					SimpleDateFormat ft = 
				  	new SimpleDateFormat ("yyyy-MM-dd");
				   	out.print(ft.format(dNow));
				%>
			</div>
		</div>

		<div id="mian">
			<img src="source/img/login-1.jpg" class="bgimg"/>
			<div class="main-left">
				<p align="center" style="font-size: 30px">Info</p>
				<p align="center" style="font-size: 20px">Welcome to used this system</p>
			</div>

			<div class="main-right">
				<div class="glass"></div>
				<div style="position: absolute; left:40%"><p align="center" style="font-size: 30px;">Login</p></div>
				<%
					Object obj = session.getAttribute("user");
					System.out.println("index:"+obj);
					if(obj==null){
				 %>
				<div id="login" class = "form-group">
					<form action="servlet/login" method = "post">
						<p align="left">Account：<input type="text" name="id" placeholder="Your Id" class = "form-control"/></p>
						<p align="left">Password：<input type="password" name="pw" placeholder="Your Password" class = "form-control"/></p>
						<!--旧登录
							<label>Account :</label>
							<input type="text" name="id">
							<label>Password:</label>
							<input type="password" name="pw">
						-->
						<div style="margin:0 auto">
							<p align="center" class="checkbox-inline"><input type="radio" checked="checked" name="type" value="admin">Admin
									<input type="radio" name="type" value="user">User
							</p>
							<p align="center"><input type="submit" value="Login" class = "btn btn-primary" id = "submit"/></p>
							<br>
							<p align="right" style="color: aliceblue">Anything for <a href="#">Help</a>?</p>
						</div>
					</form>
				</div>
				<%
					}else{
				 %>
				<div id="login" class = "form-group">
					<br>
					<br>
					<p align="center" style="font-size: 20px">Welcome,<%=session.getAttribute("user") %>!</p>
					<p align="center"><input type="button" value="Login" class="btn btn-primary" onclick="location.href='login/login.jsp'"/></p>
				</div>
				 <%
				 	}
				  %>
			</div>
		</div>

		<div id="foot">
			<p class="footfont">版权所有C2019</p>
		</div>
	</div>
  </body>
</html>
