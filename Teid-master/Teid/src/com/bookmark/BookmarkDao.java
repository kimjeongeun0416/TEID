package com.bookmark;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

import com.food.Food;

public class BookmarkDao 
{
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	// 싱글톤
	private static BookmarkDao instance = new BookmarkDao();
	
	private BookmarkDao() {}
	
	public static BookmarkDao getInstance() 
	{
		return instance;
	}
	
	public Connection getConnection() 
	{
		Connection conn = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_db?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false","root","1234");
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	// 데이터베이스 연결 종료
	private void quitDB() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public int delBookmark(String id)
	{
		String strSql = "DELETE FROM bookmark_table WHERE dt_id='" + id + "';";
		int status = 0;
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return status;
	}
	
	
	public int setBookmark(String id, String code, String when)
	{
		String strSql = "";
		int status = 0;
		
		if(Objects.equals(when, "breakfast"))
		{
			strSql = "INSERT INTO bookmark_table VALUES('" + id + "', '" + code + "', null, null, null);";
		}
		else if(Objects.equals(when, "lunch"))
		{
			strSql = "INSERT INTO bookmark_table VALUES('" + id + "', null, '" + code + "', null, null);";
		}
		else if(Objects.equals(when, "dinner"))
		{
			strSql = "INSERT INTO bookmark_table VALUES('" + id + "', null, null, '" + code + "', null);";
		}
		else if(Objects.equals(when, "snack"))
		{
			strSql = "INSERT INTO bookmark_table VALUES('" + id + "', null, null, null, '" + code + "');";
		}
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			status = ps.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return status;
	}
	
	public Bookmark getBookmark(String id)
	{
		Bookmark bookmark = new Bookmark();
		String strSql1 = "SELECT dt_breakfast FROM bookmark_table WHERE dt_id='" + id + "' AND NOT dt_breakfast is NULL;";
		String strSql2 = "SELECT dt_lunch FROM bookmark_table WHERE dt_id='" + id + "' AND NOT dt_lunch is NULL;";
		String strSql3 = "SELECT dt_dinner FROM bookmark_table WHERE dt_id='" + id + "' AND NOT dt_dinner is NULL;";
		String strSql4 = "SELECT dt_snack FROM bookmark_table WHERE dt_id='" + id + "' AND NOT dt_snack is NULL;";
			
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql1);
			rs = ps.executeQuery();
			while(rs.next())
			{
				bookmark.setBreakfast(rs.getString("dt_breakfast"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql2);
			rs = ps.executeQuery();
			while(rs.next())
			{
				bookmark.setLunch(rs.getString("dt_lunch"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql3);
			rs = ps.executeQuery();
			while(rs.next())
			{
				bookmark.setDinner(rs.getString("dt_dinner"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql4);
			rs = ps.executeQuery();
			while(rs.next())
			{
				bookmark.setSnack(rs.getString("dt_snack"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return bookmark;
	}
}
