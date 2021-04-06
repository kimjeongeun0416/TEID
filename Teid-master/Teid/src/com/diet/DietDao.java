package com.diet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.food.Food;


public class DietDao 
{
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	// 싱글톤
	private static DietDao instance = new DietDao();
	
	private DietDao() {}
	
	public static DietDao getInstance() 
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
	
	public Diet getDiet(String id, String date)
	{
		Diet diet = new Diet();
		String strSql = "SELECT * FROM diet_table WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			while(rs.next())
			{
				diet.setId(rs.getString("dt_id"));
				diet.setDate(rs.getString("dt_date"));
				diet.setBreakfast(rs.getString("dt_breakfast"));
				diet.setLunch(rs.getString("dt_lunch"));
				diet.setDinner(rs.getString("dt_dinner"));
				diet.setSnack(rs.getString("dt_snack"));
				diet.setMemo(rs.getString("dt_memo"));
				diet.setScore(rs.getInt("dt_score"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
			
		return diet;
	}
	
	public int setDiet(String id, String date, String breakfast, String lunch, String dinner, String snack, String memo, int score)
	{
		int status = 0;
		String strSql = "";
		
		if(this.hasDiet(id, date))
		{
			strSql = "UPDATE diet_table SET dt_breakfast=CONCAT(IFNULL(dt_breakfast, ''), IFNULL(?,'')), dt_lunch=CONCAT(IFNULL(dt_lunch,''), IFNULL(?,'')) , dt_dinner=CONCAT(IFNULL(dt_dinner,''), IFNULL(?,'')), dt_snack=CONCAT(IFNULL(dt_snack,''), IFNULL(?, '')) WHERE dt_id=? and dt_date=?;";
			
			if(this.hasBreakfast(id, date) && breakfast!=null)
			{
				breakfast = ", " + breakfast;
			}
			if(this.hasLunch(id, date) && lunch!=null)
			{
				lunch = ", " + lunch;
			}
			if(this.hasDinner(id, date) && dinner!=null)
			{
				dinner = ", " + dinner;
			}
			if(this.hasSnack(id, date) && snack!=null)
			{
				snack = ", " + snack;
			}

			try 
			{
				conn = getConnection();
				ps = conn.prepareStatement(strSql);
				ps.setString(1, breakfast);
				ps.setString(2, lunch);
				ps.setString(3, dinner);
				ps.setString(4, snack);
				ps.setString(5, id);
				ps.setString(6, date);
				status = ps.executeUpdate();
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				quitDB(); // DB 연결 종료 / Connection 반환
			}
		}
		else
		{
			strSql = "INSERT INTO diet_table VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
			try 
			{
				conn = getConnection();
				ps = conn.prepareStatement(strSql);
				ps.setString(1, id);
				ps.setString(2, date);
				ps.setString(3, breakfast);
				ps.setString(4, lunch);
				ps.setString(5, dinner);
				ps.setString(6, snack);
				ps.setString(7, memo);
				ps.setLong(8, score);
				status = ps.executeUpdate();
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				quitDB(); // DB 연결 종료 / Connection 반환
			}
		}
				
		return status;
	}
	
	public Boolean hasDiet(String id, String date)
	{
		Boolean ret = false;
		String strSql = "SELECT * FROM diet_table WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				ret = true;
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return ret;
	}
	
	public Boolean hasBreakfast(String id, String date)
	{
		Boolean ret = false;
		String strSql = "SELECT dt_breakfast FROM diet_table WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("dt_breakfast") != null && rs.getString("dt_breakfast").length() != 0)
				{
					ret = true;
				}
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return ret;
	}
	
	public Boolean hasLunch(String id, String date)
	{
		Boolean ret = false;
		String strSql = "SELECT dt_lunch FROM diet_table WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("dt_lunch") != null && rs.getString("dt_lunch").length() != 0)
				{
					ret = true;
				}
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return ret;
	}
	
	public Boolean hasDinner(String id, String date)
	{
		Boolean ret = false;
		String strSql = "SELECT dt_dinner FROM diet_table WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("dt_dinner") != null && rs.getString("dt_dinner").length() != 0)
				{
					ret = true;
				}
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return ret;
	}
	
	public Boolean hasSnack(String id, String date)
	{
		Boolean ret = false;
		String strSql = "SELECT dt_snack FROM diet_table WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("dt_snack") != null && rs.getString("dt_snack").length() != 0)
				{
					ret = true;
				}
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return ret;
	}
	
	public int setMemoScore(String id, String date, String memo, int score)
	{
		int status = 0;
		String strSql = "";
		
		if(this.hasDiet(id, date))
		{
			strSql = "UPDATE diet_table SET dt_memo='" + memo + "', dt_score=" + score + " WHERE dt_id='" + id + "' and dt_date='" + date + "';";
		}
		else
		{
			strSql = "INSERT INTO diet_table VALUES('" + id + "', '" + date + "', null, null, null, null, '" + memo + "'," + 0 + ");";
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
}
