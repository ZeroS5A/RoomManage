package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.jdbc;

public class login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public boolean dbconn(String user,String passwd){
		Connection conn = new jdbc().getConnection();
		System.out.println(user+"-"+passwd);
		try {	
			String sql = "SELECT * FROM userid WHERE id=? AND pw=?";	
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, user);
			pst.setString(2, passwd);
			
			ResultSet rs = pst.executeQuery();
			boolean result=false;
			if(rs.next()) {
				//System.out.println("Login Success information:");
				result=true;
				System.out.println(result);
				user=rs.getString(1);
				passwd=rs.getString(2);
				//success = true;
				//userid = rs.getInt("id");
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error");
		}
		return false;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String user = new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8");
		String passwd = new String(request.getParameter("pw").getBytes("ISO-8859-1"),"utf-8");
		//System.out.println("get"+user+passwd);		
		if(dbconn(user,passwd)){
			session.setAttribute("user", user);
			response.sendRedirect("/RoomManage/manage/manage.jsp");
		}else{
			response.sendRedirect("/RoomManage/index.jsp?error=1");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);		
	}
	
	public static void print(){
		//System.out.println(user+passwd+type);
	}
	
	public static void main(String[] args){	
		//dbconn();
	}
}
