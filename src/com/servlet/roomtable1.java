package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.db.jdbc;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
/**
 * Servlet implementation class roomtable1
 */
@WebServlet("/roomtable1")
public class roomtable1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public roomtable1() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void Room(){
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String type=request.getQueryString();
		if(type.equals("1")){
			String sql1=("select* from room");
			String sql2=("select* from room where state=1");
			int price=0;
			double row1=0;//int型相除为0
			double row2=0;
			double rs=0;
			try {
				ResultSet rs1=jdbc.readsql(sql1);
				ResultSet rs2=jdbc.readsql(sql2);
				while(rs1.next()){
					row1++;
				}
				while(rs2.next()){
					row2++;
					price+=rs2.getInt(6);
				}
				rs=(row2/row1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//转换成百分比输出
			System.out.println(Integer.parseInt(new DecimalFormat("0").format(rs*100))+"%");
			String persent=(Integer.parseInt(new DecimalFormat("0").format(rs*100))+"%");
			response.getWriter().print(persent+","+price);
		}else if(type.equals("2")){
			String price=new String(request.getParameter("price"));
			String room=new String(request.getParameter("room"));
			String sql=("update room set price='"+price+"' where roomid='"+room+"'");
			System.out.println(sql);
			try {
				int rs=jdbc.writesql(sql);
				response.sendRedirect("/RoomManage/manage/manage.jsp?msg=1");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("/RoomManage/manage/manage.jsp?msg=-1");
			}
		}else if(type.equals("3")){
			String room=new String(request.getParameter("roomadd"));
			String sql=("insert into room (roomid,state) values ('"+room+"','0');");
			System.out.println(sql);
			try {
				int rs=jdbc.writesql(sql);
				response.sendRedirect("/RoomManage/manage/manage.jsp?msg=2");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("/RoomManage/manage/manage.jsp?msg=-2");
			}
		}else if(type.equals("4")){
			String room=new String(request.getParameter("roomdel"));
			String sql=("delete from room where roomid="+room);
			System.out.println(sql);
			try {
				int rs=jdbc.writesql(sql);
				response.sendRedirect("/RoomManage/manage/manage.jsp?msg=3");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("/RoomManage/manage/manage.jsp?msg=-3");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
