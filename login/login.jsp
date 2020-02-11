<%@ page contentType="text/html" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.servlet.login" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>waitting...</title>
		<%	request.setCharacterEncoding("GBK") ;	%>
		<base href="<%=basePath%>">
	</head>
	<body>
		<%
			Object obj = session.getAttribute("user");
			if(obj!=null){
			System.out.println("session:"+obj);
		%>
			<p>Login success, information:</p>
			<p></p>
			<p></p>		
		<%
			}else{
			
		%>
			<p>ERROR</p>
		<%
			}
		%>
			<p>PATH:<%=basePath%>"</p>
			<p>Welcome,<%=session.getAttribute("user") %>!</p>
		<form action="servlet/login" method="post">
			<p>User:<input type="text"></p>
			<p>Pswd:<input type="password"></p>

		</form>
		<p><input type="button" value="Logout" class="btn btn-primary" onclick="location.href='servlet/exit'"/></p>
		<p><input type="button" value="Next" class="btn btn-primary" onclick="location.href='/RoomManage/manage/manage.jsp'"/></p>
	</body>
</html>
