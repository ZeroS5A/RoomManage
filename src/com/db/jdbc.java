package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.servlet.*;

public class jdbc {
	public  static Connection getConnection(){
		String url = "jdbc:sqlserver://localhost:1433;Databasename = RoomManage";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, "sa", "123456");
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public static ResultSet readsql(String sql)throws SQLException{
		Connection conn=getConnection();
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		return rs;
	}
	
	public static int writesql(String sql)throws SQLException{
		int rs=0;
		Connection conn=getConnection();
		Statement stmt=conn.createStatement();
		rs=stmt.executeUpdate(sql);
		return rs;
	}
	
	public static void main(String[] args) throws SQLException {
		System.out.println(getConnection());
		//read();
		String sql="select* from room";
		ResultSet rs=jdbc.readsql(sql);
		while(rs.next()){
			if(rs.getString(9).equals("1")){
				System.out.println("ss");
			}else{
				System.out.println("null");
			}
			System.out.println("-"+rs.getString(9)+"-");
		}
	}
}
