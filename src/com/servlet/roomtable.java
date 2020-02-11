package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.db.jdbc;

/**
 * Servlet implementation class roomtable2
 */
@WebServlet("/roomtable2")
public class roomtable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public roomtable() {
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
		String type=request.getQueryString();
		String sql="";
		if(type.equals("0")){
			sql=("select* from room where state="+type+"order by roomid");
		}else if(type.equals("1")){
			sql=("select* from room where state="+type+"order by roomid");
		}else if(type.equals("3")){
			sql="select* from room order by roomid";
		}else{
			sql="";
		}	
		JSONArray ja=new JSONArray();
		JSONObject jo=null;
		try {
			ResultSet rs=jdbc.readsql(sql);
			while(rs.next()){
				//System.out.println(rs.getString(1)+"\t"+rs.getString(6)+"\t"+rs.getString(9));
				jo=new JSONObject();
				jo.put("room", rs.getString(1));
				jo.put("name", rs.getString(2));
				jo.put("sex", rs.getString(3));
				jo.put("phone", rs.getString(4));
				jo.put("idcard", rs.getString(5));
				jo.put("price", rs.getString(6));
				jo.put("movein", rs.getString(7));
				jo.put("moveout", rs.getString(8));
				if(rs.getString(9).equals("1")){
					jo.put("state", "已租");
				}else{
					jo.put("state", "空");
				}
				
				ja.add(jo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json=ja.toString();
		System.out.println("住客表:\t"+json);
		response.getWriter().print(ja);
		response.getWriter().flush();
		response.getWriter().close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
