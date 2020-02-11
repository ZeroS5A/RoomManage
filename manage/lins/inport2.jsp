<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Inport</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="source/js/vue.js"></script>
	<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style>
	  #image{
	  
		  height:auto;
		  padding: 20px;
	  }
	  #msg1{
		  
		  height:auto;
		  padding: 20px;
	  }
	  #msg2{
		  
		  height:auto;
		  padding: 20px
	  }
	  #msg3{
		  
		  height:auto;
	  }
	</style>
  <body>
	  <div class="container col-sm-12">
	  	<div class="row" style="padding: 20px">
			<form action="servlet/inport" method = "post">
			  <div id="image" class="col-sm-2">
				<img  class=" img-rounded img-responsive" src="source/img/u0.png">
				 <br>
				<input type="button" value="选择" class="btn btn-primary btn-block">
			  </div>
			  <div id="msg1" class="col-sm-4">
					<p><label>姓名：</label><input type="text" name="name"></p>
					<p><label>姓别：</label><input type="radio" name="sex" value="0">男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="1">女</p>
					<p><label>手机：</label><input type="tel" name="tel"></p>
					<p><label>身份证号码：</label></p>
					<p><input type="text" name="idcard" style="width: 185px"</p>
			  </div>
			  <div id="msg2" class="col-sm-4">
					<p><!--<label>楼层：</label><select name="floor"><option selected>请选择</option></select>-->
						<label>房间：</label><select name="room" v-model="selrm"><option v-for="rm in room">{{rm.room}}</option></select>
					 </p>
					<p class="input-group"><label>价格:￥</label>{{price}}</p>
				  	<br><br>
				  	<p><label>入住时间：</label><input type="date" name="intime"></p>
				    <p><label>离开时间：</label><input type="date" name="outtime"></p>
				  	<br>
				  	<div style="float: left;">
				  		<input type="reset" name="重置" class="btn btn-primary">
				  	</div>
				  	<div style="padding-left: 150px;">
				  		<input type="submit" name="提交" class="btn btn-primary">
				  	</div>
			  </div>
			</form>
	  	</div>
		  <br><br>		  
		  <h2 class="sub-header">空余房间</h2>
		<div class="col-sm-10">
		  	<table class="table table-striped" id="t1">
			  <thead>
				<tr>
				  <th>房间</th>
				  <th>租金</th>
				  <th>选择</th>
				</tr>
			  </thead>
			  <tbody>
				<tr v-for="rm in room">		<!-- v-for vue方法,把数组对应为一组元素-->
				  <td>{{rm.room}}</td>
				  <td>￥{{rm.price}}</td>
				  <td><button onClick="clicktable(this)">选择</button></td>
				</tr>
			  </tbody>
			</table>
		</div>
	  </div>
	  <script type="text/javascript">
		 $(function() {
			$.ajax({
				type:'get',					//get或post
				url:'servlet/roomtable1',
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
					el: '#t1',
					data:{
						 	room:obj
						 }
				});
				new Vue({
					el: '#msg2',
					data:{
						 	room:obj,
							selrm:"",
						 }
				});
			}
		})
	  </script>
	  	<script type="text/javascript">
			$("#t1").on('click', function(){
			alert("hello");
			});
		</script>
  </body>
</html>
