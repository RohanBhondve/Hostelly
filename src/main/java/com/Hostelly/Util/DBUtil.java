package com.Hostelly.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static final String url = "jdbc:mysql://localhost:3306/jdbcdb";
	private static final String user = "root";
	private static final String password = "mysql@1234";
	
	 static {
	        try {
	            // Load the MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
	
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(url,user,password);
	}
}
