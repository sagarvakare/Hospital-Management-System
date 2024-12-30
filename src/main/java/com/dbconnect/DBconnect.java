package com.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static Connection conn;
	
	public static Connection getcon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","Password@123");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}
}
