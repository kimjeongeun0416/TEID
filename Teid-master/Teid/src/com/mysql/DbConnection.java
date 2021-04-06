package com.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
//		try
//		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = 
			DriverManager.getConnection("jdbc:mysql://localhost:3306/food_db?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false","root","1234");
			return conn;
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//			return null;
//		}
		
	}
}
