package com.food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.Food;

public class FoodDao 
{
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	// 싱글톤
	private static FoodDao instance = new FoodDao();
	
	private FoodDao() {}
	
	public static FoodDao getInstance() 
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
	
	public String getFoodCode(String name)
	{
		String code = null;
		String strSql = "SELECT fd_code FROM food_table WHERE fd_name='" + name + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			while(rs.next())
			{
				code = rs.getString("fd_code");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return code;
	}

	public Food getFoodInfo(String code)
	{
		Food food = new Food();
		String strSql = "SELECT * FROM food_table WHERE fd_code='" + code + "';";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				food.setCode(rs.getString("fd_code"));
				food.setPart(rs.getString("fd_part"));
				food.setName(rs.getString("fd_name"));
				food.setServing(rs.getFloat("fd_serving"));
				food.setMeasure(rs.getString("fd_measure"));
				food.setKcal(rs.getFloat("fd_kcal"));
				food.setWater(rs.getFloat("fd_water"));
				food.setProtein(rs.getFloat("fd_protein"));
				food.setFat(rs.getFloat("fd_fat"));
				food.setCarbohydrate(rs.getFloat("fd_carbohydrate"));
				food.setSugar(rs.getFloat("fd_sugar"));
				food.setFiber(rs.getFloat("fd_fiber"));
				food.setNatrium(rs.getFloat("fd_natrium"));
				food.setColesterol(rs.getFloat("fd_colesterol"));
				food.setSaturatedfat(rs.getFloat("fd_saturatedfat"));
				food.setTransfat(rs.getFloat("fd_transfat"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return food;
	}
	
	// SELECT * FROM food_table
	public List<Food> getAllFoods(int startRow, int endRow, String cat, String name) 
	{ 
		List<Food> list = null;
		String strSql = "";
		
		if(cat==null && name==null)
		{
			strSql = "SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=?) TMP WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') LIMIT ?, ?;";
		}
		else if(cat.length()>0 && name==null)
		{
			strSql = "SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=?) TMP WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식')"
					+ "AND fd_part='" + cat + "' LIMIT ?, ?;";
		}
		else if(name.length()>0)
		{
			strSql = "SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=?) TMP WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식')"
					+ " AND fd_name like '%" + name + "%' LIMIT ?, ?;";
		}
		else if(cat.length()>0)
		{
			strSql = "SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=?) TMP WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식')"
					+ "AND fd_part='" + cat + "' LIMIT ?, ?;";
		}
		else
		{
			strSql = "SELECT @ROWNUM:=@ROWNUM+1, A.* FROM food_table A, (SELECT @ROWNUM:=?) TMP WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') LIMIT ?, ?;";
		}
		
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			
			ps.setInt(1, startRow); // sql 물음표에 값 매핑
			ps.setInt(2, startRow);
			ps.setInt(3, endRow);

			rs = ps.executeQuery();
			
			list = new ArrayList<>();
			while(rs.next())
			{
				Food ib = new Food();
				ib.setCode(rs.getString("fd_code"));
				ib.setPart(rs.getString("fd_part"));
				ib.setName(rs.getString("fd_name"));
				ib.setServing(rs.getFloat("fd_serving"));
				ib.setMeasure(rs.getString("fd_measure"));
				ib.setKcal(rs.getFloat("fd_kcal"));
				list.add(ib);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}

		return list;
	}
	
	// 총 레코드 수 구하는 로직
	public int getCount()
	{ 
		int count = 0;
		String strSql = "SELECT count(*) FROM food_table";
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			if(rs.next())
			{
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}
		
		return count; // 총 레코드 수 리턴
	}
	
	// SELECT * FROM food_table
	public List<String> getAllPart() 
	{ 
		List<String> list = null;
		
		String strSql = "SELECT DISTINCT fd_part FROM food_table WHERE fd_db NOT IN(\"가공식품\") AND fd_db2 NOT IN('외식');";
		
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			list = new ArrayList<>();
			while(rs.next())
			{
				String part = rs.getString("fd_part");
				list.add(part);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}

		return list;
	}
	
	public List<Food> getThemeFoods(String theme) 
	{ 
		List<Food> list = null;
		String strSql = "SELECT * FROM food_table WHERE fd_db NOT IN('가공식품') AND fd_db2 NOT IN('외식') AND fd_part NOT IN('주류') AND fd_db NOT IN('차류') AND fd_part NOT IN('음료류') AND ";
		strSql += theme;
		try 
		{
			conn = getConnection();
			ps = conn.prepareStatement(strSql);
			rs = ps.executeQuery();
			
			list = new ArrayList<>();
			while(rs.next())
			{
				Food ib = new Food();
				ib.setCode(rs.getString("fd_code"));
				ib.setPart(rs.getString("fd_part"));
				ib.setName(rs.getString("fd_name"));
				ib.setServing(rs.getFloat("fd_serving"));
				ib.setMeasure(rs.getString("fd_measure"));
				ib.setKcal(rs.getFloat("fd_kcal"));
				ib.setWater(rs.getFloat("fd_water"));
				ib.setProtein(rs.getFloat("fd_protein"));
				ib.setFat(rs.getFloat("fd_fat"));
				ib.setCarbohydrate(rs.getFloat("fd_carbohydrate"));
				ib.setSugar(rs.getFloat("fd_sugar"));
				ib.setFiber(rs.getFloat("fd_fiber"));
				ib.setNatrium(rs.getFloat("fd_natrium"));
				ib.setColesterol(rs.getFloat("fd_colesterol"));
				ib.setSaturatedfat(rs.getFloat("fd_saturatedfat"));
				ib.setTransfat(rs.getFloat("fd_transfat"));
				list.add(ib);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			quitDB(); // DB 연결 종료 / Connection 반환
		}

		return list;
	}
}
