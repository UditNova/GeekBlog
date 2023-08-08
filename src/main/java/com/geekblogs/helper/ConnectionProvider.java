package com.geekblogs.helper;

import java.sql.*;

public class ConnectionProvider {
	
	private static Connection con;
	public static Connection getConnection() {
		
		try {
			
			if(con==null) {
				
				//load driver class
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//creating connection
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/geekblog","root","D1kamla");
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
}
