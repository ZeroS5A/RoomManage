package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.jdbc;
/**
 * Servlet implementation class inport
 */
@WebServlet("/inport")
public class inport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		//System.out.println("getsuccess");
		String name=new String(request.getParameter("name"));
		String sex = new String("");
		if(request.getParameter("sex").equals("0")){
			sex = "ÄÐ";
		}else
		{
			sex = "Å®";
		}
		String tel=new String(request.getParameter("tel"));
		String idcard=new String(request.getParameter("idcard"));
		String room=new String(request.getParameter("room"));
		String intime=new String(request.getParameter("intime"));
		String outtime=new String(request.getParameter("outtime"));
		//System.out.println(name+"\n"+sex+"\n"+tel+"\n"+idcard+"\n"+room+"\n"+intime+"\n"+outtime);
		
		String sql=("update room set name='"+name+"',sex='"+sex+"',phone='"+tel+"',idcard='"+idcard+"',movein='"+intime+"',moveout='"+outtime+"',state=1 where roomid='"+room+"'");
		try {
			int rs=jdbc.writesql(sql);
			System.out.println(rs+sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("/RoomManage/manage/inport.jsp?msg=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
